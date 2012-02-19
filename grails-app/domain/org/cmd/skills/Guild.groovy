package org.cmd.skills

class Guild {

    static hasMany = [ members: User ]
    
    Guild parent
    String name
    
    Boolean root
    
    static constraints = {
        parent (nullable: true)
        name (nullable: false)
        root (nullable: false)
    }
}
