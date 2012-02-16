package org.cmd.skills

import grails.plugins.springsecurity.Secured

class SkillsController {
	
    def springSecurityService

    def index = {
        [skills: Skill.findAll()?.sort { it.name }]
    }
	
    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def login = {
        render 'You are logged in.'
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def importSkills = {
        User user = springSecurityService.currentUser

        [user: user, skills: user.skills?.sort { it.skill.name }]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def doImport = { ImportSkillsCommand cmd ->
        User user = springSecurityService.currentUser

        String[] lines = cmd.importSkills.split("\n")
        String[] skills = ["", "", "", ""]

        lines.each { String line ->
            if (line.contains("=")) {
                return
            }
            String[] parts = line.split()
            int theCount = line.count("|")
            String level = ""
            String bonus = ""

            skills[theCount] = parts[theCount].replace(".", "")

            for (int i = theCount + 1 ; i < 4 ; i++) {
                skills[i] = ""
            }

            Skill theSkill = Skill.findByName((skills[0]) +(skills[1] != '' ? '.' +skills[1] : '') +(skills[2] != '' ? '.' +skills[2] : '') +(skills[3] != '' ? '.' +skills[3] : ''))
            SkillSet usersSkill = SkillSet.findByUserAndSkill(user, theSkill)

            if (parts[theCount + 1] != "-") {
                if (usersSkill) {
                    usersSkill.level = parts[theCount + 1] as Integer
                    usersSkill.bonus = parts[theCount + 2] as Integer
                } else {
                    usersSkill = new SkillSet(user: user, skill: theSkill, level: parts[theCount + 1] as Integer, bonus: parts[theCount + 2] as Integer).save(flush: true)
                }
            }

            log.debug(line)
            log.debug("Skill2: " +theSkill)
            log.debug("Level: " +parts[theCount + 1])
            log.debug("Bonus: " +parts[theCount + 2])
        }

        redirect (action: "importSkills")
    }
}

class ImportSkillsCommand {
    String importSkills
	
    static constraints = {
        importSkills (nullable: false, blank: false)
    } 
}