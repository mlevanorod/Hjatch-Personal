<%@ include file="../conectadb.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>

<%

		int s_del 				=	Integer.parseInt(request.getParameter("f_del"));	// Id del Colegio
		int s_al				= 	Integer.parseInt(request.getParameter("f_al"));
		String s_codigo				= 	request.getParameter("f_codigow");	// Id Procedencia
		String s_anio				=	request.getParameter("f_aniow"); // Id del Consultorio
		String s_mes				=	request.getParameter("f_mesw"); // Id del Medico
		String s_unidad				=	request.getParameter("f_unidadw"); // Id del Unidad

		String  anio   = new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
		int y = 0;


			for(int i=s_del; i<=s_al; i++)
			{

				COMANDO = "UPDATE 	ASISTENCIA SET "+
							"       CODACT 	=  'V', "+
							"       HORAI  	=  '00:00', "+
							"       HORAS  	=  '00:00' "+
							" where CODIGO  =  '"+s_codigo+"' "+
							"   AND	"+anio+"    =  '"+s_anio+"' "+
							"   AND	MES	    =  '"+s_mes+"' "+
							"	AND	CODACT  IN  ('D','V')  "+
							"   AND DIA 	=  "+i+" ";

					//out.print(COMANDO);
					y = stmt.executeUpdate(COMANDO);
			}
				out.print('1');


%>