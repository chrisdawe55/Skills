package org.cmd.skills

class Guild {

    static hasMany = [ members: User, primaries: Skill ]
    
    Guild parent
    String name
    
    Boolean root
    
    static constraints = {
        parent (nullable: true)
        name (nullable: false)
        root (nullable: false)
    }
}
