<%@ include file="../conectadb.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<%	

	String	s_codigo	=	request.getParameter("f_codigo");
	String	s_unidad	=	request.getParameter("f_unidad");
	String	s_servicio	=	request.getParameter("f_servicio");
	String	s_personal	=	request.getParameter("f_personal");
	String s_nomb		= request.getParameter("f_nomb");
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
	COMANDO = "SELECT	a.idServMaestro as id, "+
				"		b.nombre as Unidad,  "+
				"		c.nombre as Servicio, "+
				"		d.NOMBRE as persona, "+
				"		a.codigo as CODIGO "+
				"  FROM	dbo.ServicioMaestro a "+
				"  JOIN	dbo.DepartamentoUnidad b "+
				"    on	a.IdDepartUnid = b.IdDepartUnid "+
				"  JOIN	dbo.ServicioDepartUnidad c "+
				"    on	a.IdServDepartUnid = c.IdServDepartUnid "+
				"  JOIN	dbo.MAESTRO d "+
				"    on	a.codigo = d.CODIGO "+
				" where	a.activo = 1 "+
				"	and	a.IdDepartUnid = "+s_unidad+"	";
				if(!"0".equals(s_servicio))
				{
			COMANDO += "	AND c.IdServDepartUnid = "+s_servicio+" ";
				}	
				if(!"X".equals(s_nomb))
				{
			COMANDO += "	AND d.NOMBRE LIKE '"+s_nomb+"%' ";
				}				
			COMANDO += " order by a.IdServDepartUnid asc, d.situacion desc, d.nombre asc  ";

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
								Personal
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Depart. / Unidad
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Servicio
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								User Rol
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Opc.
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
							<div align="left" class="table-caption">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<%=rset.getString("persona")%>
							</div>
						</td>
						<td>
							<div align="center" class="table-caption">
								<%=rset.getString("Unidad")%>
							</div>
						</td>
						<td>
							<div align="center" class="table-caption">
								<%=rset.getString("Servicio")%>
							</div>
						</td>
						<td>
							<div align="center" class="table-caption">
								<%=rset.getString("id")%>
							</div>
						</td>
						<td nowrap>
 
							<div align="center" class="table-caption">
								&nbsp;<a href="#" title="Editar Unidad Organica de Personal" name="<%=rset.getString("id")%>" id="editar" data-toggle="modal" data-target="#myModal" >[ <img src="../images/editar.gif" width="14" height="14">] </a>&nbsp;

								&nbsp;<a href="#" title="Eliminar Personal" name="<%=rset.getString("id")%>" id="delete_personal" >[ <img src="../images/deleted.gif" width="14" height="14">] </a>&nbsp;

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