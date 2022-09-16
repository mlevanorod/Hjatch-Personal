<%@ include file="../conectadb.jsp" %>
<%//@ include file="../conectadb2.jsp" %>
<%@ include file= "id.jsp" %>
<%@ include file="../seguro.jsp" %>
<style> #tabla td{ line-height : 19px; border-width : 1; border-style : solid; border-color : #EBEBEB; } </style>
<script type="text/javascript">
    $(document).ready(inicializarEvento);
    
    function inicializarEvento(){
        $('#tabla a').click(rutaOpc);
        $('#tabla tr').mouseover(entraMouse);
        $('#tabla tr').mouseout(saleMouse);
    }
    
    function entraMouse(){ $(this).css("background-color","#FFFF00"); }
    
    function saleMouse(){ $(this).css("background-color","#FFFFFF"); }
    
    function rutaOpc(){
        var tip = $(this).attr('name');
        var ido = $(this).attr('id');
        if(tip == 'E'){
            jQuery.facebox({ ajax: 'form_edit.jsp?f_id_personal='+ido });
        }else if(tip == 'B'){
        var answer = confirm(".: ESTA SEGURO DE CONTINUAR? :.");
        if(answer){
            $.post("updEstado.jsp",{ f_id_personal:ido, f_estado:0 } ,function(data){
                if(data == 1){
                    $('#lista').fadeIn("fast").load('listado.jsp');
                }});
            }
        }else if(tip == 'A'){
        var answer = confirm(".: ESTA SEGURO DE CONTINUAR? :.");
        if(answer){
            $.post("updEstado.jsp",{ f_id_personal:ido, f_estado:1 } ,function(data){
                if(data == 1){
                    $('#lista').fadeIn("fast").load('listado.jsp');
                }});
            }
        }if(tip == 'S'){
        jQuery.facebox({ ajax: 'form_accesos.jsp?f_id_personal='+ido });
    }
}
</script>
<%
            int i = 0, j = 0;
%>
<table align="center" id="tabla">               
    <%
            String x_id_tienda = "";

            COMANDO = " select "+
						"		id_personal, "+
						"		isnull(codigo,'-') as codigo, "+
						"		upper(nombre) nombre, "+
						"		dbo.nombre(id_personal) as nomcomp, "+
						"		apellido, "+
						"		login,  "+
						"		isnull(dni,'-') as dni, "+
						"		isnull(estado,'0') as estado, "+
						"		case estado "+
						"			when '1' then 'Activo' "+
						"			when '0' then 'Bloqueado' "+
						"			else 'Activo' "+
						"		end estadon, "+ 
						"		case estado "+
						"			when '1' then '#000000' "+ 
						"			when '0' then '#AB3939' "+
						"			else '#000000' "+
						"		end color "+ 
						"	from datos_personales "+
						"order by apellido asc ";
          // out.print(COMANDO);
			rset = stmt.executeQuery(COMANDO);
            while (rset.next()) {
                i++;
				if( i == 1 )
				{
%>
	
                <tr>
                    <th>&nbsp;#&nbsp;</th>
                    <th>&nbsp;Codigo&nbsp;</th>
                    <th>&nbsp;Nombre Completo.&nbsp;</th>
                    <th>&nbsp;Login&nbsp;</th>				
                    <th>&nbsp;Dni.&nbsp;</th>
                    <th>&nbsp;Estado&nbsp;</th>
                    <th>&nbsp;Opc.&nbsp;</th>
                </tr>
<%				}
%>
			<tr>
            	<td><%=i%></td>
                <td align="center"><%=rset.getString("codigo")%></td>
                <td align="left"><%=rset.getString("nomcomp")%></td>
                <td align="center"><%=rset.getString("login")%></td>
                <td align="center"><%=rset.getString("dni")%></td>
                <td align="center">&nbsp;<font size="1" color="<%=rset.getString("color")%>"><b><%=rset.getString("estadon")%></b></font>&nbsp;</td>
                <td align="center">
					<%if (rset.getString("estado").equals("1")) {%>
                    &nbsp;[<a href="#" name="E" title="Editar registro" id="<%=rset.getString("id_personal")%>">&nbsp;E&nbsp;</a>]&nbsp;&nbsp;&nbsp;[<a href="#" name="B" title="Bloquear" id="<%=rset.getString("id_personal")%>">&nbsp;B&nbsp;</a>]&nbsp;
                    <%} else if (rset.getString("estado").equals("0")) {%>
                    &nbsp;[<a href="#" name="E" title="Editar registro" id="<%=rset.getString("id_personal")%>">&nbsp;E&nbsp;</a>]&nbsp;&nbsp;&nbsp;[<a href="#" name="A" title="Activar" id="<%=rset.getString("id_personal")%>">&nbsp;A&nbsp;</a>]&nbsp;
                    <%}%>
                </td>
            </tr>
    <%	}%>

</table>
<%@ include file= "../cierradb.jsp" %> 