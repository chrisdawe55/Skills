<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
</head>

<body>
  <ul class="breadcrumb">
    <li>
      <g:link controller="default" action="index">Home</g:link> <span class="divider">/</span>
    </li>
    <li class="active">Login</li>
  </ul>
    
  <div class="well">
    <g:if test='${flash.message}'>
      <div class='login_message'>${flash.message}</div>
    </g:if>
    
    <h1>Login</h1>
    <br />
    
    <form action='${postUrl}' method='POST' id='loginForm' autocomplete='on'>
      <label for='username'><g:message code="springSecurity.login.username.label" />:</label>
      <input type='text' class='span2' name='j_username' id='username' />

      <label for='password'><g:message code="springSecurity.login.password.label" />:</label>
      <input type='password' class='span2' name='j_password' id='password' />

      <br />
      <input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}' />
    </form>
  </div>
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
