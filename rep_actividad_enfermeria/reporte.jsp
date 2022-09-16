<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb2.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%	
	String s_anio		= request.getParameter("f_anio");	
	String s_mes		= request.getParameter("f_mes");
	String s_nomb		= request.getParameter("f_nomb");
	int  s_unidad		= Integer.parseInt(request.getParameter("f_unidad"));
	String id_personal	= request.getParameter("f_id_personal");
	String s_codigo		= "";
	String estado 		= "";
	String nom_unidad	= "";
	String anio 		= new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
	String s_total 		= "";
	String cant_dd		= "";
	String mes 			= "";
	String color 		= "";
	int xmes = Integer.parseInt(s_mes);
	int i = 0;
	int d = 0;
	int umes = 0;

	COMANDO3 = "SELECT  MES, upper(NOMBRE) as NOMBRE	"+
				" FROM MES  "+
				" WHERE MES = '"+s_mes+"' ";
		rset3 = stmt3.executeQuery(COMANDO3);

		if(rset3.next())
		{
			mes = rset3.getString("NOMBRE");
		}

	COMANDO = "  SELECT		UPPER(NOMBRE) AS NOMBRE "+
				"  FROM		ServicioDepartUnidad "+
				" WHERE		idservdepartunid = "+s_unidad+" ";

		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
		nom_unidad = rset.getString("NOMBRE");
	}

	//out.print(s_nomb);

%>
<div class="row">
	<div  align="center" class="print">
		<!-- Primary table -->
		<div class="table-primary" >
			<div style="overflow-y:auto">
				<table class="table table-bordered" border="2" style="white-space:nowrap">
					<thead>
						<tr>
							<th colspan="35">
								<div align="center" >	
									<font size="8"> <%=nom_unidad%> </font> <br>
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
									AREA FUNC.
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
						</tr>
					</thead>
					<tbody>
						<tr>
