<%@ include file="../conectadb.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>

<%


	 int	s_servicio	=	Integer.parseInt(request.getParameter("f_servicio"));

	 COMANDO = "update ServicioDepartUnidad set "+
					"		dniacceso = '' "+
					"  where  idservdepartunid = "+s_servicio+" "+
					"    and  activo = 1 "; 
		//out.print(COMANDO);
		int y = stmt.executeUpdate(COMANDO);
		out.print("1");

%>