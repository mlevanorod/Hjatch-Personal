<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ include file= "id.jsp" %>
<%@ include file="../seguro.jsp" %>

<script src="../js/jquery.validate.js" type="text/javascript"></script>
<script>
    $(document).ready(inicializarEvento);
    
    function inicializarEvento(){
        $('#datos5 :text').addClass("inputext");
        $('#datos5 :submit').addClass("inpusubmit");
        $('#datos5 :button').addClass("inpubutton");
        $('#datos5 :password').addClass("inputext");
        bc = $("#btclose");
        bc.click(pressClose);
    }
	
    
    function pressClose(){ $.facebox.close(); }
    
    $(document).ready(
        function(){ $("#datos5").validate({
            event: "blur",
            rules: {
                f_nombre: {
                    required: true
                },
                f_apellido: {
                    required: true
                },
                f_codigo: {
                    required: true
                },
                f_login: {
                    required: true
                }
            },
            messages: { f_nombre:{required:""}, f_apellido:{required:""}, f_codigo:{required:""}, f_login:{required:""} },
            submitHandler: function(){
                $('#enviar').attr("disabled","disabled");
                $('#f_nombre').attr("disabled","disabled");
                $('#f_apellido').attr("disabled","disabled");
                $('#f_codigo').attr("disabled","disabled");
                $('#f_login').attr("disabled","disabled");
                $.post("upd_per.jsp",{ f_nombre:$('#f_nombre').val(),f_apellido:$('#f_apellido').val(),f_codigo:$('#f_codigo').val(),f_login:$('#f_login').val(),f_id_personal:$('#f_id_personal').val(),f_dni:$('#f_dni').val(),f_passwd:$('#f_passwd').val(),f_sexo:$('#f_sexo').val(),f_celular:$('#f_celular').val(),f_obs:$('#f_obs').val(),f_area:$('#f_area').val() } ,function(data){
                    if(data == 1){
                        $.facebox.close();
                        $('#lista').fadeIn("fast").load('listado.jsp');
                    }else if(data == 3){
                    alert('..:: YA EXISTE UN REGISTRO CON LOS DATOS INGRESADOS ::..');
					$('#enviar').attr("disabled","disabled");
					$('#f_nombre').attr("disabled","disabled");
					$('#f_apellido').attr("disabled","disabled");
					$('#f_codigo').attr("disabled","disabled");
					$('#f_login').attr("disabled","disabled");
                }else if(data == 2){
                alert('..:: YA EXISTE UN REGISTRO CON LOS DATOS INGRESADOS ::..');
                $('#enviar').attr("disabled","disabled");
                $('#f_nombre').attr("disabled","disabled");
                $('#f_apellido').attr("disabled","disabled");
                $('#f_codigo').attr("disabled","disabled");
                $('#f_login').attr("disabled","disabled");
            }else{
            alert('::: ERROR, VUELVA A INTENTARLO :::');
            $.facebox.close();
        } });
    }
}); }
);	
		
</script>

<%
            String s_id_personal = request.getParameter("f_id_personal").trim();
%>

