package org.cmd.skills

class Guild {

    static hasMany = [ members: User ]
    
    String longName
    String shortName
    
    Boolean root
    
    static constraints = {
        longName (nullable: false)
        shortName (nullable: false)
        root (nullable: false)
    }
}
