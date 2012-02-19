<%@ page contentType="text/html;charset=UTF-8" %>
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
      <li class="active">Import Score</li>
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
      
      <g:hasErrors bean="${cmd}">
	<div class="alert alert-block alert-error">
          <g:renderErrors bean="${cmd}" as="list"/>
	</div>
      </g:hasErrors>
      
      <h1>Import Score</h1>
      <br />

      <p>Import your score here!</p>
      <br />

      <g:form class="form-inline" name="importScoreForm" controller="skills" action="doImportScore" autocomplete="off">
        <g:if test="${username}">
          <g:hiddenField name="username" value="${username}" />
          <g:hiddenField name="password" value="secret" />
          <g:hiddenField name="submitted" value="true" />
        </g:if>
        <g:else>
          <g:hiddenField name="submitted" value="false" />
          <g:textField name="username" class="span2" placeholder="Character Name" value="${cmd?.username}" />
          <g:passwordField name="password" class="span2" placeholder="Password" value="${cmd?.password}" />
        </g:else>
        
        <g:submitButton name="importScoreSubmit" value="Import" /><br /><br />

        <g:textArea name="importScore" class="span8" rows="10" value="${cmd?.importScore}" />
      </g:form>
    </div>
  </body>
</html>