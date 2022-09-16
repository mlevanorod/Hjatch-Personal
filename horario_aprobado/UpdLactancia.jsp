<%@ include file="../conectadb.jsp" %>
<%@ include file="id.jsp"%>
<%@ include file="../seguro2.jsp"%>

<%@ page contentType="text/html; charset=ISO-8859-1" %>

<%

		String anio   				= 	new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
		String s_codigo				= 	request.getParameter("f_cod");	// Id Procedencia
		String s_fecha_ini			=	request.getParameter("f_fecha_ini"); // Id del Consultorio
		String s_fecha_fin			=	request.getParameter("f_fecha_fin"); // Id del Medico
		String s_tipo				=	request.getParameter("f_tipo");
		int t = 0;

		COMANDO = "INSERT INTO LACTANCIA "+
							"	VALUES	( "+
								"	'"+s_codigo+"', "+
								"	'"+s_fecha_ini+"', "+
								"	'"+s_fecha_fin+"', "+
								"	'"+s_tipo+"', "+
								"	'"+id_personal+"', "+
								"	1, "+
								"	SYSDATETIME() "+
							"			) ";

			t 	=	stmt.executeUpdate(COMANDO);

		out.print("1");

%>
<%@ include file= "../cierradb3.jsp" %> 