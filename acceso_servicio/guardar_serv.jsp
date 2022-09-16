<%@ include file="../conectadb.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>

<%

	String	s_codigo	=	request.getParameter("f_codigo");
	 int	s_unidad	=	Integer.parseInt(request.getParameter("f_unidad"));
	 int	s_servicio	=	Integer.parseInt(request.getParameter("f_servicio"));
	String  s_personal	=	request.getParameter("f_personal");
	 


	COMANDO = "update ServicioDepartUnidad set "+
					"		dniAcceso = '"+s_codigo+"' "+
					"  where  IdServDepartUnid = "+s_servicio+" "+
					"	 and  IdDepartUnid = "+s_unidad+"  "+
					"    and  activo = 1 "; 
		//out.print(COMANDO);
		int y = stmt.executeUpdate(COMANDO);
		out.print("1");

%>