<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.cmd.skills.User;" %>
<html>
  <head>
    <title>Discworld Skillpages</title>
    <meta name="layout" content="main" />
  </head>

  <body>
    <ul class="breadcrumb">
      <li class="active">Home</li>
    </ul>
    
    <div class="well">
      <g:if test="${flash.message}">
        <div class="alert alert-info">
          ${flash.message}
        </div>
      </g:if>
      
      <h1>Discworld Skillpages</h1>
      <br />

      <p>Welcome!</p>
      <br />

      <table class="table-striped">
        <thead>
          <tr>
            <th>Skill</th>
            <th>Con</th>
            <th>Dex</th>
            <th>Int</th>
            <th>Str</th>
            <th>Wis</th>
          </tr>
        </thead>

        <tbody>
          <g:each in="${adventuring}" var="skill">
            <tr>
              <td>${skill.name}</td>
              <td>${skill.constitution}</td>
              <td>${skill.dexterity}</td>
              <td>${skill.intelligence}</td>
              <td>${skill.strength}</td>
              <td>${skill.wisdom}</td>
            </tr>
          </g:each>
        </tbody>
      </table>
    </div>
  </body>
</html>