<%@ include file="../conectadb.jsp" %>

<%
	String s_tipo	= request.getParameter("f_tipo_licencia");


	COMANDO = "SELECT	codigo, "+
				"		Nombre "+
				"  FROM	T_LicenciaJustifica "+
				" WHERE	TIPJUS = "+s_tipo+" "+
				"   AND VALOR = 'L'	";

		rset = stmt.executeQuery(COMANDO);

	while(rset.next())
	{
		out.print("<option value="+rset.getString("CODIGO")+" > "+rset.getString("nombre")+" </option> ");
	}


%>