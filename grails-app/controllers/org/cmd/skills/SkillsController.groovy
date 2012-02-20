package org.cmd.skills

import grails.plugins.springsecurity.Secured

class SkillsController {
	
    def springSecurityService

    def index = {
        [skills: Skill.findAll()?.sort { it.name }]
    }
	
    @Secured("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
    def mySkills = {
        User user = User.get(springSecurityService.principal.id)
        
        List levels = user.skills?.sort { it.level }?.reverse()
        List bonuses = user.skills?.sort { it.bonus }?.reverse()
        
        render (view: "show", model: [user: user, levels: levels?.size() > 15 ? levels[0..14] : levels, bonuses: bonuses?.size() > 15 ? bonuses[0..14] : bonuses])
    }
    
    def importSkills = {
        
    }
    
    def importScore = {
        [username: params.username]
    }

    def doImport = { ImportSkillsCommand cmd ->
        if (cmd.hasErrors()) {
            render (view: "importSkills", model: [cmd: cmd])
            return
        }
        
        User user = User.findByUsernameAndPassword(cmd.username, springSecurityService.encodePassword(cmd.password, cmd.username))
        if (!user) {
            if (User.createCriteria().get { ilike ("username", cmd.username) }) {
                flash.error = "Username or password incorrect."
                render (view: "importSkills", model: [cmd: cmd])
                return
            } else {
                Role role = Role.findByAuthority("ROLE_USER")
                user = new User(username: cmd.username, password: cmd.password, enabled: true)
                user.save(flush: true)
                UserRole userRole = UserRole.create(user, role, true)
            }
        }
        
        if (cmd.importSkills.contains("..")) {
            importBranched(cmd, user)
        } else {
            importList(cmd, user)
        }

//        user.lastUpdated = new Date()
//        user.save(flush: true)
    }
    
    def doImportScore = { ImportScoreCommand cmd ->
        if (cmd.hasErrors()) {
            render (view: "importScore", model: [cmd: cmd])
            return
        }
        
        User user = null
        if (cmd.submitted == "true") {
            user = User.findByUsername(cmd.username)
        } else {
            user = User.findByUsernameAndPassword(cmd.username, springSecurityService.encodePassword(cmd.password, cmd.username))
        }

        if (!user) {
            if (User.createCriteria().get { ilike ("username", cmd.username) }) {
                flash.error = "Username or password incorrect."
                render (view: "importScore", model: [cmd: cmd])
                return
            } else {
                Role role = Role.findByAuthority("ROLE_USER")
                user = new User(username: cmd.username, password: cmd.password, enabled: true)
                user.save(flush: true)
                UserRole userRole = UserRole.create(user, role, true)
            }
        }
        
        try {
            String[] lines = cmd.importScore.split("\n")

            lines.each { String line ->
                if (line.contains("current experience")) {
                    String[] parts = line.split()

                    user.rating = Integer.parseInt(parts[parts.findIndexOf{ it == "rating" } + 2].replace(".", ""))

                    user.guildLevel = Integer.parseInt(parts[parts.findIndexOf{ it == "level" } + 1])

                    Guild.list().each {
                        if (line.contains(it.name)) {
                            user.guild = it
                        }
                    }
                }

                if (line.contains("You are registered as a player killer.")) {
                    user.playerkiller = true
                }

                if (line.contains("You have died")) {
                    String[] parts = line.split()

                    user.deaths = Integer.parseInt(parts[parts.findIndexOf{ it == "died" } + 1])
                }
            }
        } catch (Exception e) {
            flash.error = "Error importing score."
            render (view: "importScore", model: [cmd: cmd])
            return
        }
        
        flash.message = "Successfully imported score."
        redirect (action: "search", params: [searchName: user.username])
    }
    
    def search = { params ->
        User user = User.createCriteria().get {
            ilike ("username", params.searchName)
        }
        
        if (!user) {
            flash.error = "User not found."
            render (view: "show", model: [user: null])
            return
        }
        
        List levels = user.skills?.sort { it.level }?.reverse()
        List bonuses = user.skills?.sort { it.bonus }?.reverse()
        
        render (view: "show", model: [user: user, levels: levels?.size() > 15 ? levels[0..14] : levels, bonuses: bonuses?.size() > 15 ? bonuses[0..14] : bonuses])
    }
    
    private void importBranched(ImportSkillsCommand cmd, User user) {
        List newSkills = []
        List updatedSkills = []
        
        try {
            String[] lines = cmd.importSkills.split("\n")
            String[] skills = ["", "", "", ""]
            
            List<String[]> col1 = []
            List<String[]> col2 = []
            List<String[]> col3 = []
            List<String[]> col4 = []

            lines.each { String line ->
                if (line.contains("=")) {
                    return
                }
                
                String[] parts = line.split()
                
                int ind = 0
                boolean carryOn = true
                for (int i = 0 ; i < 4 && carryOn ; i++) {
                    ind = parts.findIndexOf { it.contains(".") }
                    
                    if (i == 0) { col1.add(parts[0..ind + 2]) }
                    else if (i == 1) { col2.add(parts[0..ind + 2]) }
                    else if (i == 2) { col3.add(parts[0..ind + 2]) }
                    else if (i == 3) { col4.add(parts[0..ind + 2]) }
                    
                    if (parts.size() > (ind + 3)) {
                        parts = parts[ind + 3..-1]
                    } else {
                        carryOn = false
                    }
                }
            }
            
            List<String[]> fullList = col1 + col2 + col3 + col4
            
            fullList.each { def parts ->
                int theCount = parts.count { it == "|" }
                String level = ""
                String bonus = ""

                skills[theCount] = parts[theCount].replace(".", "")

                for (int i = theCount + 1 ; i < 4 ; i++) {
                    skills[i] = ""
                }

                Skill theSkill = Skill.findByName((skills[0]) +(skills[1] != '' ? '.' +skills[1] : '') +(skills[2] != '' ? '.' +skills[2] : '') +(skills[3] != '' ? '.' +skills[3] : ''))
                SkillSet usersSkill = SkillSet.findByUserAndSkill(user, theSkill)

                if (parts[theCount + 1] != "-" && parts[theCount + 2] != "-") {
                    if (usersSkill) {
                        if (usersSkill.level != parts[theCount + 1] as Integer || usersSkill.bonus != parts[theCount + 2] as Integer) {
                            updatedSkills.add([skill: usersSkill.skill.name, oldLevel: usersSkill.level, newLevel: parts[theCount + 1] as Integer])
                            usersSkill.level = parts[theCount + 1] as Integer
                            usersSkill.bonus = parts[theCount + 2] as Integer
                            usersSkill.save(flush: true)
                        }
                    } else {
                        usersSkill = new SkillSet(user: user, skill: theSkill, level: parts[theCount + 1] as Integer, bonus: parts[theCount + 2] as Integer).save(flush: true)
                        newSkills.add(usersSkill)
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e)
            flash.error = "Error importing skills."
            render (view: "importSkills", model: [cmd: cmd])
            return
        }
        
        flash.message = "Successfully imported skills."
        render (view: "importScore", model: [username: user.username, newSkills: newSkills, updatedSkills: updatedSkills])
    }
    
    private Boolean importList(ImportSkillsCommand cmd, User user) {
        List newSkills = []
        List updatedSkills = []
        
        try {
            String[] lines = cmd.importSkills.split("\n")
            String[] skills = ["", "", "", ""]

            lines.each { String line ->
                if (line.contains("SKILL")) {
                    return
                }
                String[] parts = line.split()
                String level = ""
                String bonus = ""

                Skill theSkill = Skill.findByName(parts[0])
                SkillSet usersSkill = SkillSet.findByUserAndSkill(user, theSkill)

                if (parts[1] != "X" && parts[2] != "X") {
                    if (usersSkill) {
                        if (usersSkill.level != parts[theCount + 1] as Integer || usersSkill.bonus != parts[theCount + 2] as Integer) {
                            updatedSkills.add([skill: usersSkill.skill.name, oldLevel: usersSkill.level, newLevel: parts[theCount + 1] as Integer])
                            usersSkill.level = parts[1] as Integer
                            usersSkill.bonus = parts[2] as Integer
                        }
                    } else {
                        usersSkill = new SkillSet(user: user, skill: theSkill, level: parts[1] as Integer, bonus: parts[2] as Integer).save(flush: true)
                        newSkills.add(usersSkill)
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e)
            flash.error = "Error importing skills."
            render (view: "importSkills", model: [cmd: cmd])
            return
        }
        
        flash.message = "Successfully imported skills."
        render (view: "importScore", model: [username: user.username, newSkills: newSkills, updatedSkills: updatedSkills])
    }
}

class ImportSkillsCommand {
    String importSkills
    String username
    String password
	
    static constraints = {
        importSkills (nullable: false, blank: false)
        username (nullable: false, blank: false)
        password (nullable: false, blank: false)
    } 
}

class ImportScoreCommand {
    String submitted
    String importScore
    String username
    String password
	
    static constraints = {
        submitted (nullable: false, blank: false)
        importScore (nullable: false, blank: false)
        username (nullable: false, blank: false)
        password (nullable: false, blank: false)
    }
}