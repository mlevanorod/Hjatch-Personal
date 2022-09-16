<%@ include file="../conectadb.jsp" %>

<%
	String	s_usuario 	=	request.getParameter("f_usuario");
	String  s_clave		=	request.getParameter("f_clave");


	COMANDO = "update	[SIGSALUD].dbo.USUARIO_WEB "+
			"	set		CLAVE = CONVERT(NVARCHAR(30),HashBytes('MD5', '" + s_clave + "'),2) "+
			"	where	DNI = '"+s_usuario+"' ";

		int y = stmt.executeUpdate(COMANDO);

		out.print("1");

%>