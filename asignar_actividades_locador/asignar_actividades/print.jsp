<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb2.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%	
	String s_anio		= request.getParameter("f_anio");	
	String s_mes		= request.getParameter("f_mes");
	String s_nomb		= request.getParameter("f_nomb");
	String s_unidad		= request.getParameter("f_unidad");
	String nom_unid 	= "";
	String id_personal	= request.getParameter("f_id_personal");	
	String estado 		= "";
	String anio 		= new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
	String s_total 		= "";
	String cant_dd		= "";
	String mes 			= "";
	int i = 0;
	int umes = 0;
	int d = 0;

	COMANDO3 = "SELECT MES, upper(NOMBRE) as NOMBRE	"+
				" FROM MES  "+
				" WHERE MES = '"+s_mes+"' ";
		rset3 = stmt3.executeQuery(COMANDO3);

		if(rset3.next())
		{

			mes = rset3.getString("NOMBRE");
		}

	COMANDO = "  SELECT		UPPER(NOMBRE) AS NOMBRE "+
				"  FROM		ServicioDepartUnidad "+
				" WHERE		idservdepartunid = '"+s_unidad+"' ";

		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
		nom_unid = rset.getString("NOMBRE");
	}

%>

<head>
	<title>IMPRIMIR ROLES DE PERSONAL</title>
</head>

<style type="text/css">

	H1.SaltoDePagina
 	{
    	 PAGE-BREAK-AFTER: always
 	}

</style>
 
<body>
			<table align="center" class="form-group" >
				<tr>

					<td colspan="7">
						<div align="left" class="table-header">
							<div class="table-caption">
								<!--<p><input type="button" class="printer" value="Imprimir"></p>-->
								<a href="#" title="Print Programa" class="printer" > <img src="../images/printer.gif"  width="50" height="50"> </a>
								
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

<div class="row">
	<div  align="center" class="print">
		<!-- Primary table -->
		<div class="table-primary">
				<table class="table table-bordered" width="100%" align="center">
					<tr>
						<td>
							<div align="center" >
								<img src="../images/minsa.png" width="60%" height="40%">
							</div>
						</td>
					</tr>
				</table>
				<br><br>
				<table class="table table-bordered" border="2">
					<thead>
						<tr>
							<th colspan="35">
								<div align="center" >	
									<font size="5"> <%=nom_unid%> </font> <br>
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
									SERV.
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
				
						</tr>
					</thead>
					<tbody>
						<tr>
