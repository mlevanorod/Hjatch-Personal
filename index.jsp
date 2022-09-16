<%@ include file="conectadb3.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]>         <html class="ie8"> <![endif]-->
<!--[if IE 9]>         <html class="ie9 gt-ie8"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="gt-ie8 gt-ie9 not-ie"> <!--<![endif]-->
<%

        HttpSession xsession = request.getSession(true);
        xsession.setAttribute("id_punto", "");
        xsession.setAttribute("id_modulo", "");
        xsession.setAttribute("accesos", "");
        xsession.setAttribute("id_session", "");
        xsession.setAttribute("login", "");
        xsession.setAttribute("ip", "");
        xsession.setAttribute("id_personal", "");
        xsession.setAttribute("id_tienda", "");

    
%>

<%
            String s_empresa = "-";
            COMANDO3 = " select nombre empresa from acceso_modulo where id_am = '11020212552901091031'    ";
            rset3 = stmt3.executeQuery(COMANDO3);
            if (rset3.next()) {
                s_empresa = rset3.getString("empresa");
            }
%>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Software de Control de Asistencia</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">

    <!-- Open Sans font from Google CDN -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300&subset=latin" rel="stylesheet" type="text/css">

    <!-- Pixel Admin's stylesheets -->
    <link href="assets/stylesheets/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="assets/stylesheets/pixel-admin.min.css" rel="stylesheet" type="text/css">
    <link href="assets/stylesheets/pages.min.css" rel="stylesheet" type="text/css">
    <link href="assets/stylesheets/rtl.min.css" rel="stylesheet" type="text/css">
    <link href="assets/stylesheets/themes.min.css" rel="stylesheet" type="text/css">

    <!--[if lt IE 9]>
        <script src="assets/javascripts/ie.min.js"></script>
    <![endif]-->


<!-- $DEMO =========================================================================================

    Remove this section on production
-->
    <style>
        #signup-demo {
            position: fixed;
            right: 0;
            bottom: 0;
            z-index: 10000;
            background: rgba(0,0,0,.6);
            padding: 6px;
            border-radius: 3px;
        }
        #signup-demo img { cursor: pointer; height: 40px; }
        #signup-demo img:hover { opacity: .5; }
        #signup-demo div {
            color: #fff;
            font-size: 10px;
            font-weight: 600;
            padding-bottom: 6px;
        }
    </style>
<!-- / $DEMO -->

</head>


<!-- 1. $BODY ======================================================================================
    
    Body

    Classes:
    * 'theme-{THEME NAME}'
    * 'right-to-left'     - Sets text direction to right-to-left
-->
<body class="theme-default page-signup">

<script>
    var init = [];
    init.push(function () {
        var $div = $('<div id="signup-demo" class="hidden-xs"><div>PAGE BACKGROUND</div></div>'),
            bgs  = [ 'assets/demo/signin-bg-1.jpg', 'assets/demo/signin-bg-2.jpg', 'assets/demo/signin-bg-3.jpg',
                     'assets/demo/signin-bg-4.jpg', 'assets/demo/signin-bg-5.jpg', 'assets/demo/signin-bg-6.jpg',
                     'assets/demo/signin-bg-7.jpg', 'assets/demo/signin-bg-8.jpg', 'assets/demo/signin-bg-9.jpg' ];
        for (var i=0, l=bgs.length; i < l; i++) $div.append($('<img src="' + bgs[i] + '">'));
        $div.find('img').click(function () {
            var img = new Image();
            img.onload = function () {
                $('#page-signup-bg > img').attr('src', img.src);
                $(window).resize();
            }
            img.src = $(this).attr('src');
        });
        $('body').append($div);
    });
