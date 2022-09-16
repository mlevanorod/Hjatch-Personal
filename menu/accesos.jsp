<%@ include file="../conectadb.jsp" %>
<%@ include file="id.jsp" %>
<%@ include file="../seguro.jsp" %>

<link rel="stylesheet" href="../css/menu.css" type="text/css" media="screen" />

<script type="text/javascript" language="Javascript">
    $(document).ready(inicializarEventos);
    
    function inicializarEventos(){
        mn = $('#menu a');
        cs = $('#closesion');
        mn.click(presboton);
        cs.click(closeSesion);
    }
    
    function closeSesion(){
        parent.top.location.href='salir.jsp';
    }
    
    function presboton(){
        var idb = $(this).attr('id');
        var cls = $(this).attr('class');
        if(cls != 'boton2'){
            $('#menu').fadeOut("fast");
            $('#menu').fadeIn("fast").load('accesos.jsp?grupo_act='+idb);
            //parent.main.location.href='main.jsp';
        }else{
        parent.main.location.href=idb;
        $('.boton2').css({ color: "#000000" }); 
	$(this).css({ color: "#AB3939" });
    }
}
</script>
<%
            String s_id_grupo = "";
            String grupo_act = request.getParameter("grupo_act");
            if (grupo_act == null) {
                grupo_act = "x";
            }
%>

<input type="hidden" name="actual" size="2" maxlength="2">
<%
            COMANDO = " select " +
                    " a.id_grupo, " +
                    " isnull(b.nombre,'-') grupo, " +
					" case when a.id_grupo = '"+grupo_act.trim()+"' then 'S' else 'N' end ver, "+
                    " isnull(a.nombre,'-') nombre, " +
                    " isnull(a.url,'-') url " +
                    " from accesos_menu a, accesos_grupo b, accesos_user c " +
                    " where a.id_modulo = '" + id_modulo.trim() + "' " +
                    " and a.id_grupo = b.id_grupo " +
                    " and a.id_acceso = c.id_acceso " +
                    " and c.id_personal = '" + id_personal.trim() + "' " +
                    " and a.estado = 1 " +
                    " order by b.orden, a.orden ";
					//out.print(COMANDO);
            rset = stmt.executeQuery(COMANDO);
            while (rset.next()) {
                if (!rset.getString("id_grupo").equals(s_id_grupo)) {
                    s_id_grupo = rset.getString("id_grupo");

                    if (rset.getString("ver").equals("N")) {%>	
						<jsp:include page="titulo_0_1.html" flush="true" />
					<%} else {%>
						<jsp:include page="titulo_1_1.html" flush="true" />
					<%}%>
					&nbsp;<a href="#" id="<%= rset.getString("id_grupo") %>" class="boton1" ><%= rset.getString("grupo") %></a>
					<%if (rset.getString("ver").equals("N")) {%>
						<jsp:include page="titulo_0_2.html" flush="true" />
					<%} else {%>
						<jsp:include page="titulo_1_2.html" flush="true" />
					<%}
			    }
				
				if (rset.getString("ver").equals("S")) {%>
					<jsp:include page="boton_1.html" flush="true" />
					&nbsp;<a href="#" class="boton2" id="<%= rset.getString("url") %>" ><%= rset.getString("nombre") %></a>
					<jsp:include page="boton_2.html" flush="true" />
				<%}
		            } %>

                    <jsp:include page="titulo_1_s.html" flush="true" />
                    &nbsp;<a class="boton1" id="closesion" href="#">Cerrar Sesión</a>
                    <jsp:include page="titulo_1_2.html" flush="true" />

<%@ include file="../cierradb.jsp" %>