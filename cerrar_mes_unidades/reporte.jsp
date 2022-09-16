<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb2.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%	
	String s_anio		= request.getParameter("f_anio");	
	String s_mes		= request.getParameter("f_mes");
	String s_nomb		= request.getParameter("f_nomb");
	String s_unidad		= request.getParameter("f_unidad");
	String id_personal	= request.getParameter("f_id_personal");	
	String estado 		= "";
	String nom_unidad	= "";
	String anio 		= new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
	String s_total 		= "";
	String cant_dd		= "";
	String mes 			= "";
	int i = 0;
	int d = 0;
	int umes = 0;

	COMANDO3 = "SELECT MES, upper(NOMBRE) as NOMBRE	"+
				" FROM MES  "+
				" WHERE MES = '"+s_mes+"' ";
		rset3 = stmt3.executeQuery(COMANDO3);

		if(rset3.next())
		{

			mes = rset3.getString("NOMBRE");
		}

	COMANDO = "  select	a.Nombre as NOMBRE "+
				"  from	dbo.ServicioDepartUnidad a "+
				"  join	dbo.DepartamentoUnidad b "+
				"    on	a.IdDepartUnid = b.IdDepartUnid "+
				" where	IdServDepartUnid = '"+s_unidad+"' ";

		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
		nom_unidad = rset.getString("NOMBRE");
	}
%>
<div class="row">
	<div >
		<!-- Primary table -->
		<div class="table-primary">
			<div style="overflow-y:auto">
				<table class="table table-bordered" border="2" style="white-space:nowrap">
					<thead>

<%

	COMANDO2 = 	" EXEC SP_GET_ASISTENCIA_MAESTRO_1 "+s_unidad+", '"+s_mes+"', '"+s_anio+"' ";

		rset2 = stmt2.executeQuery(COMANDO2);
	while(rset2.next())
	{ i++; d=0;
			estado = rset2.getString("INDICADOR");

			if(i==1){
%>
						<tr>
							<th colspan="35">
								<div align="center" >	
									<font size="4"><%=nom_unidad%></font> <br>
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
						<tr>
<%
					}
%>
						<tr>
							<td>								
								<div align="center" >
									<b><%=i%></b>
								</div>
							</td>
							<td nowrap>
								<div align="left" >
									<a href="#" title="Editar Personal" name="<%=rset2.getString("CODIGO")%>" id="<%=rset2.getString("MOSTRAR")%>" data-toggle="modal" data-target="#myModal" ><b><%=rset2.getString("NOMBRE")%></b></a>
								</div>
							</td>
							<td>
								<div align="center" >
									<b><%=rset2.getString("SITUACION")%></b>
								</div>
							</td>
<%	// CE
			COMANDO = 	" EXEC SP_GET_ASISTENCIA_MAESTRO_2 '"+rset2.getString("CODIGO")+"', '"+s_mes+"', '"+s_anio+"' ";

					//out.print(COMANDO);
				rset = stmt.executeQuery(COMANDO);

			while(rset.next())
			 {	d++;
%>
							<td bgcolor="<%=rset.getString("color")%>">
								<div align="center" >	
									<b><%=rset.getString("CODTUR")%> </b>
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
					//out.print(COMANDO);
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
	} //out.print(estado);
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
							COMANDO = " SELECT 	DNI, "+
										"		UNIDAD	"+
										" FROM  FIRMA_ROL	"+
										" where ESTADO = '1' "+
										"   AND UNIDAD = "+s_unidad+" ";
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
							COMANDO = " SELECT 	DNI, "+
										"		UNIDAD	"+
										" FROM  FIRMA_ROL	"+
										" where ESTADO = '2' "+
										"   AND UNIDAD = '"+s_unidad+"' ";
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
							COMANDO = " SELECT 	DNI, "+
										"		UNIDAD	"+
										" FROM  FIRMA_ROL	"+
										" where ESTADO = '3' ";
								rset = stmt.executeQuery(COMANDO);
							if(rset.next())
							{
%>
									<img src="../images/<%=rset.getString("DNI")%>.jpg" width="250" height="165"><br>
<%			
							}
						}else if("2.0".equals(estado) || "1.0".equals(estado) ){
%>									<br>
									<a href="#" title="Aceptar Rol Personal" id="click_personal" name="<%=id_personal%>" data-toggle="modal" data-target="#modal-blurred-bg2" >
										<img src="../images/check_calendar.png" width="50" height="40">
									</a>
<%
						}
%>
								</div>	
						</td>
						<td>
								<div align="center" >	
<%
						if("4.0".equals(estado))
						{
							COMANDO = " SELECT 	DNI, "+
										"		UNIDAD	"+
										" FROM  FIRMA_ROL	"+
										" where ESTADO = '4' ";
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