<div id="cont">
    <form name="datos5" id="datos5">
        <table border="0" align="center"> 
            <tr>
                <td colspan="2"><div class="titcab"><font size="1"><b>EDITAR DATOS DEL USUARIO<b></font></div></td>
            </tr>
        </table>
        <%
            String s_nombre 	= "";
			String s_apellido 	= "";
			String s_dni		= "";
			String s_codigo		= "";
			String sexo			= "";
			String x_login		= "";
			String s_passwd		= "";
			String s_celular	= "";
			String s_obs		= "";

            COMANDO = " select " +
						" id_personal, "+
						" upper(nombre) as nombre, " +
						" upper(apellido) as apellido, " +
						" isnull(dni,'-') as dni, " +
						" isnull(codigo,'-') as codigo, "+
						" case sexo "+
						" when 'F' then 'selected' "+
						" else '' "+
						" end sexo, "+
						" login, "+
						" passwd, "+
						" isnull(celular,'-') as celular, "+
						" isnull(obs,'-') as obs "+
						" from datos_personales " +
						" where id_personal = '" + s_id_personal.trim() + "' ";
			//			out.print(COMANDO);
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                s_nombre 	= rset.getString("nombre");
                s_apellido 	= rset.getString("apellido");
                s_dni 		= rset.getString("dni");
				s_codigo 	= rset.getString("codigo");
				sexo 		= rset.getString("sexo");
                x_login 	= rset.getString("login");
				s_passwd 	= rset.getString("passwd");
				s_celular 	= rset.getString("celular");
				s_obs 		= rset.getString("obs");
            }

        %>
        <table border="0" align="center"> 
            <tr>
                <td colspan="2"><div class="spc">&nbsp;</div></td>
            </tr>
            <tr>
                <td align="right"><b>N</b>ombre&nbsp;:&nbsp;</td>
                <td align="left"><input type="text" id="f_nombre" name="f_nombre" value="<%=s_nombre%>" size="30" maxlength="50"></td>
            </tr>
            <tr>
                <td align="right"><b>A</b>pellido&nbsp;:&nbsp;</td>
                <td align="left"><input type="text" id="f_apellido" name="f_apellido" value="<%=s_apellido%>" size="30" maxlength="50"></td>
            </tr>
            <tr>
                <td align="right"><b>C</b>odigo&nbsp;:&nbsp;</td>
                <td align="left"><input type="text" id="f_codigo" name="f_codigo" value="<%=s_codigo%>" size="30" maxlength="50"></td>
            </tr>
            <tr>
                <td align="right"><b>D</b>ni&nbsp;:&nbsp;</td>
                <td align="left"><input type="text" id="f_dni" name="f_dni" value="<%=s_dni%>" size="30" maxlength="50"></td>
            </tr>
            <tr>
                <td align="right"><b>S</b>exo&nbsp;:&nbsp;</td>
                <td align="left">
                <select name="f_sexo" id="f_sexo">
                	<option value="M">Masculino</option>
                    <option <%=sexo%> value="F">Femenino</option>
                </select>
                </td>
            </tr>
<!--            <tr>
                <td align="right"><b>S</b>exo&nbsp;:&nbsp;</td>
                <td align="left">
                <select name="f_area" id="f_area">
                	<option value="123">Laboratorio</option>                    
                </select>
                </td>
            </tr>

            <tr>
                <td align="right"><b>L</b>ogin&nbsp;:&nbsp;</td>
                <td align="left"><input type="text" id="f_login" name="f_login" value="<%=x_login%>" size="30" maxlength="50"></td>
            </tr>
            <tr>
                <td align="right"><b>P</b>asswd&nbsp;:&nbsp;</td>
                <td align="left"><input type="password" id="f_passwd" name="f_passwd" value="<%=s_passwd%>" size="30" maxlength="50"></td>
            </tr>
-->

            <tr>
                <td align="right"><b>C</b>elular&nbsp;:&nbsp;</td>
                <td align="left"><input type="text" id="f_celular" name="f_celular" value="<%=s_celular%>" size="30" maxlength="50"></td>
            </tr>
            <tr>
                <td align="right"><b>O</b>bs&nbsp;:&nbsp;</td>
                <td align="left"><input type="text" id="f_obs" name="f_obs" value="<%=s_obs%>" size="30" maxlength="50"></td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input type="hidden" id="f_id_personal" name="f_id_personal" value="<%=s_id_personal%>">	
                    <input type="submit" id="enviar" value="&nbsp;Guardar&nbsp;">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="btclose" value="Cancelar">
                </td>                    
            </tr>
            <tr>
                <td colspan="2"><div class="spc">&nbsp;</div></td>
            </tr>
        </table>
    </form>
</div>

<%@ include file= "../cierradb.jsp" %>