<%
	COMANDO2 = 	" EXEC SP_GET_ASISTENCIA_MAESTRO_1 "+s_unidad+", '"+s_mes+"', '"+s_anio+"' ";
	rset2 = stmt2.executeQuery(COMANDO2);
	while(rset2.next())
	{ i++; d=0;
			estado = rset2.getString("INDICADOR");
%>
						<tr>
							<td>								
								<div align="center" >
									<b><%=i%></b>
								</div>
							</td>
							<td nowrap width="240">
								<div align="left">
									<b><%=rset2.getString("NOMBRE")%></b>
								</div>
							</td>
							<td align="center">
<%
	if (s_unidad == 24){
%>
								<table border="1" align="center">
  									<tr>
   										<th rowspan="2">NUTRIC.<br>INTEG.</th>
    									<th rowspan="2">C.</th>
										<th>ADULTO</th>
									</tr>
									<tr>
										<td>PEDIAT</td>
									</tr>
									<tr>
										<td rowspan="9">TRAT.<br>NUTRIC.<br>Y<br>DIETET.</td>
										<td rowspan="6">H<br>O<br>S<br>P<br>I<br>T</td>
										<td>PED</td>
									</tr>
									<tr>
										<td>CIR</td>
									</tr>
									<tr>
										<td>GIN</td>
									</tr>
									<tr>
										<td>MED</td>
									</tr>
									<tr>
										<td>NEO</td>
									</tr>
									<tr>
										<td>TRA</td>
									</tr>
									<tr>
										<td colspan="2">U.C.I.</td>
									</tr>
									<tr>
										<td colspan="2">EMERG</td>
									</tr>
									<tr>
										<td colspan="2">OBSTET</td>
									</tr>
									<tr>
										<td>C. PROD</td>
										<td colspan="2">R.N. y F.E. </td>
									</tr>
								</table>
<%
					}
	else if (s_unidad == 26){
%>
								<table border="1">
									<tr>
										<th colspan="2" align="left">C.EXTERNO</th>
									</tr>
									<tr>
										<td colspan="2">EMERGENCIA</td>
									</tr>
									<tr>
										<td rowspan="4">H<br>O<br>S<br>P</td>
										<td>MEDICINA</td>
									</tr>
									<tr>
										<td>PEDIATRIA</td>
									</tr>
									<tr>
										<td>GINECO&#8209;OBST</td>
									</tr>
									<tr>
										<td>UCI&nbsp;Y&nbsp;TRAUMA</td>
									</tr>
									<tr>
										<td colspan="2">PROGRAMAS</td>
									</tr>
								</table>
								<%
							}
			else if (s_unidad == 19){
		%>
										<table border="1">
											<tr>
												<th colspan="2" align="left">C.EXTERNO</th>
											</tr>
											<tr>
												<td colspan="2">EMERGENCIA</td>
											</tr>
											<tr>
												<td rowspan="4">H<br>O<br>S<br>P</td>
												<td>MEDICINA</td>
											</tr>
											<tr>
												<td>PEDIATRIA</td>
											</tr>
											<tr>
												<td>GINECO&#8209;OBST</td>
											</tr>
											<tr>
												<td>UCI&nbsp;Y&nbsp;TRAUMA</td>
											</tr>
											<tr>
												<td colspan="2">PROGRAMAS</td>
											</tr>
										</table>
<%
				}
%>					
			</td>
<%	
		COMANDO = " EXEC SP_GET_ASISTENCIA_MAESTRO_9 '"+rset2.getString("CODIGO")+"', '"+s_mes+"', '"+s_anio+"' ";
					//out.print(COMANDO);
			rset = stmt.executeQuery(COMANDO);
			while(rset.next())
			{	d++;
%>
							<td bgcolor="<%=rset.getString("color")%>">
<%
		If (s_unidad == 28 || s_unidad == 29 || s_unidad == 30 || s_unidad == 58 || s_unidad == 59 || s_unidad == 60 || s_unidad == 65 || s_unidad == 66 
		|| s_unidad == 67 || s_unidad == 68 || s_unidad == 69 || s_unidad == 70 || s_unidad == 71 || s_unidad == 72 || s_unidad == 74 || s_unidad == 75 
		|| s_unidad == 76 || s_unidad == 78 || s_unidad == 80 || s_unidad == 81 || s_unidad == 82 || s_unidad == 83 || s_unidad == 84 || s_unidad == 110 
		|| s_unidad == 111 || s_unidad == 119 || s_unidad == 121 || s_unidad == 122 || s_unidad == 126 ){
%>
				<table border="1">
				<tr>
					<td align="center" >
						<div align="center" style="width: 23px; height: 18px; ">	
							<b><%=rset.getString("CON")%></b>
						</div>
					</td>
				</tr>
				<tr>
					<td align="center" >
						<div align="center" style="width: 23px; height: 18px; ">	
							<b><%=rset.getString("HPE")%></b>
						</div>
					</td>
				</tr>
				<tr>
					<td align="center">
						<div align="center" style="width: 23px; height: 18px; ">	
							<b><%=rset.getString("HCI")%></b>
						</div>
					</td>
				</tr>
				<tr>
					<td align="center">
						<div align="center" style="width: 23px; height: 18px; ">	
							<b><%=rset.getString("HGI")%></b>
						</div>
					</td>
				</tr>
				<tr>
					<td align="center">
						<div align="center" style="width: 23px; height: 18px; ">	
							<b><%=rset.getString("HME")%></b>
						</div>
					</td>
				</tr>
				<tr>
					<td align="center">
						<div align="center" style="width: 23px; height: 18px; ">	
							<b><%=rset.getString("HNE")%></b>
						</div>
					</td>
				</tr>
				<tr>
					<td align="center">
						<div align="center" style="width: 23px; height: 18px; ">	
							<b><%=rset.getString("HTR")%></b>
						</div>
					</td>
				</tr>
				<tr>
					<td align="center">
						<div align="center" style="width: 23px; height: 18px; ">	
							<b><%=rset.getString("EME")%></b>
						</div>
					</td>
				</tr>
				<tr>
					<td align="center">
						<div align="center" style="width: 23px; height: 18px; ">	
							<b><%=rset.getString("CQ")%></b>
						</div>
					</td>
				</tr>
			</tr>
			<tr>
				<td align="center">
					<div align="center" style="width: 23px; height: 18px; ">	
						<b><%=rset.getString("PRO")%></b>
					</div>
				</td>
			</tr>
			<tr>
				<td align="center">
					<div align="center" style="width: 23px; height: 18px; ">	
						<b><%=rset.getString("CS")%></b>
					</div>
				</td>
			</tr>
				<tr>
					<td align="center">
						<div align="center" style="width: 23px; height: 18px; ">	
							<b><%=rset.getString("ADM")%></b>
						</div>
					</td>
				</tr>
				<tr>
					<td align="center">
						<div align="center" style="width: 23px; height: 18px; ">	
							<b><%=rset.getString("OTR")%></b>
						</div>
					</td>
				</tr>
			</table>
		<%
							}
							else if (s_unidad == 26){
		%>
										<table border="1">
											<tr>
												<td align="center" >
													<div align="center" style="width: 23px; height: 18px; ">	
														<b><%=rset.getString("CON")%></b>
													</div>
												</td>
											</tr>
											<tr>
												<td align="center" >
													<div align="center" style="width: 23px; height: 18px; ">	
														<b><%=rset.getString("PSE")%></b>
													</div>
												</td>
											</tr>
											<tr>
												<td align="center">
													<div align="center" style="width: 23px; height: 18px; ">	
														<b><%=rset.getString("HME")%></b>
													</div>
												</td>
											</tr>
											<tr>
												<td align="center">
													<div align="center" style="width: 23px; height: 18px; ">	
														<b><%=rset.getString("HPE")%></b>
													</div>
												</td>
											</tr>
											<tr>
												<td align="center">
													<div align="center" style="width: 23px; height: 18px; ">	
														<b><%=rset.getString("HGO")%></b>
													</div>
												</td>
											</tr>
											<tr>
												<td align="center">
													<div align="center" style="width: 23px; height: 18px; ">	
														<b><%=rset.getString("HCT")%></b>
													</div>
												</td>
											</tr>
											<tr>
												<td align="center">
													<div align="center" style="width: 23px; height: 18px; ">	
														<b><%=rset.getString("PRO")%></b>
													</div>
												</td>
											</tr>
										</table>
		<%
							}
							else if (s_unidad == 25){
		%>
										<table border="1">
											<tr>
												<td align="center" >
													<div align="center" style="width: 23px; height: 18px; ">	
														<b><%=rset.getString("CON")%></b>
													</div>
												</td>
											</tr>
											<tr>
												<td align="center" >
													<div align="center" style="width: 23px; height: 18px; ">	
														<b><%=rset.getString("HPE")%></b>
													</div>
												</td>
											</tr>
											<tr>
												<td align="center">
													<div align="center" style="width: 23px; height: 18px; ">	
														<b><%=rset.getString("CIR")%></b>
													</div>
												</td>
											</tr>
											<tr>
												<td align="center">
													<div align="center" style="width: 23px; height: 18px; ">	
														<b><%=rset.getString("GIN")%></b>
													</div>
												</td>
											</tr>
											<tr>
												<td align="center">
													<div align="center" style="width: 23px; height: 18px; ">	
														<b><%=rset.getString("HME")%></b>
													</div>
												</td>
											</tr>
											<tr>
												<td align="center">
													<div align="center" style="width: 23px; height: 18px; ">	
														<b><%=rset.getString("NEO")%></b>
													</div>
												</td>
											</tr>
											<tr>
												<td align="center">
													<div align="center" style="width: 23px; height: 18px; ">	
														<b><%=rset.getString("TRA")%></b>
													</div>
												</td>
											</tr>
											<tr>
												<td align="center">
													<div align="center" style="width: 23px; height: 18px; ">	
														<b><%=rset.getString("EM")%></b>
													</div>
												</td>
											</tr>
											<tr>
												<td align="center">
													<div align="center" style="width: 23px; height: 18px; ">	
														<b><%=rset.getString("ADM")%></b>
													</div>
												</td>
											</tr>
											<tr>
												<td align="center">
													<div align="center" style="width: 23px; height: 18px; ">	
														<b><%=rset.getString("OTR")%></b>
													</div>
												</td>
											</tr>
										</table>
		<%
						}
		%>
									</td>
		<%
					 }
		%>
								</tr>
		<%
				}
		%>
					</tbody>
				</table>
			</div>
				<table class="table table-bordered" border="2" align="center">
					<tr>
						<td>
								<div align="center" >
