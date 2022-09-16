
<%@ include file="../conectadb.jsp" %>

<%	

	String s_fecha		= request.getParameter("f_fecha");	
	String s_total 		= "";
	String historia 	= "";
	int i = 0;
	int d = 0;
	
%>

<div class="row">
	<div class="col-md-10 col-md-offset-1">
		<!-- Primary table -->
		<div class="table-primary">

			<table class="table table-bordered">
<%	d=0;

		COMANDO = "EXEC [dbo].[SP_GET_ASISTENCIA_DIARIO] '"+s_fecha+"' ";	

		//out.print(COMANDO);
		rset	=	stmt.executeQuery(COMANDO);
			while(rset.next())
			{
				 d++;

				 if(d==1){
%>				
				<thead>
					<tr>
						<th colspan=9>
							<div align="center" class="titulo">
								<font size="4">
									<b> REPORTE DE NUTRICION </b> 
									<br>
									<%=s_fecha%>
								</font>

							</div>
						</th>
					</tr>
					<tr>
						<th>
							<div align="center" class="table-caption">
								<b>N&#176;</b>
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								<b> CODIGO</b>
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								<b> PERSONAL</b>
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								<b> SITUACION</b>
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								<b> SERVICIO</b>
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								<b> UNIDAD</b>
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								<b> COD. HORA </b>
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								<b> HORAS</b>
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								<b> OBSERVACION </b>
							</div>
						</th>
					</tr>
				</thead>
				<tbody>
<%
				}
%>					
					<tr>
						<td>
							<div align="center" class="table-caption">
								<b><%=d%></b>
							</div>
						</td>
						<td>
							<div align="center" class="table-caption">							
								<b><%=rset.getString("COD_PERSONAL")%></b>
							</div>
						</td>
						<td>
							<div align="left" class="table-caption">
							
								<b><%=rset.getString("NOM_PACIENTE")%></b>
							</div>
						</td>
						<td>
							<div align="center" class="table-caption">							
								<b><%=rset.getString("NOM_SITUACION")%></b>
							</div>
						</td>
						<td>
							<div align="center" class="table-caption">							
								<b><%=rset.getString("NOM_SERVICIO")%></b>
							</div>
						</td>
						<td>
							<div align="center" class="table-caption">							
								<b><%=rset.getString("NOM_DEPARTAMENTO")%></b>
							</div>
						</td>
						<td>
							<div align="center" class="table-caption">
							
								<b><%=rset.getString("COD_HORA")%></b>
							</div>
						</td>
						<td>
							<div align="center" class="table-caption">
							
								<b><%=rset.getString("HORAI")%> - <%=rset.getString("HORAF")%></b>
							</div>
						</td>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
<%
		}

%>

				</tbody>
			</table>

		</div>
		<!-- / Primary table -->
	</div>
</div>
