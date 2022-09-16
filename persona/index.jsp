<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb2.jsp" %>
<%@ include file= "id.jsp" %>
<%@ include file="../seguro.jsp" %>

<html>    
    <head>
        <script src="../js/jquery-1.3.2.min.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="../css/style2.css" />
        <link href="../css/facebox.css" media="screen" rel="stylesheet" type="text/css"/>
        <script src="../js/facebox.js" type="text/javascript"></script>
        <script language="Javascript">document.oncontextmenu = function(){return false}</script>
        <!--<script language="Javascript">document.onselectstart = function(){ return false; }</script>-->
        <script type="text/javascript" language="Javascript">
            $(document).ready(inicializarEventos);
            
            function inicializarEventos(){
                $('a[rel*=facebox]').facebox({modal: true,overlay: false});
                $('#lista').fadeIn("fast").load('listado.jsp');
                $('#add1').click(formAdd);
            }
            
            function formAdd(){
                jQuery.facebox({ ajax: 'form_tienda.jsp' });
            }
        </script>
    </head>
    <%
            int contador = 0, exct = 0;
    %>
    <body>
        <table align="center" border="1">
            <tr>
                <td colspan="6" class="titulo">&nbsp;<font size="1"><b>GESTI&Oacute;N DEL USUARIO DEL SISTEMA</b></font>&nbsp;</td>
            </tr>
            <tr>
                <td align="CENTER" colspan="6">
                    [ <a href="form_buscar.jsp" rel="facebox">Nueva Persona</a> ]
                </td>
            </tr> 
            <tr>
                <td><div id="lista"></div></td>
            </tr>
        </table>
    </body> 
    
</html>
<%@ include file= "../cierradb.jsp" %> 