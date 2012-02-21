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

      <div class="row-fluid">
        <div class="span6">
          <table class="table table-striped table-condensed">
            <thead>
              <tr>
                <th width="60%">Skill</th>
                <th width="8%">Con</th>
                <th width="8%">Dex</th>
                <th width="8%">Int</th>
                <th width="8%">Str</th>
                <th width="8%">Wis</th>
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
          
          <table class="table table-striped table-condensed">
            <thead>
              <tr>
                <th width="60%">Skill</th>
                <th width="8%">Con</th>
                <th width="8%">Dex</th>
                <th width="8%">Int</th>
                <th width="8%">Str</th>
                <th width="8%">Wis</th>
              </tr>
            </thead>

            <tbody>
              <g:each in="${crafts}" var="skill">
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
          
          <table class="table table-striped table-condensed">
            <thead>
              <tr>
                <th width="60%">Skill</th>
                <th width="8%">Con</th>
                <th width="8%">Dex</th>
                <th width="8%">Int</th>
                <th width="8%">Str</th>
                <th width="8%">Wis</th>
              </tr>
            </thead>

            <tbody>
              <g:each in="${fighting}" var="skill">
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
        
        <div class="span6">
          <table class="table table-striped table-condensed">
            <thead>
              <tr>
                <th width="60%">Skill</th>
                <th width="8%">Con</th>
                <th width="8%">Dex</th>
                <th width="8%">Int</th>
                <th width="8%">Str</th>
                <th width="8%">Wis</th>
              </tr>
            </thead>

            <tbody>
              <g:each in="${covert}" var="skill">
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
          
          <table class="table table-striped table-condensed">
            <thead>
              <tr>
                <th width="60%">Skill</th>
                <th width="8%">Con</th>
                <th width="8%">Dex</th>
                <th width="8%">Int</th>
                <th width="8%">Str</th>
                <th width="8%">Wis</th>
              </tr>
            </thead>

            <tbody>
              <g:each in="${faith}" var="skill">
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
          
          <table class="table table-striped table-condensed">
            <thead>
              <tr>
                <th width="60%">Skill</th>
                <th width="8%">Con</th>
                <th width="8%">Dex</th>
                <th width="8%">Int</th>
                <th width="8%">Str</th>
                <th width="8%">Wis</th>
              </tr>
            </thead>

            <tbody>
              <g:each in="${magic}" var="skill">
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
          
          <table class="table table-striped table-condensed">
            <thead>
              <tr>
                <th width="60%">Skill</th>
                <th width="8%">Con</th>
                <th width="8%">Dex</th>
                <th width="8%">Int</th>
                <th width="8%">Str</th>
                <th width="8%">Wis</th>
              </tr>
            </thead>

            <tbody>
              <g:each in="${people}" var="skill">
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
      </div>
    </div>
  </body>
</html>