<%

	COMANDO2 = 	"SELECT	 "+
				"		A.NOMBRE AS NOMBRE, "+
				"		substring([BDPERSONAL].[DBO].S_LABORAL(A.SITUACION),1,3) as SITUACION, "+
				"		b.INDICADOR, "+
				"		CASE	b.INDICADOR "+
				"			WHEN 1 THEN 'editar' "+
				"			WHEN 2 THEN 'editar' "+
				"			else 'buscar' "+
				"		END ver, "+
				"		CASE	b.INDICADOR "+
				"			WHEN 1 THEN 'editar_personal' "+
				"			WHEN 2 THEN 'editar_personal' "+
				"			else 'mostrar_personal' "+
				"		END MOSTRAR, "+
				"		A.codigo as CODIGO "+
				"  FROM	 "+
				"		MAESTRO A "+
				"  JOIN ASISTENCIA B "+
				"    ON A.CODIGO = B.CODIGO "+
				" WHERE	A.CODUNIDADORG = '"+s_unidad+"' "+
				"   AND B.DIA = 1 "+
				"   AND B.MES = '"+s_mes+"' "+
				"   AND B."+anio+" = '"+s_anio+"' "+
				"   AND A.CODHORA IN ('R','M3','T3') "+
				"  order by A.SITUACION, a.NOMBRE ";
				//out.print(COMANDO2);

		rset2 = stmt2.executeQuery(COMANDO2);
	while(rset2.next())
	{ i++; d=0;
			estado = rset2.getString("INDICADOR");

				if(i==11 || i==24 || i==37)
				{
%>
					</tbody>
				</table>
					<br><br><br>
				<table class="table table-bordered" border="2">
					<tbody>
<%
				}
%>
						<tr>
							<td>								
								<div align="center" >
									<b><%=i%></b>
								</div>
							</td>
							<td nowrap width="250">
								<div align="left">
									<b><%=rset2.getString("NOMBRE")%></b>
								</div>
							</td>
							<td>
								<table border="1">
									<tr>
										<td>CE. Ma</td>
									</tr>
									<tr>
										<td>CE. Ta</td>
									</tr>
								</table>
							</td>
<%	// CE
			COMANDO = " SELECT	 "+
						"		CASE B.CODTUR	"+
						"			WHEN 'D' THEN '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'  "+
						"			ELSE B.CODTUR "+
						"		 END CODTUR, "+
						"		CASE SUBSTRING(DATENAME(weekday, (right( '00' + cast( a.DIA AS varchar(2)), 2 ) + '/' + CONVERT(varchar(2), a.MES) + '/' + CONVERT(varchar(4), a."+anio+"))),1,2) "+
						"			WHEN 'DO' then '#FEBDBD' "+
						"			else '#FDFCFC' "+
						"		end color,  "+
						"		CASE [dbo].[FN_ACTIVIDAD_ASIST](A.DIA, A.MES, A."+anio+", Convert(Int, A.CODIGO), 4)  "+
						"			 WHEN 'X' THEN '&nbsp;X&nbsp;&nbsp;' "+
						"			 ELSE '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' "+
						"	     END CEM, "+
						"		CASE [dbo].[FN_ACTIVIDAD_ASIST](A.DIA, A.MES, A."+anio+", Convert(Int, A.CODIGO), 5)  "+
						"			 WHEN 'X' THEN '&nbsp;X&nbsp;&nbsp;' "+
						"			 ELSE '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' "+
						"		 END CET, "+
						"		A.HORAI,    "+
						"		A.HORAS,   "+
						"		A.TIPO "+
						"  FROM	ASISTENCIA A "+
						"  JOIN T_HORARIOS B "+
						"    ON A.CODACT = B.CODHOR "+
						" where	A."+anio+" = '"+s_anio+"' "+
						"   and	A.mes = '"+s_mes+"'   "+
						"   and A.codigo = '"+rset2.getString("CODIGO")+"'  "+
						" order by A.dia  ";
					//out.print(COMANDO);
				rset = stmt.executeQuery(COMANDO);

			while(rset.next())
			 {	d++;
%>
							<td bgcolor="<%=rset.getString("color")%>">
								<table border="1">
									<tr>
										<td align="center">
											<div align="center" >	
												<b><%=rset.getString("CEM")%></b>
											</div>
										</td>
									</tr>
									<tr>
										<td align="center">
											<div align="center" >	
												<b><%=rset.getString("CET")%></b>
											</div>
										</td>
									</tr>
								</table>

							</td>
<%
			 }

%>

    					</tr>

<%
	} //out.print(estado);
%>


					</tbody>
				</table>
					<br><br>
				<table class="table table-bordered" width="60%" align="center">
					<tr>
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
									<img src="../images/<%=rset.getString("DNI")%>.png" width="180" height="95"><br>
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
									<img src="../images/07666689.png" width="180" height="95"><br>
<%			
							}
						}else if("2.0".equals(estado)){
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
									<img src="../images/200361992.png" width="180" height="115">
<%			
							}
						}else if("2.0".equals(estado) || "3.0".equals(estado))
						{
%>									
									<a href="#" title="Aceptar Rol Director" id="click_director"  data-toggle="modal" data-target="#modal-blurred-bg3" name="<%=id_personal%>">
										<img src="../images/check_direc.png" width="55" height="55">
									</a>

<%
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
