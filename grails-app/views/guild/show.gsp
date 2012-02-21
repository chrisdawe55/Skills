<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>Discworld Skillpages</title>
    <meta name="layout" content="main" />
  </head>

  <body>
    <ul class="breadcrumb">
      <li><g:link controller="default" action="index">Home</g:link> <span class="divider">/</span></li>
      <li><g:link controller="guild" action="spec">Choose Specialisation</g:link> <span class="divider">/</span></li>
      <li class="active">Show Guild</li>
    </ul>
    
    <div class="well">
      <g:if test="${flash.message}">
        <div class="alert alert-info">
          ${flash.message}
        </div>
      </g:if>

      <g:if test="${flash.error}">
        <div class="alert alert-error">
          ${flash.error}
        </div>
      </g:if>
      
      <h1>${guild ? (guild.parent ? "${guild.parent} - ${guild}" : "${guild}") : "Guild"}</h1>
      <g:if test="${guild}">
        <br />

        <div class="row-fluid">
          <div class="span6">
            <h3>Top 15</h3>
            <table class="table table-bordered table-condensed table-striped">
              <thead>
                <tr>
                  <th width="70%">Member</th>
                  <th width="30%">Guild Level</th>
                </tr>
              </thead>
              <tbody>
                <g:each in="${members}" var="member">
                  <tr style="cursor: pointer;" onclick="location.href='<g:createLink controller='skills' action='show' id='${member.id}' />'">
                    <td>${member}</td>
                    <td>${member.guildLevel}</td>
                  </tr>
                </g:each>
              </tbody>
            </table>
          </div>
          
          <div class="span6">
            <h3>Who Would Be Top 15</h3>
            <table class="table table-bordered table-condensed table-striped">
              <thead>
                <tr>
                  <th width="60%">Member</th>
                  <th width="20%">Guild</th>
                  <th width="20%">Guild Level</th>
                </tr>
              </thead>
              <tbody>
                <g:each in="${[0..2]}" var="member">
                  <tr>
                    <td>Someone</td>
                    <td>Some Guild</td>
                    <td>428</td>
                  </tr>
                </g:each>
              </tbody>
            </table>
          </div>
        </div>
      </g:if>
    </div>
  </body>
</html>