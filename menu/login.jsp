<%@ include file="../conectadb.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/style2.css" type="text/css" media="screen" />
<script src="../js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="../js/jquery.validate.js" type="text/javascript"></script>
<script language="Javascript">document.oncontextmenu = function(){return false}</script>
<!--<script language="Javascript">document.onselectstart = function(){ return false; }</script>-->
<script>
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
                $.post("../frames.jsp",{ f_login:$('#f_login').val(),f_passwd:$('#f_passwd').val() } ,function(data){
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
            parent.main.location.href='main.jsp';
            parent.head.location.href='head.jsp';
            parent.menu.location.href='menu.jsp';
        }else{
        alert('::: ERROR, VUELVA A INTENTARLO :::');
    } });
}
}); }
);	
</script>
<%
            String s_empresa = "-";
            COMANDO = " select NOMBRE empresa from acceso_modulo where id_modulo = '11020212552901091032' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                s_empresa = rset.getString("empresa");
            }
%>
<body>
    <table align="center" border="1" width="300px" cellspacing="2">
        <form id="datos1" name="datos1">
            <tr>
                <td colspan="2" class="titulo">&nbsp;<font size="1"><b>BIENVENIDO A <%=s_empresa.trim()%></b></font>&nbsp;</td>
            </tr>
            <tr>
                <td align="right">&nbsp;&nbsp;<b>C</b>&oacute;digo&nbsp;de&nbsp;usuario&nbsp;:&nbsp;</td>
                <td><input type="text" size="30" name="f_login" maxlength="50" id="f_login" />&nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td align="right">&nbsp;&nbsp;<b>C</b>lave&nbsp;de&nbsp;acceso&nbsp;:&nbsp;</td>
                <td><input type="password" size="30" name="f_passwd" maxlength="50" id="f_passwd" />&nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input class="botinput" id="login" type="submit" value="Iniciar Sesi&oacute;n" /></td>
            </tr>
        </form>
    </table>
</body>
<%@ include file="../cierradb.jsp"%>
