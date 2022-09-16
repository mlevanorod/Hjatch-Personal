<%@ include file="../conectadb.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>

<%

	String	s_codigo	=	request.getParameter("f_codigo_upd");
	 int	s_unidad	=	Integer.parseInt(request.getParameter("f_unidad_upd"));
	 int	s_servicio	=	Integer.parseInt(request.getParameter("f_servicio_upd"));
	 int    s_id 		=	Integer.parseInt(request.getParameter("f_id_upd"));
	 


	COMANDO = "update ServicioMaestro set "+
					"		idServDepartUnid = "+s_servicio+", "+
					"		IdDepartUnid = "+s_unidad+" "+
					"  where  IdServMaestro = "+s_id+" "+
					"    and  activo = 1 "; 
		//out.print(COMANDO);
		int y = stmt.executeUpdate(COMANDO);
		out.print("1");

%>