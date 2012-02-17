package org.cmd.skills

class SkillSet {

    static belongsTo = [ user: User ]

    User user

    Skill skill
    Integer level
    Integer bonus
    Boolean hidden = false

    static constraints = {
        skill (nullable: false)
        level (nullable: false)
        bonus (nullable: false)
    }
}