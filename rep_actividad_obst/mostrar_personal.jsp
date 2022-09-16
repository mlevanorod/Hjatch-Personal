<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb2.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>

<!DOCTYPE HTML>
<%
	String 	s_codigo 	=	request.getParameter("f_codigo");
	String  s_anio		=	request.getParameter("f_anio");
	String  s_mes		=	request.getParameter("f_mes");
	String  mes 		=	"";
	int 	e 			=   0;
	int     cont        =	0;
	double  cant 		=	0.00;
	String  cont_dm		=	"";
	String  dni 		=	"";
	String  nombre 		=	"";
	String  unidad 		=	"";
	String  cargo 		=	"";
	String  cod 		=	"";
	String  situacion 	=	"";
	String  diasSemana[] = new String[17]; 
	String  msg = new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
        	
        	diasSemana[1] = "Lunes";
        	diasSemana[2] = "Martes";
        	diasSemana[3] = "Mi&eacute;rcoles";
        	diasSemana[4] = "Jueves";
        	diasSemana[5] = "Viernes";
        	diasSemana[6] = "S&aacute;bado";
        	diasSemana[7] = "Domingo";

	//out.print(s_id_cita);
	
	COMANDO = "SELECT	DNI_ACTUAL AS DNI, "+
				"		NOMBRE, "+
				"		DBO.COD_UNIDAD(CODUNIDADORG) AS UNIDAD_ORGANICA, "+
				"		DATENAME(month, getdate() ) as mes, "+
				"		CODFUNCION AS CARGO_FUNCIONAL, "+
				"		SITUACION AS SITUACION_LABORAL "+
				"  FROM	MAESTRO "+
				" WHERE	CODIGO = '"+s_codigo+"' ";
		//out.print(COMANDO);
		rset = stmt.executeQuery(COMANDO);
		if(rset.next())
		{
			dni 			= rset.getString("DNI");
			nombre   	 	= rset.getString("NOMBRE");
			mes 			= rset.getString("mes");
			unidad 			= rset.getString("UNIDAD_ORGANICA");
			cargo 			= rset.getString("CARGO_FUNCIONAL");
			situacion 		= rset.getString("SITUACION_LABORAL");
		}	

	COMANDO3 = " SELECT 	MES, upper(NOMBRE) as NOMBRE "+
				" FROM 	MES "+
				" WHERE	MES = '"+s_mes+"' ";

		rset3 = stmt3.executeQuery(COMANDO3);
		if(rset3.next())
		{
			mes = rset3.getString("nombre");
		}

	COMANDO = " SELECT 	COUNT(1) AS CONT_DM "+
				" FROM 	ASISTENCIA "+
				" WHERE	"+msg+" = '"+s_anio+"' "+
				"   AND CODACT = 'DM' "+
				"   AND CODIGO = '"+s_codigo+"' ";

		rset = stmt.executeQuery(COMANDO);
		if(rset.next())
		{
			cont_dm = rset.getString("CONT_DM");
		}

%>


<head>
	<title>Imprimir Programacion de Personal</title>
</head>
<body>
			<table align="center" class="form-group" >
				<tr>
					<td colspan="7">
						<div align="left" class="table-header">
							<div class="table-caption">
								<!--<p><input type="button" class="printer" value="Imprimir"></p>-->
								<a href="index.jsp" title="Ver Reporte" > <img src="../images/atras.png"  width="25" height="25"> </a>
								
							</div>
						</div>												
					</td>
					<td colspan="7">
						<div align="left" class="table-header">
							<div class="table-caption">
								<!--<p><input type="button" class="printer" value="Imprimir"></p>-->
								<a href="#" title="Print Programa" class="printer" > <img src="../images/printer.gif"  width="25" height="25"> </a>
								
							</div>
						</div>												
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>
	
	<div align="center" class="print">

			<table align="center" border="2"  class="form-group" >
				<thead>
					<tr>
						<th colspan="7">
							<div align="center" class="table-header">
								<div class="table-caption">
									<%=mes%> - <%=s_anio%>
								</div>
							</div>
						</th>						
					</tr>
					<tr>
						<th colspan="7">
							<div align="left" class="table-header">
								<div class="table-caption">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NOMBRE : <%=nombre%> <br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UNIDAD &nbsp;&nbsp;: <%=unidad%>
								</div>
							</div>
						</th>						
					</tr>
					<tr>

						<th>
							<div size=8 align="center" class="table-caption">
								Lunes
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Martes
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Miercoles
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Jueves
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Viernes
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Sabado
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Domingo
							</div>
						</th>

					</tr>
				</thead>
				<tbody>
					<tr>
