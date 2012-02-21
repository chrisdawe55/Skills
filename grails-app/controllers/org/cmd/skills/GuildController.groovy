package org.cmd.skills

import grails.plugins.springsecurity.Secured

class GuildController {
	
    def springSecurityService

    def index = {
        redirect (action: "spec")
    }
    
    def spec = {
        List guilds = Guild.findAllByRoot(true)
        guilds = guilds?.sort { it.name }
        
        [guilds1: guilds[0..3], guilds2: guilds[4..6]]
    }
    
    def show = {
        Guild guild = Guild.get(params.id)
        if (!guild) {
            flash.error = "Guild or specialisation not found."
            render (view: "show")
            return
        }
        
        def members = guild.members
        if (guild.root) {
            List subGuilds = Guild.findAllByParent(guild)
            
            subGuilds.each { members.addAll(it.members) }
        }
        
        members = members?.sort { it.guildLevel }?.reverse()
        [guild: guild, members: members.size() > 15 ? members[0..14] : members]
    }
    
    def listMembers = {
        System.out.println("** Users: " +User.list())
        
        redirect (action: "spec")
    }
}