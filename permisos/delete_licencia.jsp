<%@ include file="../conectadb.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>

<%

	String	s_licencia	=	request.getParameter("f_id_licencia");
	String	s_codigo	=	request.getParameter("f_codigo");


	COMANDO = "DELETE FROM LICENCIA "+
			  " WHERE id = '"+s_licencia+"' "+
			  "	  and codigo = '"+s_codigo+"' "; 
		//out.print(COMANDO);
		int y = stmt.executeUpdate(COMANDO);
		out.print("1");
%>
