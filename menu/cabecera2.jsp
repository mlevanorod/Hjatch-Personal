<%@ include file="../conectadb.jsp"%>
<%@ include file="../conectadb2.jsp"%>
<%@ include file="../conectadb3.jsp"%>
<%@ include file="id.jsp"%>
<%@ include file="../seguro.jsp"%>

<!DOCTYPE html>
<!--

TABLE OF CONTENTS.

Use search to find needed section.

=====================================================

|  1. $BODY                 |  Body                 |
|  2. $MAIN_NAVIGATION      |  Main navigation      |
|  3. $NAVBAR_ICON_BUTTONS  |  Navbar Icon Buttons  |
|  4. $MAIN_MENU            |  Main menu            |
|  5. $GRID                 |  Grid                 |

=====================================================

-->


<!--[if IE 8]>         <html class="ie8"> <![endif]-->
<!--[if IE 9]>         <html class="ie9 gt-ie8"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="gt-ie8 gt-ie9 not-ie"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>Servicio de Personal</title>
	<meta name="viewport" content="width=device-width, user-scalable=no">

	<!-- Open Sans font from Google CDN -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300&subset=latin" rel="stylesheet" type="text/css">

	<!-- Pixel Admin's stylesheets -->
	<link href="../assets/stylesheets/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="../assets/stylesheets/pixel-admin.min.css" rel="stylesheet" type="text/css">
	<link href="../assets/stylesheets/widgets.min.css" rel="stylesheet" type="text/css">
	<link href="../assets/stylesheets/rtl.min.css" rel="stylesheet" type="text/css">
	<link href="../assets/stylesheets/themes.min.css" rel="stylesheet" type="text/css">

	<!--[if lt IE 9]>
		<script src="assets/javascripts/ie.min.js"></script>
	<![endif]-->

	<style>
		h4 {
			margin-bottom: 20px;
			margin-top: 30px;
		}
		.grid-example .row {
			margin-bottom: 20px;
			margin-left: 0;
			margin-right: 0;
		}
		.grid-example [class*="col-"] {
			background: #f2f2f2;
			background: rgba(0,0,0,.05);
			border: 1px solid;
			border-color: #d9d9d9;
			border-color: rgba(0,0,0,.1);
			padding-bottom: 10px;
			padding-top: 10px;
			text-align: center;
			-webkit-transition: all .3s;
			-moz-transition: all .3s;
			-ms-transition: all .3s;
			-o-transition: all .3s;
			transition: all .3s;
		}
		.grid-example [class*="col-"]:hover {
			background: #d9d9d9;
			background: rgba(0,0,0,.1);
		}

		.wrapper1, .wrapper2 { width: 100%; overflow-x: scroll; overflow-y: hidden; }
		.wrapper1 { height: 20px; }
		.wrapper2 {}
		.div1 { height: 20px; }
		.div2 { overflow: none; }

	</style>

</head>


<!-- 1. $BODY ======================================================================================
	
	Body

	Classes:
	* 'theme-{THEME NAME}'
	* 'right-to-left'      - Sets text direction to right-to-left
	* 'main-menu-right'    - Places the main menu on the right side
	* 'no-main-menu'       - Hides the main menu
	* 'main-navbar-fixed'  - Fixes the main navigation
	* 'main-menu-fixed'    - Fixes the main menu
	* 'main-menu-animated' - Animate main menu
-->
<body class="theme-default main-menu-animated">

<script>var init = [];</script>
<!-- Demo script --> <script src="../assets/demo/demo.js"></script> <!-- / Demo script -->

<div id="main-wrapper">


<!-- 2. $MAIN_NAVIGATION ===========================================================================

	Main navigation
-->
	<div id="main-navbar" class="navbar navbar-inverse" role="navigation">
		<!-- Main menu toggle -->
		<button type="button" id="main-menu-toggle"><i class="navbar-icon fa fa-bars icon"></i><span class="hide-menu-text">HIDE MENU</span></button>
		
		<div class="navbar-inner">
			<!-- Main navbar header -->
			<div class="navbar-header">

				<!-- Logo -->
				<a href="index.html" class="navbar-brand">
					<div><img alt="Pixel Admin" src="../images/icon4.jpg"></div>
					Personal
				</a>

				<!-- Main navbar toggle -->
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-navbar-collapse"><i class="navbar-icon fa fa-bars"></i></button>

			</div> <!-- / .navbar-header -->

			<div id="main-navbar-collapse" class="collapse navbar-collapse main-navbar-collapse">
				<div>


					<div class="right clearfix">
						<ul class="nav navbar-nav pull-right right-navbar-nav">

<!-- 3. $NAVBAR_ICON_BUTTONS =======================================================================

							Navbar Icon Buttons

							NOTE: .nav-icon-btn triggers a dropdown menu on desktop screens only. On small screens .nav-icon-btn acts like a hyperlink.

							Classes:
							* 'nav-icon-btn-info'
							* 'nav-icon-btn-success'
							* 'nav-icon-btn-warning'
							* 'nav-icon-btn-danger' 
