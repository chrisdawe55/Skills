package org.cmd.skills

class Skill {

    String name
    Boolean root
    Boolean leaf
    
    Integer constitution
    Integer dexterity
    Integer intelligence
    Integer strength
    Integer wisdom

    static constraints = {
	name (nullable: false, blank: false)
	root (nullable: false)
	leaf (nullable: false)
        
        constitution (nullable: true)
        dexterity (nullable: true)
        intelligence (nullable: true)
        strength (nullable: true)
        wisdom (nullable: true)
    }
}