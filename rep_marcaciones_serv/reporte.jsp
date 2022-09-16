<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb2.jsp" %>
<%@ include file="../conectadb4.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%	
	String s_anio				= request.getParameter("f_anio");	
	String s_mes				= request.getParameter("f_mes");
	String s_departamento		= request.getParameter("f_departamento");
	String id_personal			= request.getParameter("f_id_personal");	
	String anio 				= new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
	String nom_unidad			= "";
	String mes 					= "";
	String dia 					= "";
	int i = 0;
	int sum_tardanza = 0;
	int sum_faltas = 0;


	COMANDO = "SELECT MES, upper(NOMBRE) as NOMBRE	"+
				" FROM [SIGSALUD].[dbo].MES  "+
				" WHERE MES = '"+s_mes+"' ";
		rset = stmt.executeQuery(COMANDO);

		if(rset.next())
		{

			mes = rset.getString("NOMBRE");
		}

	COMANDO = "  select	a.Nombre as NOMBRE "+
				"  from	dbo.DepartamentoUnidad a "+
				" where	a.IdDepartUnid = '"+s_departamento+"' ";

		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
		nom_unidad = rset.getString("NOMBRE");
	}	

%>

<div class="row">
	<div class="col-md-8 col-md-offset-2">
		<!-- Primary table -->
		<div class="table-primary">
			<div style="overflow-y:auto">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th colspan="6">
								<div align="center" >	
									<font size="4"><%=nom_unidad%></font> <br>
									<%=mes%> - <%=s_anio%>
								</div>								
							</th>
						</tr>
					</thead>