<%

				COMANDO = "SELECT "+
							"		CODACT, "+
							"		CASE CODACT "+
							"			WHEN 'D' THEN '#FF0000' "+
							"			ELSE '#0000FF' "+
							"	     END CODACT_COLOR, "+ 
							"		right( '00' + cast( DIA AS varchar(2)), 2 ) as DIA, "+
							"		MES, "+
							"		"+msg+", "+
							"		right( '00' + cast( DIA AS varchar(2)), 2 ) + '/' + CONVERT(varchar(2), MES) + '/' +  CONVERT(varchar(4), "+msg+") AS DAN, "+
							"		DATENAME(weekday, (right( '00' + cast( DIA AS varchar(2)), 2 ) + '/' + CONVERT(varchar(2), MES) + '/' +  CONVERT(varchar(4), "+msg+"))) as DIASEMANA,"+
							"		DATEPART(dw, (right( '00' + cast( DIA AS varchar(2)), 2 ) + '/' + CONVERT(varchar(2), MES) + '/' +  CONVERT(varchar(4), "+msg+")) ) as NUMSEMANA, "+
							"		CONVERT(VARCHAR(5), HORAI,108) as HORAI, "+
							"		CONVERT(VARCHAR(5), HORAS,108) as HORAS, "+
							"		TIPO "+
							"  FROM	ASISTENCIA "+
							" WHERE	CODIGO = '"+s_codigo+"' "+
							"   AND	"+msg+" = '"+s_anio+"' "+
							"   AND	MES	 = '"+s_mes+"' "+
							"  order by dia ";
					//out.print(COMANDO);
					rset = stmt.executeQuery(COMANDO);
				while(rset.next())
				{ e++;
					cont = rset.getInt("NUMSEMANA");
					cod = rset.getString("CODACT");
					if(e==1)
					{
						for(int i=1; i<cont; i++)
						{						
%>						

						<td>
							<div align="center" class="table-caption">
								&nbsp;
							</div>
						</td>				
<%
							
						}

%>						

						<td>
							<div align="center" class="table-caption">
								<font color="<%=rset.getString("CODACT_COLOR")%>" size=1><b><%=e%></b></font> <br>
								<font color="<%=rset.getString("CODACT_COLOR")%>" size=3><b>
									<%=rset.getString("CODACT")%> <br>
								</b></font>
								<font size=1><b>&nbsp;&nbsp;<%=rset.getString("HORAI")%> - <%=rset.getString("HORAS")%></b></font>&nbsp;&nbsp;
								
							</div>
						</td>
<%
					}else{
%>
						<td>
							<div align="center" class="table-caption">
								<font color="<%=rset.getString("CODACT_COLOR")%>" size=1><b><%=e%></b></font> <br>
								<font color="<%=rset.getString("CODACT_COLOR")%>" size=5><b>
									<%=rset.getString("CODACT")%> <br>
								</b></font>
								<font size=1><b>&nbsp;&nbsp;<%=rset.getString("HORAI")%> - <%=rset.getString("HORAS")%></b></font>&nbsp;&nbsp;
								
							</div>
						</td>
<%
					}

					if(cont==7)
					{
%>
					</tr>
					<tr>
<%
					}
				}

%>
					</tr>

				</tbody>
			</table>
	</div>
	
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> 
	<script src="print.js"></script>
	<script type="text/javascript">
	$(document).ready(function()
	{
		$(".printer").bind("click",function()
		{
			$('.print').printArea();
		});
	});
	</script>
	

	
	
	
	
	
	
