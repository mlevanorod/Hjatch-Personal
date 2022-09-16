<%@ include file="../conectadb.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%	
	String s_anio		= request.getParameter("f_anio");	
	String s_mes		= request.getParameter("f_mes");



	COMANDO = 	" EXEC SP_PERSONAL_CERRAR_MES_ACTIVIDADES '"+s_mes+"', '"+s_anio+"' ";
	int y = stmt.executeUpdate(COMANDO);


	out.print("1");
%>	
	
