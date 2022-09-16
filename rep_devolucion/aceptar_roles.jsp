<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>

<%
	String	s_id_personal	=	request.getParameter("f_id_personal");
	String	s_mes			=	request.getParameter("f_mes");
	String	s_anio			=	request.getParameter("f_anio");
	String	s_unidad		=	request.getParameter("f_unidad");
	String  s_passwd		=	request.getParameter("f_passwd");
	String  acepta			=	"N";
	String  anio   			= 	new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");

    COMANDO3 = "select   'S' as acepta " +
              "  from    usuario_web " +
              " where    dni = '" + s_id_personal.trim() + "' " +
              "   and    clave = CONVERT(NVARCHAR(30),HashBytes('MD5', '" + s_passwd + "'),2) " +
              "   and    estado = '1' ";
    rset3 = stmt3.executeQuery(COMANDO3);
    if (rset3.next()) {
        acepta = rset3.getString("acepta").trim();
    }

    if("S".equals(acepta))
    {
		COMANDO = "  SELECT 	'SI' AS ACEPTA "+
					"  FROM 	FIRMA_ROL	"+
					" WHERE 	DNI =	'"+s_id_personal+"' 	"+
					"   and		estado = '4' ";

			rset 	=	stmt.executeQuery(COMANDO);
		if(rset.next())
		{
			acepta 	=	rset.getString("ACEPTA");
		}

		if("SI".equals(acepta))
		{
			COMANDO = "UPDATE	ASISTENCIA_DEVOLUCION SET "+
						"		INDICADOR = 4 "+
						" WHERE	"+anio+" = '"+s_anio+"' "+
						"   AND	MES = '"+s_mes+"' "+
						"   AND INDICADOR = 3 "+
						"   AND	CODIGO IN ( "+
						"					SELECT	CODIGO "+
						"					  FROM	MAESTRO "+
						"					 WHERE	CODUNIDADORG = '"+s_unidad+"' "+
						"					   AND	CODHORA IN ('R','M3','T3') "+
						"				   ) ";

				int y = stmt.executeUpdate(COMANDO);

			out.print("1");

		}else{
			out.print("3");
		}

	}else{
		out.print("2");
	}


%>