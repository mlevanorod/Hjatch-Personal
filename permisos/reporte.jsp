
<%@ include file="../conectadb.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<%	

	String s_anio		= request.getParameter("f_anio");	
	String s_mes		= request.getParameter("f_mes");
	String s_nomb		= request.getParameter("f_nomb");
	String s_unidad		= request.getParameter("f_unidad");
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


		<div class="table-primary">

			<table class="table table-bordered">
<%	d=0;
	COMANDO = /*"SELECT	 "+
				"		A.CODIGO AS CODIGO, "+
				"		B.PLAZA AS PLAZA, "+
				"		B.NOMBRE AS NOMBRE, "+
				"		A.MES AS MES, "+
				"		A.TIPO AS TIPO, "+
				"		b.SEXO AS SEXO, "+
				"		B.CODUNIDADORG, "+
				"		DBO.COD_UNIDAD(B.CODUNIDADORG) AS UNIDAD, "+
				"		A.INDICADOR, "+
				"		UPPER(DBO.S_LABORAL(B.SITUACION)) AS CONDICION "+
				"  FROM	ASISTENCIA A "+
				"  JOIN	MAESTRO B "+
				"    ON  A.CODIGO = B.CODIGO "+
				" WHERE	A."+anio+" = YEAR(GETDATE())  "+
				"   AND	A.MES    = MONTH(GETDATE())  ";
		if(!"X".equals(s_nomb))
		{
	COMANDO += "	AND B.NOMBRE LIKE '"+s_nomb+"%' ";
		}	
	COMANDO +=	"   AND	A.DIA	 = 1  "+
				"   AND B.SITUACION  NOT IN ('11','20') "+
				"ORDER BY B.CODUNIDADORG, B.NOMBRE ASC ";
				*/
				"SELECT		B.CODIGO AS CODIGO,  "+
				"			B.PLAZA AS PLAZA,  "+
				"			B.NOMBRE AS NOMBRE, "+ 
				"			b.SEXO AS SEXO,  "+
				"			B.CODUNIDADORG,  "+
				"			DBO.COD_UNIDAD(B.CODUNIDADORG) AS UNIDAD,  "+
				"			UPPER(DBO.S_LABORAL(B.SITUACION)) AS CONDICION  "+
				"  FROM		MAESTRO B  "+
				" WHERE		B.SITUACION NOT IN ('11','20') ";
		if(!"X".equals(s_nomb))
		{
	COMANDO += "	AND B.NOMBRE LIKE '"+s_nomb+"%' ";
		}	
	COMANDO += "   ORDER BY B.NOMBRE ASC ";

		//out.print(COMANDO);
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
								Condicion
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
							<div align="left" class="table-caption">
								<%=rset.getString("CONDICION")%>
							</div>
						</td>
						<td >
 
							<div align="center" class="table-caption">
								&nbsp;<a href="#" title="Licencia del Personal" name="<%=rset.getString("CODIGO")%>" id="licencias" >[ <img src="../images/licencia.png" width="20" height="20">] </a>&nbsp;
							
								&nbsp;<a href="#" title="Vacaciones del Personal" name="<%=rset.getString("CODIGO")%>" id="vacaciones" >[ <img src="../images/vacaciones.png" width="20" height="20">] </a>&nbsp;

								&nbsp;<a href="#" title="Historial de Vacaciones" name="<%=rset.getString("CODIGO")%>" id="rep_vacaciones" >[ <img src="../images/historial.jpg" width="20" height="20">] </a>&nbsp;
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