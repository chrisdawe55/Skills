package org.cmd.skills

class User {

    transient springSecurityService

    static hasMany = [ skills: SkillSet ]

    static belongsTo = [ guild: Guild ]

    Integer rating
    Guild guild
    Integer guildLevel
    Integer deaths
    Boolean playerkiller = false
    Date lastUpdated

    String username
    String password
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static constraints = {
        rating nullable: true
        guild nullable: true
        guildLevel nullable: true
        deaths nullable: true
        playerkiller nullable: true
        lastUpdated nullable: true
        username blank: false, unique: true
        password blank: false
    }

    static mapping = {
        password column: '`password`'
    }

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this).collect { it.role } as Set
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password, username)
    }
    
    String toString() {
        return username
    }
}