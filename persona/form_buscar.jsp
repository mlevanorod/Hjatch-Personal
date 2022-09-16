<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ include file= "id.jsp" %>
<%@ include file="../seguro.jsp" %>

<script type="text/javascript" src="../js/jquery.autocomplete.js"></script>
<script src="../js/jquery.validate.js" type="text/javascript"></script>
<script>
    $(document).ready(inicializarEvento);
    
    function inicializarEvento(){
        $('#f_nombre').focus();
		$('#datos1 :text').addClass("inputext");
        $('#datos1 :submit').addClass("inpusubmit");
        $('#datos1 :button').addClass("inpubutton");
		
        bc = $("#btclose");
        bc.click(pressClose);
    }
   
    function pressClose(){ $.facebox.close(); }
    
    $(document).ready(
        function(){ $("#datos1").validate({
            event: "blur",
            rules: {
                f_nombre: {
                    required: true
                },
                f_colegio: {
                    required: true
                },
                f_esp: {
                    required: true
                }
            },
            messages: { f_nombre:{required:""}, f_colegio:{required:""}, f_esp:{required:""}, f_id_personal:{required:""} },
            submitHandler: function(){
                $('#enviar').attr("disabled","disabled");
                $('#f_nombre').attr("disabled","disabled");
                $('#f_apellido').attr("disabled","disabled");
                $('#f_codigo').attr("disabled","disabled");
                $('#f_login').attr("disabled","disabled");
                $.post("add_per.jsp",{ f_nombre:$('#f_nombre').val(),f_apellido:$('#f_apellido').val(),f_codigo:$('#f_codigo').val(),f_login:$('#f_login').val(),f_id_personal:$('#f_id_personal').val(),f_dni:$('#f_dni').val(),f_passwd:$('#f_passwd').val(),f_sexo:$('#f_sexo').val(),f_celular:$('#f_celular').val(),f_obs:$('#f_obs').val() } ,function(data){
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

<div id="cont">
    <form name="datos1" id="datos1">
        <table border="1" align="center"> 
            <tr>
                <td colspan="2"><div class="titcab"><font size="1"><b>REGISTRO DE NUEVO USUARIO</b></font></div></td>
            </tr>
            <tr>
                <td colspan="2"><div class="spc">&nbsp;</div></td>
            </tr>
            <tr>
                <td align="right"><b>N</b>ombre&nbsp;:&nbsp;</td>
                <td align="left"><input type="text" id="f_nombre" name="f_nombre" value="" size="30" maxlength="50"></td>
            </tr>
            <tr>
                <td align="right"><b>A</b>pellido&nbsp;:&nbsp;</td>
                <td align="left"><input type="text" id="f_apellido" name="f_apellido" value="" size="30" maxlength="50"></td>
            </tr>
            <tr>
                <td align="right"><b>C</b>odigo&nbsp;:&nbsp;</td>
                <td align="left"><input type="text" id="f_codigo" name="f_codigo" value="" size="30" maxlength="50"></td>
            </tr>
            <tr>
                <td align="right"><b>D</b>ni&nbsp;:&nbsp;</td>
                <td align="left"><input type="text" id="f_dni" name="f_dni" value="" size="30" maxlength="50"></td>
            </tr>
            <tr>
                <td align="right"><b>S</b>exo&nbsp;:&nbsp;</td>
                <td align="left">
                <select name="f_sexo" id="f_sexo">
                	<option value="M">Masculino</option>
                    <option value="F">Femenino</option>
                </select>
                </td>
            </tr>
<!--            
            <tr>
                <td align="right"><b>L</b>ogin&nbsp;:&nbsp;</td>
                <td align="left"><input type="text" id="f_login" name="f_login" value="" size="30" maxlength="50"></td>
            </tr>
            <tr>
                <td align="right"><b>P</b>asswd&nbsp;:&nbsp;</td>
                <td align="left"><input type="password" id="f_passwd" name="f_passwd" value="" size="30" maxlength="50"></td>
            </tr>
-->

            <tr>
                <td align="right"><b>C</b>elular&nbsp;:&nbsp;</td>
                <td align="left"><input type="text" id="f_celular" name="f_celular" value="" size="30" maxlength="50"></td>
            </tr>
            <tr>
                <td align="right"><b>O</b>bs&nbsp;:&nbsp;</td>
                <td align="left"><input type="text" id="f_obs" name="f_obs" value="" size="30" maxlength="50"></td>
            </tr>

            <tr>
                <td colspan="2" align="center">
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
