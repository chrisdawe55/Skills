<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Discworld Skillpages</title>
        <meta name="layout" content="main" />
    </head>

    <body>
        <h1>Discworld Skill Pages</h1>

        <p>Welcome!</p>

        <g:if test="${flash.message}">
            <div id="flash">
                ${flash.message}
            </div>
        </g:if>
        
        <ul>
            <g:each in="${skills}" var="skill">
                <li>${skill.name}</li>
            </g:each>
        </ul>
    </body>
</html>