 <%@ include file="../conectadb.jsp" %>

<%
		String[] regimen				=	request.getParameterValues("f_regimen");
		String[] cantidad				=	request.getParameterValues("f_cantidad");
		String[] total					=	request.getParameterValues("f_total");
		String s_tipo					=	request.getParameter("f_tipo");
		String s_turno					=	request.getParameter("f_turno");
		String s_fecha 					= 	request.getParameter("f_fecha");
		int    cant						=	0;

		COMANDO = "  SELECT		COUNT(*) AS CANT "+
					"  FROM		REGIMEN_DETALLE "+
					" WHERE		TIPO = '"+s_tipo+"' "+
					"   AND		TURNO = '"+s_turno+"' "+
					"   AND		FECHA = '"+s_fecha+"' "+
					"   AND		ESTADO = 1 ";

			rset = stmt.executeQuery(COMANDO);
		if(rset.next())
		{
			cant = rset.getInt("CANT");
		}



		for (int i=0; i<regimen.length ; i++) 
		{
			//out.println(regimen[i]);
			//out.println(cantidad[i]);
			//out.println(total[i]);

			if( cant > 0 )
			{
				COMANDO = "  UPDATE		REGIMEN_DETALLE "+
							"   SET		CANTIDAD = "+cantidad[i]+", "+
							"			TOTAL = "+total[i]+" "+
							" WHERE		ID_REGIMEN = "+regimen[i]+" "+
							"   AND		TIPO = '"+s_tipo+"' "+
							"   AND		TURNO = '"+s_turno+"' "+
							"   AND		FECHA = '"+s_fecha+"' ";				
			}else{

				COMANDO = "INSERT INTO [dbo].[REGIMEN_DETALLE] "+
						"           ([TIPO] "+
						"           ,[TURNO] "+
						"           ,[ID_REGIMEN] "+
						"           ,[CANTIDAD] "+
						"           ,[TOTAL] "+
						"           ,[FECHA] "+
						"           ,[ESTADO]) "+
						"     VALUES "+
						"           ( '"+s_tipo+"' "+
						"           , '"+s_turno+"' "+
						"           , "+regimen[i]+" "+
						"           , "+cantidad[i]+" "+
						"           , "+total[i]+" "+
						"           , '"+s_fecha+"' "+
						"           , 1 ) ";
			}
				//out.print(COMANDO);
				int x = stmt.executeUpdate(COMANDO);
		}
%>
1