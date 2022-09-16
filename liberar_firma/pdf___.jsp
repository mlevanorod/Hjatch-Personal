<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb2.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%	
	String s_anio		= request.getParameter("f_anio");	
	String s_mes		= request.getParameter("f_mes");



	QUERY = 	" EXEC SP_PERSONAL_ASIGNA_FIRMAS '"+s_mes+"', '"+s_anio+"' ";
	rset = stmt.executeQuery(QUERY);
				//out.print(COMANDO2);
// 	rset2 = stmt2.executeQuery(COMANDO2);
	//if(rset.next())
	//{
	
	//	f_anio = rset.getString("MES");
	//	f_mes = rset.getString("AÑO");
		
%>	
	