<%
						if("2.0".equals(estado) || "3.0".equals(estado) || "4.0".equals(estado))
						{
							
							COMANDO = "select top 1 ltrim(rtrim(DNI)) AS DNI from [BDPERSONAL].[dbo].[FIRMA_JEFE_SERV] WHERE ID_SERV = '"+s_unidad+"' AND INICIO < '15-"+s_mes+"-"+s_anio+"' AND FIN > '15-"+s_mes+"-"+s_anio+"'";
							rset = stmt.executeQuery(COMANDO);
							if(rset.next())
							{
%>									
									<img src="../images/<%=rset.getString("DNI")%>.jpg" width="250" height="165"><br>
<%			
							}
						}
%>
								</div>	
						</td>
						<td>
								<div align="center" >
<%
						if("2.0".equals(estado) || "3.0".equals(estado) || "4.0".equals(estado))
						{
							COMANDO = "select top 1 ltrim(rtrim(DNI)) AS DNI from [BDPERSONAL].[dbo].[FIRMA_JEFE_DEP] WHERE ID_DEPART = (SELECT IdDepartUnid FROM ServicioDepartUnidad WHERE IdServDepartUnid ='"+s_unidad+"') AND INICIO < '15-"+s_mes+"-"+s_anio+"' AND FIN > '15-"+s_mes+"-"+s_anio+"'";
							rset = stmt.executeQuery(COMANDO);
							if(rset.next())
							{
%>									
									<img src="../images/<%=rset.getString("DNI")%>.jpg" width="250" height="165"><br>
<%			
							}
						}
