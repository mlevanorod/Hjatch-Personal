<%@ include file="../conectadb.jsp" %>

<%
	String s_id	= request.getParameter("f_id");


	COMANDO = " delete ServicioMaestro where IdServMaestro = "+s_id+"  ";

	int y = stmt.executeUpdate(COMANDO);

	out.print("1");

%>