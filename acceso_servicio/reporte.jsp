<%@ include file="../conectadb.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<%	

	String	s_codigo	=	request.getParameter("f_codigo");
	String	s_unidad	=	request.getParameter("f_unidad");
	String	s_servicio	=	request.getParameter("f_servicio");
	String	s_personal	=	request.getParameter("f_personal");
	int d = 0;
%>


<script language="javascript" type="text/javascript">
		$(document).ready(inicializarEventos);
	function inicializarEventos(){
		
		$('#datos2 :text').addClass("inputext");
		$('#datos2 :submit').addClass("inpusubmit");
		$('#datos2 :button').addClass("inpubutton");

		$('a[rel*=facebox]').facebox({modal: true,overlay: false});
	}
// -------------------------------------------------------------------
	function formatItem(row){ return row[0]; }
		
	function formatItemNoID(row){ return row[0]; }
		
	function formatResult(row){ return row[0].replace(/(<.+?>)/gi, ''); }	
</script>


<div class="row">
	<div class="col-md-8 col-md-offset-2">
		<!-- Primary table -->

		<div class="table-primary">

			<table class="table table-bordered">
<%	d=0;
	COMANDO = "SELECT	a.idservdepartunid as id, "+
				"		a.iddepartUnid as unidad,  "+
				"		a.nombre as servicio, "+
				"		a.codigo as cod, "+
				"		b.nombre as personal, "+
				"		a.dniacceso as dni "+
				"  FROM	dbo.ServicioDepartUnidad a "+
				"  JOIN maestro b "+
				"    on a.dniacceso = b.dni_actual "+
				" where	a.IdDepartUnid = "+s_unidad+" "+
				"   and a.activo = 1 "+
				" order by a.idservdepartunid  ";

		//out.print(COMANDO);
		rset	=	stmt.executeQuery(COMANDO);
			while(rset.next())
			{
				 d++;
				 if(d==1){
%>
				<thead>
					<tr>
						<th colspan="6">
							<div align="center" class="table-caption">
								PERSONAL ASIGNADO
							</div>
						</th>
					</tr>
					<tr>
						<th>
							<div align="center" class="table-caption">
								#
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Servicio
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								User Acceso
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Dni
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Opc
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
								<%=d%>
							</div>
						</td>
						<td>
							<div align="center" class="table-caption">
								<%=rset.getString("Servicio")%>
							</div>
						</td>
						<td>
							<div align="center" class="table-caption">
								<%=rset.getString("personal")%>
							</div>
						</td>
						<td nowrap>
 
							<div align="center" class="table-caption">
								<%=rset.getString("dni")%>
							</div>
						</td>
						<td nowrap>
 
							<div align="center" class="table-caption">
								&nbsp;<a href="#" title="Eliminar Acceso" name="<%=rset.getString("id")%>" id="delete_personal" >[ <img src="../images/deleted.gif" width="14" height="14">] </a>&nbsp;

							</div>
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