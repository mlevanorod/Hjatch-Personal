<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>

<%

		String[] array				=	request.getParameterValues("dia");	// Id del Colegio
		//int s_cant					= 	Integer.parseInt(request.getParameter("f_cant"));	// Id de Cita
		String s_codigo				= 	request.getParameter("f_codigow");	// Id Procedencia
		String s_anio				=	request.getParameter("f_aniow"); // Id del Consultorio
		String s_mes				=	request.getParameter("f_mesw"); // Id del Medico
		String s_unidad				=	request.getParameter("f_unidadw"); // Id del Unidad
		String tipo 				=	"";
		String codhor 				=	"";
		String horai 				=	"";
		String horas 				=	"";
		String  anio   				= new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
		int y = 0;
		int sum = 0;
		int sum_cant = 0;
		double cant = 0.00;
		double hora = 150.00;
		int t = 0;

/*
		COMANDO = "SELECT "+
					"		COUNT(CODACT) CANT_G "+
					"  FROM	[BDPERSONAL].[DBO].ASISTENCIA_AREA "+
					" WHERE	CODIGO = '"+s_codigo+"' "+
					"   AND	ANIO = '"+s_anio+"' "+
					"   AND	MES	 = '"+s_mes+"' "+
					"   AND	CODACT LIKE 'G%' ";
			rset	=	stmt.executeQuery(COMANDO);
		if(rset.next())
		{
			sum = rset.getInt("CANT_G");
		}

*/
		COMANDO = "CREATE TABLE #T_HORARIOS_TEMP (CODHOR NVARCHAR(4), HORA NUMERIC(10,2) ) ";

			t = stmt.executeUpdate(COMANDO);



		for(int i=0; i< array.length; i++)
		{
			//y=i+1;
		//	out.print(array[i]+ " - " + y +"<br>");

			COMANDO = "select "+
						"		CODHOR, "+
						"		CASE CODHOR "+
						"		     WHEN 'D' THEN '00:00' "+
						"		     ELSE HORING "+
						"		 END HORAI, "+
						"		HORA as CANT, "+
						"		CASE CODHOR "+
						"		     WHEN 'D' THEN '00:00' "+
						"		     ELSE HORSAL "+
						"		 END HORAS "+
						"  FROM	T_Horarios "+
						" WHERE	upper(CODHOR) = upper('"+array[i]+"') ";

				rset = stmt.executeQuery(COMANDO);
			if(rset.next())
			{
				codhor = rset.getString("CODHOR");
				horai  = rset.getString("HORAI");
				horas  = rset.getString("HORAS");
				hora   = rset.getDouble("CANT");
				cant   = cant + rset.getDouble("CANT");
			}

			COMANDO = "INSERT INTO #T_HORARIOS_TEMP VALUES ('"+array[i]+"', "+hora+") ";
				t = stmt.executeUpdate(COMANDO);

		}

		COMANDO = "  SELECT	TIPO "+
					"  FROM	T_UnidadOrganica "+
					" WHERE	CODIGO = '"+s_unidad+"' ";

			rset = stmt.executeQuery(COMANDO);
		if(rset.next())
		{
			tipo = rset.getString("TIPO");
		}

		if("A".equals(tipo))
		{	
			COMANDO = "SELECT 	160.00 as CANT "+
						" FROM	#T_HORARIOS_TEMP "+
						"WHERE  HORA = 12.00 ";
				rset = stmt.executeQuery(COMANDO);
			if(rset.next())
			{
				hora = rset.getDouble("CANT");
			}
		}else{

			hora = 150.00;
		}

		COMANDO = "SELECT 	COUNT(CODHOR) as CANT "+
					" FROM	#T_HORARIOS_TEMP "+
					"WHERE  CODHOR LIKE 'G%' ";
			rset = stmt.executeQuery(COMANDO);
		if(rset.next())
		{
			sum_cant = rset.getInt("CANT");
		}


		if(sum_cant > 10)
		{
			out.print("2");			

		}else if( cant > hora )
		{

			out.print("3");
		}	 
		else{
			for(int d=0; d< array.length; d++)
			{
				y=d+1;
			//	out.print(array[i]+ " - " + y +"<br>");

				COMANDO = "select "+
							"		CODHOR, "+
							"		CASE CODHOR "+
							"		     WHEN 'D' THEN '00:00' "+
							"		     ELSE HORING "+
							"		 END HORAI, "+
							"		HORA as CANT, "+
							"		CASE CODHOR "+
							"		     WHEN 'D' THEN '00:00' "+
							"		     ELSE HORSAL "+
							"		 END HORAS "+
							"  FROM	T_Horarios "+
							" WHERE	upper(CODHOR) = upper('"+array[d]+"') ";

					rset = stmt.executeQuery(COMANDO);
				if(rset.next())
				{
					codhor = rset.getString("CODHOR");
					horai  = rset.getString("HORAI");
					horas  = rset.getString("HORAS");
					cant   = rset.getDouble("CANT");
				}


			COMANDO = "UPDATE 	ASISTENCIA SET "+
						"       CODACT 	=  '"+codhor+"', "+
						"       HORAI  	=  '"+horai+"', "+
						"       HORAS  	=  '"+horas+"' "+
						" where CODIGO  =  '"+s_codigo+"' "+
						"   AND	"+anio+"    =  '"+s_anio+"' "+
						"   AND	MES	    =  '"+s_mes+"' "+
						"   AND DIA 	=  '"+y+"' ";

				//out.print(COMANDO);
				t = stmt.executeUpdate(COMANDO);

			}
			
			COMANDO = "DROP TABLE #T_HORARIOS_TEMP ";

				t = stmt.executeUpdate(COMANDO);

			out.print("1");
		}

%>
<%@ include file= "../cierradb.jsp" %> 