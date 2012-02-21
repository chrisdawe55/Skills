package org.cmd.skills

class SkillSet {

    static belongsTo = [ user: User ]

    Skill skill
    Integer level
    Integer bonus
    Boolean hidden = false

    static constraints = {
        user (nullable: false)
        skill (nullable: false)
        level (nullable: false)
        bonus (nullable: false)
    }
}