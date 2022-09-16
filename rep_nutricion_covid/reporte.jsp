
<%@ include file="../conectadb.jsp" %>

<%	

	String s_fecha		= request.getParameter("f_fecha");	
	String s_turno 		= request.getParameter("f_turno");	
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

		COMANDO = "EXEC [dbo].[SP_GET_ASISTENCIA_MAESTRO_NUTRICION_COVID] '"+s_fecha+"', '"+s_turno+"' ";	

		//out.print(COMANDO);
		rset	=	stmt.executeQuery(COMANDO);
			while(rset.next())
			{
				 d++;

				 if(d==1){
%>				
				<thead>
					<tr>
						<th colspan=6>
							<div align="center" class="titulo">
								<font size="4">
									<b> REPORTE DE NUTRICION - COVID</b> 
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
								<b> UNIDAD</b>
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								<b> FIRMA </b>
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
								<b><%=rset.getString("CODIGO")%></b>
							</div>
						</td>
						<td>
							<div align="left" class="table-caption">
							
								<b><%=rset.getString("NOMBRE")%></b>
							</div>
						</td>
						<td>
							<div align="left" class="table-caption">
							
								<b><%=rset.getString("UNIDAD")%></b>
							</div>
						</td>
						<td>
							<div align="center" class="table-caption">
								<b><%=rset.getString("DNI")%></b>
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
