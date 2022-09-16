<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb2.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ include file="../conectadb4.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%	

	String	s_codigo	=	"";
	String	s_unidad	=	request.getParameter("f_unidad");
	String	s_servicio	=	"";
	String	s_personal	=	"";
	String  s_nomb		=   "";
	int d = 0;
%>

<head>
<%
    response.reset();
    response.setHeader("Content-type","application/xls");
    response.setHeader("Content-disposition","inline; filename=reporte.xls");
%>
	<title>DATOS PERSONALES</title>
</head>
<body>


<div class="row">
	<div class="col-md-8 col-md-offset-2">
		<!-- Primary table -->
		<div class="table-primary">

			<table class="table table-bordered">
<%	d=0;
	COMANDO = 	"SELECT		M.CODIGO AS CODIGO,  "+
				"			isnull(D.Nombre,'') AS UNIDAD,  "+
				"			isnull(SD.Nombre,'') AS SERVICIO,  "+
				"			isnull(m.fecha_baja,' ') as fecha_baja, 	 "+
				"			isnull(m.motivo_baja,'') as motivo_baja, 	 "+
				"			M.NOMBRE AS PERSONA,  "+
				"			isnull(S.IdServMaestro,'') AS ID,  "+
				"			isnull(M.PLAZA,'') AS PLAZA,	 "+
				"			isnull(M.DNI,'') AS DNI, "+	
				"			isnull(ST.NOMBRE,'') AS NOMSITUACION,	 "+
				"			isnull(M.CODNIVEL,'') AS NIVEL,  "+
				"			isnull(M.HABER,0) AS SUELDO,  "+
				"			isnull(M.CODHORA,'') AS HORAS,  "+
				"			isnull(M.HORAS,'') AS HORA,  "+
				"			isnull(M.GRUPO_TRABAJO,'') AS GRUPO,  "+
				"			isnull(M.DNI_RELOG,'') AS RELOJ,  "+
				"			isnull(M.ESSALUD,'') AS ESSALUD,  "+
				"			isnull(M.CODSIAF,'') AS SIAF,  "+
				"			isnull(M.CADENA,'') AS CADENA,  "+
				"			ISNULL(CONVERT(VARCHAR(10), M.FECHA_ING, 101),'') as FECINGRESO,  "+
				"			ISNULL(CONVERT(VARCHAR(10), M.FECNAC, 101),'') AS FEC_NACIMIENTO  "+
				"  FROM		MAESTRO M "+
				"  LEFT JOIN	ServicioMaestro S "+
				"    ON		M.CODIGO = S.Codigo "+
				"  LEFT JOIN ServicioDepartUnidad SD "+
				"    ON		S.IdServDepartUnid = SD.IdServDepartUnid "+
				"  LEFT JOIN	DepartamentoUnidad D "+
				"    ON		S.IdDepartUnid = D.IdDepartUnid "+
				"  LEFT JOIN T_TipoSituacion ST	"+
				"	 ON  	M.SITUACION = ST.CODIGO	"+
				" WHERE		M.SITUACION = '"+s_unidad+"' order by M.NOMBRE asc ";

		//out.print(COMANDO);
		rset	=	stmt.executeQuery(COMANDO);
			while(rset.next())
			{
				 d++;
				 if(d==1){
%>
				<thead>
					<tr>
						<th colspan="10">
							<div align="center" class="table-caption">
								PERSONAL <%=rset.getString("NOMSITUACION")%>
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
								Nivel
							</div>
						</th>		
						<th>
							<div align="center" class="table-caption">
								Remuneracion
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Cod. Horario
							</div>
						</th>		
						<th>
							<div align="center" class="table-caption">
								Horas Trabajo
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Grupo Trabajo
							</div>
						</th>		
						<th>
							<div align="center" class="table-caption">
								Cod. Reloj
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Essalud
							</div>
						</th>		
						<th>
							<div align="center" class="table-caption">
								Cod.SIAF
							</div>
						</th>
						<!-- <th>
							<div align="center" class="table-caption">
								Cad. Funcional
							</div>
						</th> -->		
						<th>
							<div align="center" class="table-caption">
								Fecha Ingreso
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Fecha Nacimiento
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
<%
						if(s_unidad.equals("11") || s_unidad == "11" )
						{
%>						
						<th>
							<div align="center" class="table-caption">
								Fecha Baja
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Motivo Baja
							</div>
						</th>
<%
						}
%>
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

						<th>
							<div align="center" class="table-caption">
								<%=rset.getString("NIVEL")%>
							</div>
						</th>		
						<th>
							<div align="center" class="table-caption">
								<%=rset.getString("SUELDO")%>
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								<%=rset.getString("HORAS")%>
							</div>
						</th>		
						<th>
							<div align="center" class="table-caption">
								<%=rset.getString("HORA")%>
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								<%=rset.getString("GRUPO")%>
							</div>
						</th>		
						<th>
							<div align="center" class="table-caption">
								<%=rset.getString("RELOJ")%>
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								<%=rset.getString("ESSALUD")%>
							</div>
						</th>		
						<th>
							<div align="center" class="table-caption">
								<%=rset.getString("SIAF")%>
							</div>
						</th>
						<!-- <th>
							<div align="center" class="table-caption">
								<%=rset.getString("CADENA")%>
							</div>
						</th> -->		
						<th>
							<div align="center" class="table-caption">
								<%=rset.getString("FECINGRESO")%>
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								<%=rset.getString("FEC_NACIMIENTO")%>
							</div>
						</th>	

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
<%
						if(s_unidad.equals("11") || s_unidad == "11" )
						{
%>						
						<th>
							<div align="center" class="table-caption">
								<%=rset.getString("fecha_baja")%>
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								<%=rset.getString("motivo_baja")%>
							</div>
						</th>
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
		<!-- / Primary table -->
	</div>
</div>