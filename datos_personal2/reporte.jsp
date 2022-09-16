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
            $('#exportar').click(SendToExport);

            function SendToExport(){
               // alert(s_unidad);
                window.open( 'excel.jsp?f_unidad='+$('#f_unidad').val());
                return false;
            }  
</script>


<div class="row">
	<div class="col-md-8 col-md-offset-2">
		<!-- Primary table -->
        <div align="center" class="panel-body">
            <!-- Button trigger modal -->
            <a href="#" title="Nuevo Profesional" id="new_personal" data-toggle="modal" data-target="#modal-blurred-bg">
                <img src="../images/icon-professional-man_small.jpg" width="75" height="75" />
            </a>
            <span class="input-group-addon">
                <a title="Exportar" href="#" id="exportar" style="border-color:#FFF"><img alt="Exportar" src="../images/excel.png" width="17" height="17" /></a>
            </span>
        </div>		

		<div class="table-primary">

			<table class="table table-bordered">
<%	d=0;
	COMANDO = 	"SELECT		M.CODIGO AS CODIGO, "+
				"			D.Nombre AS UNIDAD, "+
				"			SD.Nombre AS SERVICIO, "+
				"			isnull(CONVERT(VARCHAR(10), m.fecha_baja, 101),' ') as fecha_baja, 	"+
				"			isnull(m.motivo_baja,'') as motivo_baja, 	"+
				"			M.NOMBRE AS PERSONA, "+
				"			S.IdServMaestro AS ID, "+
				"			M.PLAZA AS PLAZA,	"+
				"			TS.nombre AS nom_situacion,	"+
				"			M.DNI AS DNI,	"+
				"			ISNULL(TS.NOMBRE,'---') NOM_SITUACION_ANT		"+
				"  FROM		MAESTRO M "+
				"  LEFT JOIN	ServicioMaestro S "+
				"    ON		M.CODIGO = S.Codigo "+
				"  LEFT JOIN ServicioDepartUnidad SD "+
				"    ON		S.IdServDepartUnid = SD.IdServDepartUnid "+
				"  LEFT JOIN	DepartamentoUnidad D "+
				"    ON		S.IdDepartUnid = D.IdDepartUnid "+
				"  LEFT JOIN T_TipoSituacion TS 	"+
				"	 ON  	M.situacion = TS.CODIGO	"+
				" WHERE		M.SITUACION = '"+s_unidad+"' ";

				if(!"X".equals(s_nomb))
				{
			COMANDO += "	AND M.NOMBRE LIKE '"+s_nomb+"%' ";
				}				
			COMANDO += " order by M.nombre asc  ";

		//out.print(COMANDO);
		rset	=	stmt.executeQuery(COMANDO);
			while(rset.next())
			{
				 d++;
				 if(d==1){
%>
				<thead>
					<tr>
						<th colspan="11">
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
								Codigo
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Plaza
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Dni
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Personal
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Situacion
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
							<div align="center" class="table-caption">
								<%=rset.getString("CODIGO")%>
							</div>
						</td>
						<td>
							<div align="center" class="table-caption">
								<%=rset.getString("PLAZA")%>
							</div>
						</td>
						<td>
							<div align="center" class="table-caption">
								<%=rset.getString("DNI")%>
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
								<a href="#" title="Historial Traslado" name="<%=rset.getString("CODIGO")%>" id="traslado" data-toggle="modal" data-target="#myModalTraslado" >					
									<%=rset.getString("nom_situacion")%>

								</a>	
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
						
						<td nowrap>
 
							<div align="center" class="table-caption">
								&nbsp;<a href="#" title="Editar Unidad Organica de Personal" name="<%=rset.getString("CODIGO")%>" id="editar" data-toggle="modal" data-target="#myModal" >[ <img src="../images/editar.gif" width="14" height="14">] </a>&nbsp;

								&nbsp;<a href="#" title="Eliminar Personal" name="<%=rset.getString("CODIGO")%>" id="eliminar_cita" data-toggle="modal" data-target="#modal-blurred-bg2" >[ <img src="../images/traslado.png" width="14" height="14">] </a>&nbsp;

							</div>
						</td>
					</tr>
<%
			}
%>
					<input type="hidden" name="f_unidad" id="f_unidad" value="<%=s_unidad%>">
				</tbody>
			</table>

		</div>
		<!-- / Primary table -->
	</div>
</div>