%>
								</div>	
						</td>
						<td>
								<div align="center" >	
<%
						if("3.0".equals(estado)  || "4.0".equals(estado))
						{
							COMANDO = "select top 1 ltrim(rtrim(DNI)) AS DNI from [BDPERSONAL].[dbo].[FIRMA_JEFE_DEP] WHERE ID_DEPART = 7 AND INICIO < '15-"+s_mes+"-"+s_anio+"' AND FIN > '15-"+s_mes+"-"+s_anio+"'";
							rset = stmt.executeQuery(COMANDO);
							if(rset.next())
							{
%>
									<img src="../images/<%=rset.getString("DNI")%>.jpg" width="250" height="165"><br>
<%			
							}
						}
%>
								</div>	
						</td>
						<td>
								<div align="center" >	
<%
						if("4.0".equals(estado))
						{
							COMANDO = "select top 1 ltrim(rtrim(DNI)) AS DNI from [BDPERSONAL].[dbo].[FIRMA_JEFE_DEP] WHERE ID_DEPART = 2 AND INICIO < '15-"+s_mes+"-"+s_anio+"' AND FIN > '15-"+s_mes+"-"+s_anio+"'";
							rset = stmt.executeQuery(COMANDO);
							if(rset.next())
							{
%>
									<img src="../images/<%=rset.getString("DNI")%>.jpg" width="250" height="165">
<%			
							}
						}
%>
								</div>	
						</td>
					</tr>					
				</table>
		</div>
		<!-- / Primary table -->
	</div>
</div>