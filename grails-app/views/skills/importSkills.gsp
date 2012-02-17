<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Discworld Skill Pages</title>
        <meta name="layout" content="main" />
    </head>

    <body>
        <h1>Import Skills</h1>

        <p id="testing">Import your skills here!</p>

        <g:if test="${flash.message}">
            <div id="flash">
                ${flash.message}
            </div>
        </g:if>
        
        <g:form name="importSkillsForm" controller="skills" action="doImport">
            <g:textArea name="importSkills" class="span6" rows="30" />

            <g:submitButton name="importSkillsSubmit" value="Import" />
        </g:form>
        
        <br />
        <p>${user.username}, your skills are as follows:</p>
        
        <ul>
            <g:each in="${skills}" var="skill">
                <li>${skill.skill.name} - ${skill.level} | ${skill.bonus}</li>
            </g:each>
        </ul>
    </body>
</html>