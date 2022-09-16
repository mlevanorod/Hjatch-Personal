<%@ include file="../conectadb.jsp" %>

<%

    COMANDO = "select    id_actividad, "+
                "        nombre, "+
                "        abreviatura, "+
                "        activo   "+
                " from   ACTIVIDADES "+
                " where  ACTIVO = 1 "+
                "order by nombre asc ";
     // out.print(COMANDO);
    rset = stmt.executeQuery(COMANDO);
    while(rset.next())
    {
		out.print("<option value="+rset.getString("id_actividad")+" > "+rset.getString("nombre")+" </option> ");
	}


%>