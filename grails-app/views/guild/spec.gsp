<%@ page contentType="text/html;charset=UTF-8" import="org.cmd.skills.Guild" %>
<html>
  <head>
    <title>Discworld Skillpages</title>
    <meta name="layout" content="main" />
  </head>

  <body>
    <ul class="breadcrumb">
      <li>
        <g:link controller="default" action="index">Home</g:link> <span class="divider">/</span>
      </li>
      <li class="active">Choose Specialisation</li>
    </ul>
    
    <div class="well">
      <g:if test="${flash.message}">
        <div class="alert alert-info">
          ${flash.message}
        </div>
      </g:if>

      <h1>Choose a Specialisation</h1>
      <br />

      <div class="row-fluid">
        <div class="span6">
          <g:each in="${guilds1}" var="guild">
            <h3><g:link controller="guild" action="show" id="${guild.id}">${guild.name}</g:link></h3>
            <%
              List subGuilds = Guild.findAllByParent(guild)
            %>
            <ul>
              <g:each in="${subGuilds}" var="subGuild">
                <li><g:link controller="guild" action="show" id="${subGuild.id}">${subGuild.name} (${subGuild.members?.size()})</g:link></li>
              </g:each>
            </ul>
            <br />
          </g:each>
        </div>

        <div class="span6">
          <g:each in="${guilds2}" var="guild">
            <h3><g:link controller="guild" action="show" id="${guild.id}">${guild.name}</g:link></h3>
              <g:if test="${guild.name == 'Wizards'}">
                <div class="row-fluid">
                  <div class="span6">
                    <%
                      Guild circle = Guild.findByName("Circle")
                      Guild hoodwinkers = Guild.findByName("Hoodwinkers")
                      Guild last = Guild.findByName("Last Order")
                      Guild lodgers = Guild.findByName("Lodgers")
                      Guild midnight = Guild.findByName("Midnight")
                      Guild seers = Guild.findByName("Seers")
                      Guild shadows = Guild.findByName("Shadow")
                      Guild stars = Guild.findByName("Silver Star")
                      Guild klatch = Guild.findByName("Klatch")
                      Guild students = Guild.findByName("Students")
                    %>
                    <ul>
                      <li><g:link controller="guild" action="show" id="${circle.id}">${circle.name} (${circle.members?.size()})</g:link></li>
                      <li><g:link controller="guild" action="show" id="${hoodwinkers.id}">${hoodwinkers.name} (${hoodwinkers.members?.size()})</g:link></li>
                      <li><g:link controller="guild" action="show" id="${last.id}">${last.name} (${last.members?.size()})</g:link></li>
                      <li><g:link controller="guild" action="show" id="${lodgers.id}">${lodgers.name} (${lodgers.members?.size()})</g:link></li>
                      <li><g:link controller="guild" action="show" id="${midnight.id}">${midnight.name} (${midnight.members?.size()})</g:link></li>
                      <li><g:link controller="guild" action="show" id="${seers.id}">${seers.name} (${seers.members?.size()})</g:link></li>
                      <li><g:link controller="guild" action="show" id="${shadows.id}">${shadows.name} (${shadows.members?.size()})</g:link></li>
                      <li><g:link controller="guild" action="show" id="${stars.id}">${stars.name} (${stars.members?.size()})</g:link></li>
                      <li><g:link controller="guild" action="show" id="${klatch.id}">${klatch.name} (${klatch.members?.size()})</g:link></li>
                      <li><g:link controller="guild" action="show" id="${students.id}">${students.name} (${students.members?.size()})</g:link></li>
                    </ul>
                  </div>
                  <div class="span6">
                    <%
                      Guild white = Guild.findByName("White")
                      Guild blue = Guild.findByName("Blue")
                      Guild octarine = Guild.findByName("Octarine")
                      Guild red = Guild.findByName("Red")
                      Guild grey = Guild.findByName("Grey")
                      Guild green = Guild.findByName("Green")
                      Guild black = Guild.findByName("Black")
                      Guild brown = Guild.findByName("Brown")
                    %>
                    <ul>
                      <li><g:link controller="guild" action="show" id="${white.id}">${white.name} (${white.members?.size()})</g:link></li>
                      <li><g:link controller="guild" action="show" id="${blue.id}">${blue.name} (${blue.members?.size()})</g:link></li>
                      <li><g:link controller="guild" action="show" id="${octarine.id}">${octarine.name} (${octarine.members?.size()})</g:link></li>
                      <li><g:link controller="guild" action="show" id="${red.id}">${red.name} (${red.members?.size()})</g:link></li>
                      <li><g:link controller="guild" action="show" id="${grey.id}">${grey.name} (${grey.members?.size()})</g:link></li>
                      <li><g:link controller="guild" action="show" id="${green.id}">${green.name} (${green.members?.size()})</g:link></li>
                      <li><g:link controller="guild" action="show" id="${black.id}">${black.name} (${black.members?.size()})</g:link></li>
                      <li><g:link controller="guild" action="show" id="${brown.id}">${brown.name} (${brown.members?.size()})</g:link></li>
                    </ul>
                  </div>
                </div>
              </g:if>
              <g:else>
                <%
                  List subGuilds = Guild.findAllByParent(guild)
                %>
                <ul>
                  <g:each in="${subGuilds}" var="subGuild">
                    <li><g:link controller="guild" action="show" id="${subGuild.id}">${subGuild.name} (${subGuild.members?.size()})</g:link></li>
                  </g:each>
                </ul>
              </g:else>
            <br />
          </g:each>
        </div>
      </div>
    </div>
  </body>
</html>