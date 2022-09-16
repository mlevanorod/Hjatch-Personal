<%@ include file="../conectadb.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>

<%

	String	s_codigo	=	request.getParameter("f_codigo");
	String	s_unidad	=	request.getParameter("f_unidad");
	String	s_servicio	=	request.getParameter("f_servicio");
	String	s_personal	=	request.getParameter("f_personal");


	COMANDO = " SELECT	codigo "+
				" FROM	ServicioMaestro	"+
				"WHERE  codigo = '"+s_codigo+"' ";

		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
		out.print("2");
	}else{


	COMANDO = "INSERT INTO ServicioMaestro "+
					"	( "+
					"		idServDepartUnid, "+
					"		IdDepartUnid, "+
					"		codigo, "+
					"		activo "+
					"	) "+
					"values(	 "+
					"		"+s_servicio+", "+
					"		"+s_unidad+", "+
					"		'"+s_codigo+"', "+
					"		1 "+
					"     ) "; 
		//out.print(COMANDO);
		int y = stmt.executeUpdate(COMANDO);
		out.print("1");
	}
%>
