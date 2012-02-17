<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="description" content="Discworld MUD Skillpages">
    <meta name="author" content="Balzaar / Kawakisan">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-responsive.css')}" type="text/css">
    <style type="text/css">
      body {
        padding-top: 60px;
      }
    </style>
    
    <g:layoutHead />
    <g:javascript library="jquery" plugin="jquery" />
    <r:layoutResources />
  </head>
  
  <body>
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#">Discworld Skillpages</a>
          <div class="nav-collapse">
            <ul class="nav">
              <li class="active"><g:link controller="default" action="index">Home</g:link></li>
              <li><a href="#about">About</a></li>
              <li><a href="#contact">Contact</a></li>
            </ul>
            <p class="navbar-text pull-right">Logged in as <a href="#"><sec:loggedInUserInfo field="username" /></a></p>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header">Sidebar</li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li class="nav-header">Sidebar</li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">${session.currentNav}</a></li>
              <li class="nav-header">Import</li>
              <li class="${session.currentNav == 'skillsimportSkills' ? 'active' : ''}"><g:link controller="skills" action="importSkills">Import Skills</g:link></li>
              <li><a href="#">Import Score</a></li>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
        
        <div class="span9">
          <g:layoutBody/>
        </div><!--/span-->
      </div><!--/row-->

      <hr />
      <footer>
        <p>&copy; Balzaar / Kawakisan 2012</p>
      </footer>
    </div>

    <script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap.min.js')}" />
    <r:layoutResources />
  </body>
</html>