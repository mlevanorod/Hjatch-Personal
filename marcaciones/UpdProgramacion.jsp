<%@ include file="../conectadb.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>

<%

		String s_dia 				=	request.getParameter("f_dia");	// Id del Colegio
		String s_dato				= 	request.getParameter("f_dato");
		String s_codigo				= 	request.getParameter("f_codigow");	// Id Procedencia
		String s_anio				=	request.getParameter("f_aniow"); // Id del Consultorio
		String s_mes				=	request.getParameter("f_mesw"); // Id del Medico
		String s_unidad				=	request.getParameter("f_unidadw"); // Id del Unidad
		int s_situacion				=	Integer.parseInt(request.getParameter("f_situacion")); // Id del Unidad
		String tipo 				=	"";
		String codhor 				=	"";
		String horai 				=	"";
		String horas 				=	"";
		String  anio   = new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
		int y = 0;
		int sum = 0;
		double sum_cant = 0.00;
		double cant = 0.00;
		double hora = 150.00;
		int cout_g = 0;

		COMANDO = "select "+
					"		CASE TIPO "+
					"			WHEN 'R' THEN 150.00 "+
					"			WHEN 'Z' THEN 156.00 "+
					"			WHEN 'A' THEN 160.00 "+
					"			ELSE 150.00 "+
					"		END HORA "+
					"  from	T_UnidadOrganica "+
					" where	CODIGO = '"+s_unidad+"' ";
			rset = stmt.executeQuery(COMANDO);
			if(rset.next())
			{
				hora = rset.getDouble("HORA");
			}

		COMANDO = "SELECT 	COUNT(CODACT) as CANT "+
					" FROM	ASISTENCIA "+
					"WHERE  CODIGO  =  '"+s_codigo+"' "+
						"   AND	"+anio+"    =  '"+s_anio+"' "+
						"   AND	MES	    =  '"+s_mes+"' "+
						"   AND SUBSTRING(CODACT,1,1) = 'G' ";
			rset = stmt.executeQuery(COMANDO);
		if(rset.next())
		{
			cout_g = rset.getInt("CANT");
		}

		COMANDO = "	 SELECT		SUM(B.HORA) AS SUMA_TOTAL "+
					"  FROM		ASISTENCIA A "+
					"  JOIN		T_Horarios B "+
					"    ON		A.CODACT = B.CODHOR "+
					" WHERE		A.CODIGO = '"+s_codigo+"' "+
					"   AND		A."+anio+" = '"+s_anio+"' "+
					"   AND		A.MES = '"+s_mes+"' ";

			rset = stmt.executeQuery(COMANDO);
		if(rset.next())
		{
			sum_cant = rset.getDouble("SUMA_TOTAL");
		}

		COMANDO = "select "+
			"		CODHOR, "+
			"		HORING, "+
			"		HORSAL, "+
			"		HORA as CANT, "+
			"		CASE  SUBSTRING(CODHOR,1,1) "+
			"			WHEN 'G' THEN 1 "+
			"			ELSE 0 "+
			"       END COUNT_G "+
			"  FROM	T_Horarios "+
			" WHERE	upper(CODHOR) = upper('"+s_dato+"') ";

			rset = stmt.executeQuery(COMANDO);
		if(rset.next())
		{
			codhor = rset.getString("CODHOR");
			horai  = rset.getString("HORING");
			horas  = rset.getString("HORSAL");
			cant   = rset.getDouble("CANT");
			cout_g = cout_g + rset.getInt("COUNT_G");
		}

			sum_cant = sum_cant + cant;

		if(sum_cant > hora && s_situacion < 20)
		{

			out.print("3");

		}else{

			if(cout_g > 10){

				out.print("2");

			}else{
				COMANDO = "UPDATE 	ASISTENCIA SET "+
							"       CODACT 	=  '"+codhor+"', "+
							"       HORAI  	=  '"+horai+"', "+
							"       HORAS  	=  '"+horas+"' "+
							" where CODIGO  =  '"+s_codigo+"' "+
							"   AND	"+anio+"    =  '"+s_anio+"' "+
							"   AND	MES	    =  '"+s_mes+"' "+
							"   AND DIA 	=  '"+s_dia+"' ";

					//out.print(COMANDO);
					y = stmt.executeUpdate(COMANDO);

				out.print('1');
			}
		}

%>
<%@ include file= "../cierradb.jsp" %> 