package org.cmd.skills

class DefaultController {
	
    def springSecurityService

    def index = {
        List skills = Skill.list()
        
        List adventuring = skills.findAll { it.name.startsWith("adventuring") }.sort { it.name }
        List covert = skills.findAll { it.name.startsWith("covert") }.sort { it.name }
        List crafts = skills.findAll { it.name.startsWith("crafts") }.sort { it.name }
        List faith = skills.findAll { it.name.startsWith("faith") }.sort { it.name }
        List fighting = skills.findAll { it.name.startsWith("fighting") }.sort { it.name }
        List magic = skills.findAll { it.name.startsWith("magic") }.sort { it.name }
        List people = skills.findAll { it.name.startsWith("people") }.sort { it.name }
        
        [adventuring: adventuring, covert: covert, crafts: crafts, faith: faith, fighting: fighting, magic: magic, people: people]
    }
}