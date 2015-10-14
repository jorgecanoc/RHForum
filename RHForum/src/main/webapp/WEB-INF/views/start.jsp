<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>Red Hat | Forum Mexico</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport"/>
<meta content="App for Red Hat Forum Mexico" name="description"/>
<meta content="jcano@redhat.com" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>

<link href='<c:url value="/resources/assets/plugins/font-awesome/css/font-awesome.min.css"/>' rel="stylesheet" type="text/css"/>
<link href='<c:url value="/resources/assets/plugins/bootstrap/css/bootstrap.min.css"/>' rel="stylesheet" type="text/css"/>

<link href='<c:url value="/resources/css/components.css"/>' id="style_components" rel="stylesheet" type="text/css"/>
<link href='<c:url value="/resources/css/layout.css"/>' rel="stylesheet" type="text/css"/>
<link rel="shortcut icon" href='<c:url value="/resources/img/ico_redhat.ico"/>'/>
</head>
<!-- END HEAD -->
<c:set var="context" value="${pageContext.request.contextPath}"/>

<script type="text/javascript">
	var context = "${context}";
	var winners = new Object();
</script>
<!-- BEGIN BODY -->
<body class="page-quick-sidebar-over-content">
	 <input name="winnerHidden" type="hidden" name="winnerHidden"> 
	<!-- BEGIN MAIN LAYOUT -->
	<!-- HEADER BEGIN -->
    <header class="page-header">
        <nav class="navbar" role="navigation">
            <div class="container-fluid">
                <div class="havbar-header">
                	<!-- BEGIN LOGO -->
                    <a id="index" class="navbar-brand" href="start.html">
                        <img src='<c:url value="/resources/img/l_redhat-reverse.png"/>' alt="Logo">
                    </a>
                	<!-- END LOGO -->

	                <!-- BEGIN TOPBAR ACTIONS -->
	                <div class="topbar-actions">
		                <div class="btn-group-img btn-group">
							<ul class="dropdown-menu-v2" role="menu">
							</ul>
						</div>
						<!-- END USER PROFILE -->
					</div>
	                <!-- END TOPBAR ACTIONS -->
                </div>
            </div>
            <!--/container-->
        </nav>
    </header>
	<!-- HEADER END -->

	<!-- PAGE CONTENT BEGIN -->
    <div class="page-content" id="workarea">
    	<div class="container" >
    		<!-- Center Wrap BEGIN -->
    		<div class="center-wrap">
    			<div class="center-align">
    				<div class="center-body">    				
			    		<div class="row">
			    			<div class="col-sm-6 margin-bottom-30">
			    				<a class="webapp-btn" onclick="sendRequestAjax('pickWinner','workarea');" >
			    					<h3>Pick a Winner</h3>
			    					<p>Select winner from contest</p>
			    				</a>
			    			</div>
			    			<div class="col-sm-6 margin-bottom-30">
			    				<a class="webapp-btn" onclick="sendRequestAjax('dashboard','workarea');">
			    					<h3>Winners</h3>
			    					<p>View Winners Reports</p>
			    				</a>
			    			</div>
			    		</div>
					</div>
				</div>
			</div>
			<!-- Copyright BEGIN -->
			<p class="copyright">2015 © Red Hat. 
	 			<a href="http://www.redhat.com" title="http://www.redhat.com" target="_blank">Red Hat Forum 2015</a>
	 		</p>
			<!-- Copyright END -->
    	</div>
    </div>
	<!-- PAGE CONTENT END -->
    <!-- END MAIN LAYOUT -->

<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src='<c:url value="/resources/js/respond.min.js"/>'></script>
<script src='<c:url value="/resources/js/excanvas.min.js"/>'></script> 
<![endif]-->
<script src='<c:url value="/resources/js/plugins/jquery.min.js"/>'type="text/javascript"></script>

<script src='<c:url value="/resources/js/layout.js"/>' type="text/javascript"></script>
<script src='<c:url value="/resources/js/utils.js"/>'type="text/javascript"></script>
<script src='<c:url value="/resources/js/pickwinner/three.min.js"/>'></script>
<script src='<c:url value="/resources/js/pickwinner/tween.min.js"/>'></script>
<script src='<c:url value="/resources/js/pickwinner/TrackballControls.js"/>'></script>
<script src='<c:url value="/resources/js/pickwinner/CSS3DRenderer.js"/>'></script>
<script>
jQuery(document).ready(function() {    
   	Layout.init(); // init layout
});
</script>
</body>
</html>