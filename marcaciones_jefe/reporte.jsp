
<%@ include file="../conectadb.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<%	

	String s_anio		= request.getParameter("f_anio");	
	String s_mes		= request.getParameter("f_mes");
	String s_codunid	= request.getParameter("f_codunid");
	String s_nomb		= request.getParameter("f_nomb");
	String anio 		= new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
	String s_total 		= "";
	int i = 0;
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
        <div align="center" class="panel-body">
            <!-- Button trigger modal --><!--
            <button class="btn btn-info btn-rounded" id="new_medico" data-toggle="modal" data-target="#myModal">Nuevo Profesional</button> -->
            
        </div>

		<div class="table-primary">

<table class="table table-bordered">
<%	d=0;
	COMANDO = "SELECT	 "+
	            "       B.DNI_RELOG AS DNI," + 
				"		A.CODIGO AS CODIGO, "+
				"		B.PLAZA AS PLAZA, "+
				"		B.NOMBRE AS NOMBRE, "+
				"		A.MES AS MES, "+
				"		A.TIPO AS TIPO, "+
				"		DBO.COD_UNIDAD(B.CODUNIDADORG) AS UNIDAD, "+
				"		CASE	A.INDICADOR "+
				"			WHEN 1 THEN 'editar' "+
				"			WHEN 2 THEN 'buscar' "+
				"			else 'buscar' "+
				"		END ver, "+
				"		CASE	A.INDICADOR "+
				"			WHEN 1 THEN 'ver_pdf' "+
				"			WHEN 2 THEN 'ver_pdf' "+
				"			else 'ver_pdf' "+
				"		END MOSTRAR, "+
				"		A.INDICADOR, "+
				"		UPPER(DBO.S_LABORAL(B.SITUACION)) AS CONDICION "+
				"  FROM	ASISTENCIA A "+
				"  JOIN	MAESTRO B "+
				"    ON  A.CODIGO = B.CODIGO "+
				" WHERE	A."+anio+"   = '"+s_anio+"'  "+
				"   AND	A.MES    = '"+s_mes+"'  ";
		if(!"X".equals(s_nomb))
		{
	COMANDO += "	AND NOMBRE LIKE '"+s_nomb+"%' ";
		}				
	COMANDO +=	"   AND A.idservdepartunid = '"+s_codunid+"' "+
				"   AND B.CODHORA IN ('R','M3','T3', 'M4') "+
				"   AND	A.DIA	 = 1  "+
				"ORDER BY B.SITUACION, B.NOMBRE ASC ";

		out.print(COMANDO);
		rset	=	stmt.executeQuery(COMANDO);
			while(rset.next())
			{
				 d++;
				 if(d==1){
%>
				<thead>
					<tr>
						<th>
							<div align="center" class="table-caption">
								#
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								DNI
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Plaza
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Nombre


							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Unidad
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Tipo
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Condicion
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Ver Marcaciones
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
								<%=rset.getString("DNI")%>
							</div>
						</td>
						<td>
							<div align="center" class="table-caption">
								<%=rset.getString("PLAZA")%>
							</div>
						</td>
						<td>
							<div align="left" class="table-caption">
								<%=rset.getString("NOMBRE")%>
							</div>
						</td>
						<td>
							<div align="left" class="table-caption">
								<%=rset.getString("UNIDAD")%>
							</div>
						</td>
						<td>
							<div align="center" class="table-caption">
								<%=rset.getString("TIPO")%>
							</div>
						</td>
						<td>
							<div align="left" class="table-caption">
								<%=rset.getString("CONDICION")%>
							</div>
						</td>
						<td nowrap>
 
							<div align="center" class="table-caption">
 <!-- &nbsp;<a href="#" title="Editar Personal" name="<%=rset.getString("CODIGO")%>" id="<%=rset.getString("MOSTRAR")%>" data-toggle="modal" data-target="#myModal" >[ <img src="../images/<%=rset.getString("ver")%>.gif" width="14" height="14">] </a>&nbsp; -->
 
 &nbsp;<a href="#" title="Ver Marcaciones ..." name="<%=rset.getString("DNI")%>" id="<%=rset.getString("MOSTRAR")%>" >[<img src="../images/buscar.gif" width="14" height="14">] </a>&nbsp;




<%
						if("editar".equals(rset.getString("ver")))
						{
%>
<!--
								&nbsp;<a href="#" title="Eliminar Personal" name="<%=rset.getString("CODIGO")%>" id="delete_programa" >[ <img src="../images/deleted.gif" width="14" height="14">] </a>&nbsp;
-->
<%
						}
%>
<!--
								&nbsp;<a href="#" title="Print Programa" name="<%=rset.getString("CODIGO")%>" id="print_programa" >[ <img src="../images/printer.gif" width="14" height="14">] </a>&nbsp;
-->

							</div>
						</td>
					</tr>
<%
			}
%>
								<input type="hidden" name="f_anio" id="f_anio" value="<%=s_anio%>"> 
								<input type="hidden" name="f_mes" id="f_mes" value="<%=s_mes%>"> 
				</tbody>
			</table>

		</div>
		<!-- / Primary table -->
	</div>
</div>



<%//@ include file= "../cierradb.jsp" %>