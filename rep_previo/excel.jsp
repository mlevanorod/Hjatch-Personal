<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb2.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ include file="../conectadb4.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%	
	String s_anio		= request.getParameter("f_anio");	

	String s_nomb		= request.getParameter("f_nomb");
	String s_unidad		= request.getParameter("f_unidad");
	String nom_unid 	= "";
	String id_personal	= request.getParameter("f_id_personal");	
	String estado 		= "";
	String anio 		= new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
	String s_total 		= "";
	String cant_dd		= "";
	String mes 			= "";
	String s_mes;
	int i;
	int umes;
	int d;
%>

<head>
<%
    response.reset();
    response.setHeader("Content-type","application/xls");
    response.setHeader("Content-disposition","inline; filename=reporteEjecG("+s_anio+").xls");
%>
	<title>ROLES DE PERSONAL</title>
</head>
<body>

<%
		for(int a=1; a<=12; a++ )
		{
				if(a > 9){
					s_mes = ""+a;
					mes = ""+a;
				}else{
					s_mes = "0"+a;
					mes = "0"+a;
				}
			
			i = 0;
			umes = 0;
			d = 0;

			COMANDO3 = "SELECT MES, upper(NOMBRE) as NOMBRE	"+
				" FROM MES  "+
				" WHERE MES = '"+s_mes+"' ";
			rset3 = stmt3.executeQuery(COMANDO3);

			if(rset3.next())
			{

				mes = rset3.getString("NOMBRE");
			}


			COMANDO4 = 	" select IdServDepartUnid "+
						" from ASISTENCIA "+
						" where MES = '"+s_mes+"' and "+anio+" = '"+s_anio+"' and IdServDepartUnid is not null "+
						" group by IdServDepartUnid ";
			rset4 = stmt4.executeQuery(COMANDO4);

			while(rset4.next())
			{ i=0;

				s_unidad = rset4.getString("IdServDepartUnid");
			


			COMANDO = "  SELECT		UPPER(NOMBRE) AS NOMBRE "+
						"  FROM		ServicioDepartUnidad "+
						" WHERE		idservdepartunid = '"+s_unidad+"' ";

				rset = stmt.executeQuery(COMANDO);
			if(rset.next())
			{
				nom_unid = rset.getString("NOMBRE");
			}
%>	


				<table class="table table-bordered" border="2">
					<thead>
						<tr>
							<th colspan="35">
								<div align="center" >	
									<font size="5"> <%=nom_unid%> </font> <br>
									<%=mes%> - <%=s_anio%>
								</div>
							</th>							
						</tr>
						<tr>
							<th >
								<div align="center" >	
									N
								</div>
							</th>
							<th >
								<div align="center" >	
									NOMBRE
								</div>
							</th>
							<th >
								<div align="center" >	
									COND
								</div>
							</th>
<%
								COMANDO = "SELECT dbo.DiasEnMes('"+s_anio+"-"+s_mes+"-01') as dia_ultimo ";
									rset = stmt.executeQuery(COMANDO);
								if(rset.next())
								{
									umes = rset.getInt("dia_ultimo");
								}

								for(int y=1; y<=umes; y++ )
								{
%>				
							<th >
								<div align="center" >	
									<%=y%> <br>
<%
									COMANDO = "SELECT SUBSTRING(DATENAME(weekday, (right( '00' + cast( "+y+" AS varchar(2)), 2 ) + '/' + CONVERT(varchar(2), "+s_mes+") + '/' + CONVERT(varchar(4), "+s_anio+"))),1,2) as DIASEMANA ";
										rset = stmt.executeQuery(COMANDO);
										if(rset.next())
										{
												out.print(rset.getString("DIASEMANA"));
										}
%>
								</div>
							</th>
<%
								}
%>				
							<th>
								<div align="center" >	
									HORAS
								</div>								
							</th>						
						</tr>
					</thead>
					<tbody>
<%
						COMANDO2 = 	" SP_MOSTRAR_PERSONAL_ASISTENCIAE "+s_unidad+", '"+s_mes+"', '"+s_anio+"' ";
									//out.print(COMANDO2);

							rset2 = stmt2.executeQuery(COMANDO2);
						while(rset2.next())
						{ 
							i++; d=0;
							estado = rset2.getString("INDICADOR");
%>
						<tr>
							<td>								
								<div align="center" >
									<b><%=i%></b>
								</div>
							</td>
							<td nowrap width="400">
								<div align="left">
									<b><%=rset2.getString("NOMBRE")%></b>
								</div>
							</td>
							<td>
								<div align="center" >
									<b><%=rset2.getString("SITUACION")%></b>
								</div>
							</td>
<%
							COMANDO = 	" SP_MOSTRAR_PERSONAL_ASISTENCIAE1 '"+rset2.getString("CODIGO")+"', '"+s_mes+"', '"+s_anio+"' ";
									//out.print(COMANDO);
								rset = stmt.executeQuery(COMANDO);

							while(rset.next())
							 {	d++;
%>
							<td bgcolor="<%=rset.getString("color")%>">
								<div align="center" >	
									<b><%=rset.getString("CODTUR")%></b>
								</div>
							</td>
<%
			 			}	

						COMANDO = "  SELECT		CAST((SUM(B.HORA)) AS int) AS SUM_HORA "+
									"  FROM		ASISTENCIA A "+
									"  JOIN		T_Horarios B "+
									"    ON		B.CODHOR = A.CODACT "+
									" WHERE		A."+anio+" = '"+s_anio+"' "+
									"   AND		A.MES = '"+s_mes+"' "+
									"   AND		A.CODIGO = '"+rset2.getString("CODIGO")+"' ";

							rset = stmt.executeQuery(COMANDO);
						if(rset.next())
						{
							cant_dd = rset.getString("SUM_HORA");
						}
							d = (umes - d);
							for(int t=1; t<=d; t++)
							{
%>
							<td>
								<div align="center" >	
									&nbsp;
								</div>								
							</td>					
<%	
							}
%>
							<td>
								<div align="center" >	
									<b><%=rset.getString("SUM_HORA")%></b>
								</div>								
							</td>
    					</tr>

<%
						} 
%>

				</tbody>
			</table>
		<br><br>
<%
						} }
%>
