<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>Discworld Skillpages</title>
    <meta name="layout" content="main" />
  </head>

  <body>
    <div class="well">
      <div class="row-fluid">
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
      </div>
      
      <g:if test="${user}">
        <div class="row-fluid">
          <h1>${user}</h1>
          <br />

          <p>Last Updated <g:formatDate format="dd MMM yyyy" date="${user.lastUpdated}" /></p>
          <p>Level ${user.guildLevel} ${user.guild?.name}</p>
          <br />
        </div>
        
        <div class="row-fluid">
          <div class="span6">
            <h2>Top 15 Levels</h2>
            <table class="table table-bordered table-condensed">
              <thead>
                <tr>
                  <th width="60%">Skill</th>
                  <th width="20%">Level</th>
                  <th width="20%">Bonus</th>
                </tr>
              </thead>
              <tbody>
                <g:each in="${levels}" var="skill">
                  <tr>
                    <td>${skill.skill.name}</td>
                    <td>${skill.level}</td>
                    <td>${skill.bonus}</td>
                  </tr>
                </g:each>
              </tbody>
            </table>
          </div>
          
          <div class="span6">
            <h2>Top 15 Bonuses</h2>
            <table class="table table-bordered table-condensed">
              <thead>
                <tr>
                  <th width="60%">Skill</th>
                  <th width="20%">Level</th>
                  <th width="20%">Bonus</th>
                </tr>
              </thead>
              <tbody>
                <g:each in="${bonuses}" var="skill">
                  <tr>
                    <td>${skill.skill.name}</td>
                    <td>${skill.level}</td>
                    <td>${skill.bonus}</td>
                  </tr>
                </g:each>
              </tbody>
            </table>
          </div>
        </div>
      </g:if>
      <g:else>
        <h1>Skills</h1>
        <br />
        
        <p>Sorry, that user was not found.</p>
      </g:else>
    </div>
  </body>
</html>