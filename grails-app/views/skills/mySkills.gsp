<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>Discworld Skillpages</title>
    <meta name="layout" content="main" />
  </head>

  <body>
    <g:if test="${flash.message}">
      <div class="alert alert-info">
        ${flash.message}
      </div>
    </g:if>

    <div class="well">
      <h1>My Skills</h1>
      <br />

      <p><sec:loggedInUserInfo field="username" />, your skills are as follows:</p>

      <ul>
        <g:each in="${skills}" var="skill">
          <li>${skill.skill.name} - ${skill.level} | ${skill.bonus}</li>
        </g:each>
      </ul>
    </div>
  </body>
</html>