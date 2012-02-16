package org.cmd.skills

class Skill {

    String name
    Boolean root
    Boolean leaf

    static constraints = {
	name (nullable: false, blank: false)
	root (nullable: false)
	leaf (nullable: false)
    }
}