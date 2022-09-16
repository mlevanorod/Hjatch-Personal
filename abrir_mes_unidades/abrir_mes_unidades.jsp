<%@ include file="../conectadb.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%	
	String s_anio		= request.getParameter("f_anio");	
	String s_mes		= request.getParameter("f_mes");
	String s_servicio	= request.getParameter("f_unidad");

	COMANDO = 	" EXEC dbo.SP_PERSONAL_ABRIR_MES_UNIDADES '"+s_mes+"', '"+s_anio+"', '"+s_servicio+"' ";
	int y = stmt.executeUpdate(COMANDO);


	out.print("1");
%>	
	
