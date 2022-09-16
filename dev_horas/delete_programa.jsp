<%@ include file="../conectadb.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>

<%

		String s_codigo				= 	request.getParameter("f_codigo");	// Id Procedencia
		String s_anio				=	request.getParameter("f_anio"); // Id del Consultorio
		String s_mes				=	request.getParameter("f_mes"); // Id del Medico
		String  anio   = new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
		int t = 0;

		COMANDO = "DELETE 	ASISTENCIA_DEVOLUCION "+
						" where CODIGO  =  '"+s_codigo+"' "+
						"   AND	"+anio+"    =  '"+s_anio+"' "+
						"   AND INDICADOR = 1 "+
						"   AND	MES	    =  '"+s_mes+"' ";

				//out.print(COMANDO);
				t = stmt.executeUpdate(COMANDO);

			out.print("1");

%>