<%
				i = 0;
				COMANDO = "SELECT		M.CODIGO AS CODIGO, "+
							"			M.PLAZA AS PLAZA, "+
							"			TS.NOMBRE AS NOM_SITUACION, "+
							"			M.NOMBRE AS NOM_PERSONAL, "+
							"			TN.DESNIVEL AS NOM_NIVEL, "+
							"			S.Nombre AS NOM_SERVICIO, "+
							"			M.DNI_RELOG,	"+
							"			M.CODCARGO  "+
							"  FROM		ServicioMaestro SM "+
							"INNER JOIN	MAESTRO M "+
							"	ON		SM.Codigo = M.CODIGO "+
							"INNER JOIN	T_TipoSituacion TS "+
							"	ON		M.SITUACION = TS.CODIGO "+
							"LEFT JOIN	T_Nivel TN "+
							"	ON		M.CODNIVEL = TN.CODNIVEL "+
							"INNER JOIN	ServicioDepartUnidad S "+
							"	ON		SM.IdServDepartUnid = S.IdServDepartUnid "+
							" WHERE		SM.IdDepartUnid = "+s_departamento+" "+
							"   AND		M.SITUACION IN ('01','02','03','06') ";
					//out.print(COMANDO);
					rset = stmt.executeQuery(COMANDO);
				while(rset.next())
				{
%>
					<tr>
						<td>
							<table  class="table table-bordered" border="2">
								<tr>
									<td colspan="11">
										<table  class="table table-bordered" border="2">
											<tr>
												<td>
													<div align="center">
														<strong>Codigo:</strong>
													</div>
											 	</td>
												<td>
													<div align="center">
														<%=rset.getString("CODIGO")%>
													</div>
												</td>
												<td>
													<div align="center">
														<strong>Plaza:	</strong>	
													</div> 
												</td>
												<td colspan="2">
													<div align="center">
														<%=rset.getString("PLAZA")%>
													</div> 
												</td>
												<td>
													<div align="center">
														<strong>Cond.:	</strong>	
													</div>  
												</td>
												<td colspan="2">
													<div align="center">
														<%=rset.getString("NOM_SITUACION")%>
													</div>  
												</td>
											</tr>
											<tr>
												<td>
													<div align="center">
														<strong>Nombres:	</strong>			
													</div>
											 	</td>
												<td>
													<div align="center">
														<%=rset.getString("NOM_PERSONAL")%>
													</div>
												</td>
												<td>
													<div align="center">
														<strong>Nivel:	</strong>			
													</div> 
												</td>
												<td colspan="2">
													<div align="center">
														<%=rset.getString("NOM_NIVEL")%>
													</div> 
												</td>
												<td>
													<div align="center">
														<strong>Servicio:	</strong>	
													</div>  
												</td>
												<td colspan="2">
													<div align="center">
														<%=rset.getString("NOM_SERVICIO")%>
													</div>  
												</td>
											</tr>
											
										</table>
									</td>
								</tr>
							
								
<%							i = 0;
							sum_tardanza = 0;
							sum_faltas = 0;
							COMANDO2 = "SELECT		A.CODACT, "+
										"			H.HORING, "+
										"			H.HORSAL, "+
										"			H.HORA, "+
										"			CONVERT(varchar(10), A.DIA) as DIA,	"+
										"			DATENAME(DW, CONVERT(varchar(10), RIGHT('00' + Ltrim(Rtrim(A.DIA)),2))+'/'+CONVERT(varchar(10), RIGHT('00' + Ltrim(Rtrim(A.MES)),2))+'/'+CONVERT(varchar(10), A."+anio+")) as NOM_DIA, "+										
										"			[dbo].[MARCACIONES_CODIGO](M.DNI_RELOG,A."+anio+",A.MES,A.DIA,A.CODACT, H.HORING) AS MARCACION_ENTRADA, "+
										"			[dbo].[MARCACIONES_CODIGO_ULTIMO](M.DNI_RELOG,A."+anio+",A.MES,A.DIA,A.CODACT, H.HORING) AS MARCACION_SALIDA, "+
										"			[dbo].[FALTA_DIARIA](M.DNI_RELOG,A."+anio+",A.MES,A.DIA,A.CODACT, H.HORING, H.HORSAL) as FALTA,	"+
										"			CASE 1 "+
										"				WHEN [dbo].[FALTA_DIARIA](M.DNI_RELOG,A."+anio+",A.MES,A.DIA,A.CODACT, H.HORING, H.HORSAL) THEN 0 "+
										"				ELSE [dbo].[DESCUENTO_DIARIA](M.DNI_RELOG,A."+anio+",A.MES,A.DIA,A.CODACT, H.HORING) "+
										"			 END TARDANZA	 "+
										"  FROM		ASISTENCIA A "+
										"INNER JOIN	T_Horarios H "+
										"	ON		A.CODACT = H.CODHOR "+
										"INNER JOIN MAESTRO M	"+
										"	ON 		A.CODIGO = M.CODIGO	"+
										" WHERE		A.	CODIGO = '"+rset.getString("CODIGO")+"' "+
										"   AND		"+anio+" = '"+s_anio+"' "+
										"   AND		MES = '"+s_mes+"' "+
										"ORDER BY A.DIA ";
								//out.print(COMANDO2);										
								rset2 = stmt2.executeQuery(COMANDO2);
							while(rset2.next())
							{	i++;
								dia = rset2.getString("DIA");
								sum_tardanza = sum_tardanza + rset2.getInt("TARDANZA");
								sum_faltas = sum_faltas + rset2.getInt("FALTA");
							if(i==1){
%>
								<tr>
									<th>
										<div align="center">
											FECHA
										</div>  
									</th>	
									<th>
										<div align="center">
											DIA
										</div>  
									</th>											
									<th>
										<div align="center">
											TURNO
										</div>  
									</th>	
									<th>
										<div align="center">
											ENTRADA
										</div>  
									</th>	
									<th>
										<div align="center">
											SALIDA
										</div>  
									</th>		
									<th>
										<div align="center">
											Hora
										</div>  
									</th>	
									<th >
										<div align="center">
											MARCACION INGRESO
										</div>  
									</th>	
									<th >
										<div align="center">
											MARCACION SALIDA
										</div>  
									</th>	
									<th >
										<div align="center">
											TARDANZA
										</div>  
									</th>
									<th >
										<div align="center">
											FALTA
										</div>  
									</th>
									<th>
										<div align="center">
											OBSERVACION
										</div>  										
									</th>
								</tr>	
<%
							}
%>								
								<tr>
									<td>
										<div align="center">
											<%=dia%>-<%=s_mes%>-<%=s_anio%>
										</div>  
									</td>		
									<td>
										<div align="center">
											<%=rset2.getString("NOM_DIA")%>
										</div>  
									</td>										
									<td>
										<div align="center">
											<%=rset2.getString("CODACT")%>
										</div>  
									</td>	
									<td>
										<div align="center">
											<%=rset2.getString("HORING")%>
										</div>  
									</td>	
									<td>
										<div align="center">
											<%=rset2.getString("HORSAL")%>
										</div>  
									</td>
									<td>
										<div align="center">
											<%=rset2.getString("HORA")%>
										</div>  
									</td>
									<td>
										<div align="center">
											<%=rset2.getString("MARCACION_ENTRADA")%>
										</div>  
									</td>
									<td>
										<div align="center">
											<%=rset2.getString("MARCACION_SALIDA")%>
										</div>  
									</td>		
									<td>
										<div align="center">
											<%=rset2.getString("TARDANZA")%>
										</div>  
									</td>
									<td>
										<div align="center">
											<%=rset2.getString("FALTA")%>
										</div>  
									</td>
									<td>
										<div align="center">
											
										</div>  
									</td>
								</tr>

<%								
							} 

%>								<tr>
									<td colspan="8">
										<div align="center">
											<strong>TOTAL</strong>
										</div>  
									</td>
									<td>
										<div align="center">
											<strong>
												<%=sum_tardanza%>
											</strong>
										</div>  
									</td>
									<td>
										<div align="center">
											<strong>
												<%=sum_faltas%>
											</strong>
										</div>  
									</td>
									<td>
										<div align="center">
											
										</div>
									</td>
								</tr>					
							</table>
						</td>
					</tr>
				
<%					
				}
%>					
				</table>
			</div>
		</div>
	</div>
</div>