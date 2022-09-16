<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb2.jsp" %>
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
	String s_mes 		= request.getParameter("f_mes");
	int i=0;
	int umes = 0;
	int d=0;
%>

<head>
<%
    response.reset();
    response.setHeader("Content-type","application/xls");
    response.setHeader("Content-disposition","inline; filename=reporte.xls");
%>
	<title>ROLES DE PERSONAL</title>
</head>
<body>

<%
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
									<font size="5"> HORAS COMPLEMENTARIAS </font> <br>
									
								</div>
							</th>							
						</tr>						
						<tr>
							<th colspan="35">
								<div align="center" >	
									<font size="5"> <%=nom_unid%> </font> <br>
									<%=s_mes%> - <%=s_anio%>
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
								//out.print(COMANDO);
								
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
						COMANDO2 = 	"EXEC SP_GET_ASISTENCIA_MAESTRO_1_COMPLE "+s_unidad+", '"+s_mes+"', '"+s_anio+"' ";

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
							COMANDO = 	"EXEC SP_GET_ASISTENCIA_MAESTRO_22 '"+rset2.getString("CODIGO")+"', '"+s_mes+"', '"+s_anio+"' ";

								rset = stmt.executeQuery(COMANDO);
								
							//out.print(COMANDO);
							while(rset.next())
							 {	d++;
%>
							<td >
								<div align="center" >	
									<b><%=rset.getString("HORADATO")%></b>
								</div>
							</td>
<%
			 				}	

						COMANDO = "  SELECT		CAST((SUM(B.HORA)) AS int) AS SUM_HORA "+
									"  FROM		ASISTENCIA_COMPLE A "+
									"  JOIN		T_Horarios B "+
									"    ON		B.CODHOR = A.CODACT "+
									" WHERE		A."+anio+" = '"+s_anio+"' "+
									"   AND		A.MES = '"+s_mes+"' "+
									"	AND 	A.idservdepartunid = "+s_unidad+" "+
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

