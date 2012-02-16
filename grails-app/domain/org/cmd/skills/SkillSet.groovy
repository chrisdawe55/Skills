package org.cmd.skills

class SkillSet {

    static belongsTo = [ user: User ]

    User user

    Skill skill
    int level
    int bonus

    static constraints = {
        skill (nullable: false)
        level (nullable: false)
        bonus (nullable: false)
    }
}