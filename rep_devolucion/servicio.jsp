<%@ include file="../conectadb.jsp" %>

<%
	String s_unidad	= request.getParameter("f_unidad");


	COMANDO = "SELECT	IdServDepartUnid, "+
				"		Nombre "+
				"  FROM	ServicioDepartUnidad "+
				" WHERE	IdDepartUnid = "+s_unidad+" "+
				"   AND	Activo = 1 "+
				"	and tipoadicional = 'C' ";
		rset = stmt.executeQuery(COMANDO);

	while(rset.next())
	{
		out.print("<option value="+rset.getString("IdServDepartUnid")+" > "+rset.getString("nombre")+" </option> ");
	}


%>