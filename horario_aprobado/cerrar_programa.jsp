<%@ include file="../conectadb.jsp" %>

<%@ page contentType="text/html; charset=ISO-8859-1" %>

<%

		String anio   				= 	new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
		String s_codigo				= 	request.getParameter("f_cod");	// Id Procedencia
		String s_anio 				= 	request.getParameter("f_anio");	// Anio
		String s_mes 				= 	request.getParameter("f_mes");	// Mes
		String s_fecha_ini			=	request.getParameter("f_fecha_ini"); // Id del Consultorio
		String s_fecha_fin			=	request.getParameter("f_fecha_fin"); // Id del Medico
		String s_tipo				=	request.getParameter("f_tipo");
		int t = 0;

		COMANDO = "UPDATE  ASISTENCIA SET "+
						"	INDICADOR = 2 "+
					"	WHERE	  CODIGO = '"+s_codigo+"' "+
					"     AND	"+anio+" = '"+s_anio+"' "+
					"     AND	     mes = '"+s_mes+"' "+
					"	  AND	  INDICADOR = 1	";

			t 	=	stmt.executeUpdate(COMANDO);

		out.print("1");

%>