-->

							<li class="dropdown">
								<a href="#" class="dropdown-toggle user-menu" data-toggle="dropdown">
									<img src="../assets/demo/avatars/7.jpg">
									<span><%=usu_nombre%></span>
								</a>
								<ul class="dropdown-menu">
									<!--
									<li><a href="#"><span class="label label-warning pull-right">New</span>Profile</a></li>
									<li><a href="#"><span class="badge badge-primary pull-right">New</span>Account</a></li>
									-->
									<li><a href="#" id="cambio_clave"><i class="dropdown-icon fa fa-unlock-alt"></i>&nbsp;&nbsp;Cambio de Clave</a></li>
									<li class="divider"></li>
									<li><a href="../index.jsp"><i class="dropdown-icon fa fa-power-off"></i>&nbsp;&nbsp;Log Out</a></li>
								</ul>
							</li>
						</ul> <!-- / .navbar-nav -->
					</div> <!-- / .right -->
				</div>
			</div> <!-- / #main-navbar-collapse -->
		</div> <!-- / .navbar-inner -->
	</div> <!-- / #main-navbar -->
<!-- /2. $END_MAIN_NAVIGATION -->


<!-- 4. $MAIN_MENU =================================================================================

		Main menu
		
		Notes:
		* to make the menu item active, add a class 'active' to the <li>
		  example: <li class="active">...</li>
		* multilevel submenu example:
			<li class="mm-dropdown">
			  <a href="#"><span class="mm-text">Submenu item text 1</span></a>
			  <ul>
				<li>...</li>
				<li class="mm-dropdown">
				  <a href="#"><span class="mm-text">Submenu item text 2</span></a>
				  <ul>
					<li>...</li>
					...
				  </ul>
				</li>
				...
			  </ul>
			</li>
-->
	<div id="main-menu" role="navigation">
		<div id="main-menu-inner">
			<div class="menu-content top" id="menu-content-demo">
				<!-- Menu custom content demo
					 CSS:        styles/pixel-admin-less/demo.less or styles/pixel-admin-scss/_demo.scss
					 Javascript: html/assets/demo/demo.js
				 -->
				<div>
					<div class="text-bg"><span class="text-slim">Bienvenido</span>
				</div>
				<div>
					<span class="text-semibold"><%=usu_nombre%></span>
				</div>

					<img src="../assets/demo/avatars/7.jpg" alt="" class="">
					<div class="btn-group">
						<a href="#" class="btn btn-xs btn-primary btn-outline dark"><i class="fa fa-envelope"></i></a>
						<a href="#" class="btn btn-xs btn-primary btn-outline dark"><i class="fa fa-user"></i></a>
						<a href="#" class="btn btn-xs btn-primary btn-outline dark"><i class="fa fa-cog"></i></a>
						<a href="#" class="btn btn-xs btn-danger btn-outline dark"><i class="fa fa-power-off"></i></a>
					</div>
					<a href="#" class="close">&times;</a>
				</div>
			</div>
			<ul class="navigation">

<%
		COMANDO = " select	icono, "+
					"		nombre, "+
					"		id_menu "+
					" from	[SIGSALUD].[dbo].acceso_menu "+
					"where	dni   = '"+s_login+"' "+
					"  and 	id_am = '"+id_modulo+"' "+
					"  and  estado = '1' "+
					" order by orden ";
			rset = stmt.executeQuery(COMANDO);
			while(rset.next())
			{
%>
				<li class="mm-dropdown">
					<a href="#"> <%=rset.getString("icono")%> <span class="mm-text"><%=rset.getString("nombre")%></span></a>
				
					<ul>	
<%
			COMANDO2 = "select "+
						"		isnull(icono,' ') as icono, "+
						"		nombre, "+
						"		url, "+
						"		id_submenu "+
						" from	[SIGSALUD].[dbo].acceso_submenu "+
						"where	dni   = '"+s_login+"' "+
						"  and 	id_am = '"+id_modulo+"' "+
						"  and  estado = '1' "+
						"  and  id_menu = '"+rset.getString("id_menu")+"' "+
						" order by orden ";

				rset2 = stmt2.executeQuery(COMANDO2);
				while(rset2.next())
				{
%>
						<li>
							<a tabindex="-1" href="<%=rset2.getString("url")%>"><%=rset2.getString("icono")%><span class="mm-text"><%=rset2.getString("nombre")%></span></a>
						</li>
<%
				}
%>					</ul>
				</li>
<%			}
%>
			</ul> <!-- / .navigation -->
			<div class="menu-content">
				<a href="../index.jsp" class="btn btn-primary btn-block btn-outline dark">Salir Sesi&oacute;n</a>
			</div>
		</div> <!-- / #main-menu-inner -->
	</div> <!-- / #main-menu -->
<!-- /4. $MAIN_MENU -->


	<div id="content-wrapper">