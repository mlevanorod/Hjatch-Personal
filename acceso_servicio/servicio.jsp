<%@ include file="../conectadb.jsp" %>

<%
	String s_unidad	= request.getParameter("f_unidad");
	int y = 0;


	COMANDO = "SELECT	IdServDepartUnid, "+
				"		Nombre "+
				"  FROM	ServicioDepartUnidad "+
				" WHERE	IdDepartUnid = "+s_unidad+" "+
				 "   and   isnull(dniacceso,0) = 0 "+
				"   AND	Activo = 1 ";

		rset = stmt.executeQuery(COMANDO);

	while(rset.next())
	{ y++;
		out.print("<option value="+rset.getString("IdServDepartUnid")+" > "+rset.getString("nombre")+" </option> ");
	}

	if(y == 0){
%>
		out.print("<option value=0 > *** NINGUN SERVICIO FALTA DAR ACCESO *** </option> ");
<%
	}
%>