</script>
<!-- Demo script --> <script src="assets/demo/demo.js"></script> <!-- / Demo script -->

    <!-- Page background -->
    <div id="page-signup-bg">
        <!-- Background overlay -->
        <div class="overlay"></div>
        <!-- Replace this with your bg image -->
        <img src="assets/demo/signin-bg-1.jpg" alt="">
    </div>
    <!-- / Page background -->

    <!-- Container -->
    <div class="signup-container">
        <!-- Header -->
        <div class="signup-header">
            <a href="index.html" class="logo">
                <img src="images/icon3.jpg" alt="" style="margin-top: -5px;">&nbsp;
                <%=s_empresa%>
            </a> <!-- / .logo -->
            <div class="slogan">
                SOFTWARE DE <%=s_empresa%>
            </div> <!-- / .slogan -->
        </div>
        <!-- / Header -->

        <!-- Form -->
        <div class="signup-form">
            <form action="index.html" id="datos1">
                
                <div class="signup-text">
                    <span>Ingrese los datos: </span>
                </div>

                <div class="form-group w-icon">
                    <input type="text" name="f_login" id="f_login" class="form-control input-lg" placeholder="Username">
                    <span class="fa fa-user signup-form-icon"></span>
                </div>

                <div class="form-group w-icon">
                    <input type="password" name="f_passwd" id="f_passwd" class="form-control input-lg" placeholder="Password">
                    <span class="fa fa-lock signup-form-icon"></span>
                </div>

                <div class="form-actions">
                    <input type="submit" id="login" name="login" value="Iniciar Sesi&oacute;n" class="signup-btn bg-primary">
                </div>
            </form>
            <!-- / Form -->
        </div>
        <!-- Right side -->
    </div>

        <div class="have-account">
        Desea cargar de nuevo? <a href="index.jsp">Recargar</a>
    </div>


<!-- Get jQuery from Google CDN -->
<!--[if !IE]> -->
    <script type="text/javascript"> window.jQuery || document.write('<script src="js/jquery.min.js">'+"<"+"/script>"); </script>
<!-- <![endif]-->
<!--[if lte IE 9]>
    <script type="text/javascript"> window.jQuery || document.write('<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js">'+"<"+"/script>"); </script>
<![endif]-->


<!-- Pixel Admin's javascripts -->
<script src="assets/javascripts/bootstrap.min.js"></script>
<script src="assets/javascripts/pixel-admin.min.js"></script>
<script language="Javascript">document.oncontextmenu = function(){return false}</script>

<script type="text/javascript">
    // Resize BG
    init.push(function () {
        var $ph  = $('#page-signup-bg'),
            $img = $ph.find('> img');

        $(window).on('resize', function () {
            $img.attr('style', '');
            if ($img.height() < $ph.height()) {
                $img.css({
                    height: '100%',
                    width: 'auto'
                });
            }
        });

    });


    var y;
    y=$(document);
    y.ready(inicializarEvento);
    
    function inicializarEvento(){ 
        var fc = $("#f_login");
        fc.focus();
        $('#datos1 :text').addClass("inputext");
        $('#datos1 :password').addClass("inputext");
        $('#datos1 :submit').addClass("inpusubmit");
    }
    
    $(document).ready(
        function(){ $("#datos1").validate({
            rules: {
                f_login: {
                    required: true,
                    maxlength: 50
                },
                f_passwd: {
                    required: true,
                    maxlength: 50
                }
            },
            messages: { f_login:{required:""},f_passwd:{required:""} },         
            submitHandler: function(){
                $('#login').attr("disabled","disabled");
                $('#f_login').attr("disabled","disabled");
                $('#f_passwd').attr("disabled","disabled");
                $.post("frames.jsp",{ f_login:$('#f_login').val(),f_passwd:$('#f_passwd').val() } ,function(data){
                    if(data == 2){
                        alert('.: NOMBRE DE USUARIO O CLAVE DE ACCESO INCORRECTOS :.');
                        $('#login').removeAttr("disabled","disabled");
                        $('#f_login').removeAttr("disabled","disabled");
                        $('#f_passwd').removeAttr("disabled","disabled");
                        $('#f_login').focus();
                    }else if(data == 3){
                    alert('.: SU NOMBRE DE USUARIO NO ESTA VINCULADO :.');
                    $('#login').removeAttr("disabled","disabled");
                    $('#f_login').removeAttr("disabled","disabled");
                    $('#f_passwd').removeAttr("disabled","disabled");
                    $('#f_login').focus();
                }else if(data == 4){
                alert('.: SU USUARIO ESTA BLOQUEADA :.');
                $('#login').removeAttr("disabled","disabled");
                $('#f_login').removeAttr("disabled","disabled");
                $('#f_passwd').removeAttr("disabled","disabled");
                $('#f_login').focus();
            }else if(data == 1){
                //alert('Si pasa frames');
                window.location.href="menu/index2.jsp";
        }else{
        alert('::: ERROR, VUELVA A INTENTARLO :::');
    } });
}
}); }
);  


    window.PixelAdmin.start(init);
</script>

</body>
</html>
