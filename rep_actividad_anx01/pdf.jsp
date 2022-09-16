<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb2.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%	
	String s_anio		= request.getParameter("f_anio");	
	String s_mes		= request.getParameter("f_mes");
	String s_nomb		= request.getParameter("f_nomb");
	int  s_unidad		= Integer.parseInt(request.getParameter("f_unidad"));
	String id_personal	= request.getParameter("f_id_personal");
	String s_codigo		= "";
	String estado 		= "";
	String nom_unidad	= "";
	String cod_servicio	= "";
        String nom_servicio	= "";
        String anio 		= new String("AÃ‘O".getBytes("ISO-8859-1"),"UTF-8");
	String s_total 		= "";
	String cant_dd		= "";
	String mes 		= "";
	String color 		= "";
        String cod_unidad       = "";
	int xmes = Integer.parseInt(s_mes);
	int i = 0;
	int d = 0;
	int umes = 0;

	COMANDO3 = "SELECT  MES, upper(NOMBRE) as NOMBRE	"+
				" FROM MES  "+
				" WHERE MES = '"+s_mes+"' ";
		rset3 = stmt3.executeQuery(COMANDO3);

		if(rset3.next())
		{
			mes = rset3.getString("NOMBRE");
		}

	COMANDO = "  SELECT		CODIGO,IdDepartUnid,UPPER(NOMBRE) AS NOMBRE "+
				"  FROM		ServicioDepartUnidad "+
				" WHERE		idservdepartunid = "+s_unidad+" ";

		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
                cod_servicio = rset.getString("IdDepartUnid");
                cod_unidad = rset.getString("CODIGO");
		nom_unidad = rset.getString("NOMBRE");
        }

        COMANDO = "  SELECT		UPPER(NOMBRE) AS NOMBRE "+
				"  FROM		DepartamentoUnidad "+
				" WHERE		iddepartunid = "+cod_servicio+" ";

		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
            nom_servicio = rset.getString("NOMBRE");

	}        
	//out.print(s_nomb);

%>
<head>
	<title>ANEXO 01 CUADRO REFERENCIAL DE LA PROGRAMACION DE LOS TURNOS DEL TRABAJO MEDICO</title>
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
			</table>

<div class="row">
	<div  align="center" class="print">
		<!-- Primary table -->
		<div class="table-primary">
			<table class="form-group" border="1">
                                <tr>
                                    <th>AÑO</th> 
                                    <th>MES</th> 
                                    <th>HOSPITA</th> 
                                    <th>CATEGORIA</th> 
                                </tr>
                                <tr>
                                	<td width="120" align="center"> <%=s_anio%> </td>
                                	<td width="120" align="center"> <%=mes%> </td>
                                	<td width="400" align="center"> HOSPITAL JOSE AGURTO TELLO DE CHOSICA</td>
                                	<td width="120" align="center"> II-2 </td>                                       
                                </tr>
                        </table>
<br>                
			<table  class="form-group"  border="1">
                                <tr>
                                    <th>DEPARTAMENTO</th> 
                                    <th>SERVICIO</th> 
                                </tr>
                                <tr>
                                	<td width="380" align="center"> <%=nom_servicio%>  </td>
                                	<td width="380" align="center"> <%=nom_unidad%> </td>
                                </tr>
			</table>
<br>
				<table class="table table-bordered" border="2" style="white-space:nowrap">
					<thead>
						<tr>
							<th colspan="35">
								<div align="center" >	
									<font size="5"> <%=nom_unidad%> </font> <br>
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
							<th>
								<div align="center">
									DNI
								</div>
							</th>
							<th>
								<div align="center">
									SITUACION
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

<%

	//COMANDO2 = 	" EXEC SP_GET_ASISTENCIA_MAESTRO_1 "+s_unidad+", '"+s_mes+"', '"+s_anio+"' ";

COMANDO2 = 	"	SELECT	 "+
			"			A.codigo as CODIGO,  "+
                        "			A.NOMBRE AS NOMBRE,  "+
			"			substring([DBO].S_LABORAL(A.SITUACION),1,3) as SITUACION,  "+
			"			ISNULL(A.DNI_ACTUAL,'---') AS DNI "+
			"	  FROM	  "+
			"			MAESTRO A  "+
			"	  JOIN ASISTENCIA B  "+
			"	    ON A.CODIGO = B.CODIGO  "+
			"	 WHERE	B.idservdepartunid = "+s_unidad+" "+
			"	   AND B.DIA = 1  "+
			"	   AND B.MES = '"+s_mes+"' "+
			"	   AND B."+anio+" = '"+s_anio+"' ";
		if(!"X".equals(s_nomb))
		{
	COMANDO2 += "	AND A.NOMBRE LIKE '"+s_nomb+"%' ";
		}
//	COMANDO2 += "	   AND A.CODHORA IN ('R','M3','T3')  "+
//			"	  order by b.INDICADOR desc, A.SITUACION, a.NOMBRE  ";

		rset2 = stmt2.executeQuery(COMANDO2);
	while(rset2.next())
	{ i++; d=0;
			//estado = rset2.getString("INDICADOR");

//				if(i==7 || i==13 || i==19)
//				{
%>
						<tr>
							<td>								
								<div align="center" >
									<b><%=i%></b>
								</div>
							</td>
							<td nowrap="5" width="250">
								<div align="left">
									<b><%=rset2.getString("NOMBRE")%></b>
								</div>
							</td>
							<td >
								<div align="center">
									<b><%=rset2.getString("DNI")%></b>
								</div>
							</td>
							<td >
								<div align="center">
									<b><%=rset2.getString("SITUACION")%></b>
								</div>
							</td>
							<td align="center"> 
								<table border="1">
									<tr>
										<td>
											<div align="center" style="width: 40px; height: 20px; ">EMER.</div>
										</td>
									</tr>
									<tr>
										<td>
											<div align="center" style="width: 40px; height: 20px; ">HOS.</div>
										</td>
									</tr>
									<tr>
										<td> 
											<div align="center" style="width: 40px; height: 20px; ">SOP.</div>
										</td>
									</tr>
									<tr>
										<td> 
											<div align="center" style="width: 40px; height: 20px; ">CEM.</div>
										</td>
									</tr>
									<tr>
										<td> 
											<div align="center" style="width: 40px; height: 20px; ">ADM.</div>
										</td>
									</tr>
									<tr>
										<td> 
											<div align="center" style="width: 40px; height: 20px; ">COB.</div>
										</td>
									</tr>
									<tr>
										<td> 
											<div align="center" style="width: 40px; height: 20px; ">PROC.</div>
										</td>
									</tr>
									<tr>
										<td> 
											<div align="center" style="width: 40px; height: 20px; ">INC.</div>
										</td>
									</tr>
									<tr>
										<td> 
											<div align="center" style="width: 40px; height: 20px; ">CMT.</div>
										</td>
									</tr>
									<tr>
										<td> 
											<div align="center" style="width: 40px; height: 20px; ">CAP.</div>
										</td>
									</tr>
									<tr>
										<td> 
											<div align="center" style="width: 40px; height: 20px; ">JMED.</div>
										</td>
									</tr>
									<tr>
										<td> 
											<div align="center" style="width: 40px; height: 20px; ">TLM.</div>
										</td>
									</tr>
									<tr>
										<td> 
											<div align="center" style="width: 40px; height: 20px; ">AUD.</div>
										</td>
									</tr>
									<tr>
										<td> 
											<div align="center" style="width: 40px; height: 20px; ">REFC.</div>
										</td>
									</tr>
									<tr>
										<td> 
											<div align="center" style="width: 40px; height: 20px; ">SUP.</div>
										</td>
									</tr>
                                                                </table>
							</td>
<%	// CE
			COMANDO = " EXEC SP_GET_ASISTENCIA_MAESTRO_12 '"+rset2.getString("CODIGO")+"', '"+s_mes+"', '"+s_anio+"' ";
	//out.print(COMANDO);
				rset = stmt.executeQuery(COMANDO);

			while(rset.next())
			 {	d++;
%>
							<td>
								<table border="1">
									<tr>
										<td align="center" >
											<div align="center" style="width: 30px; height: 20px; ">	
												<b><%=rset.getString("EMER")%></b>
											</div>
										</td>
									</tr>
									<tr>
										<td align="center">
											<div align="center" style="width: 30px; height: 20px; ">	
												<b><%=rset.getString("HOSP")%></b>
											</div>
										</td>
									</tr>
									<tr>
										<td align="center">
											<div align="center" style="width: 30px; height: 20px; ">	
												<b><%=rset.getString("SOP")%></b>
											</div>
										</td>
									</tr>
									<tr>
										<td align="center">
											<div align="center" style="width: 30px; height: 20px; ">	
												<b><%=rset.getString("CEM")%></b>
											</div>
										</td>
									</tr>
									<tr>
										<td align="center">
											<div align="center" style="width: 30px; height: 20px; ">	
												<b><%=rset.getString("ADM")%></b>
											</div>
										</td>
									</tr>
									<tr>
										<td align="center">
											<div align="center" style="width: 30px; height: 20px; ">	
												<b><%=rset.getString("COB")%></b>
											</div>
										</td>
									</tr>
									<tr>
										<td align="center">
											<div align="center" style="width: 30px; height: 20px; ">	
												<b><%=rset.getString("PRC")%></b>
											</div>
										</td>
									</tr>
									<tr>
										<td align="center">
											<div align="center" style="width: 30px; height: 20px; ">	
												<b><%=rset.getString("INC")%></b>
											</div>
										</td>
									</tr>
									<tr>
										<td align="center">
											<div align="center" style="width: 30px; height: 20px; ">	
												<b><%=rset.getString("CMT")%></b>
											</div>
										</td>
									</tr>
									<tr>
										<td align="center">
											<div align="center" style="width: 30px; height: 20px; ">	
												<b><%=rset.getString("CAP")%></b>
											</div>
										</td>
									</tr>
									<tr>
										<td align="center">
											<div align="center" style="width: 30px; height: 20px; ">	
												<b><%=rset.getString("JME")%></b>
											</div>
										</td>
									</tr>
									<tr>
										<td align="center">
											<div align="center" style="width: 30px; height: 20px; ">	
												<b><%=rset.getString("TLM")%></b>
											</div>
										</td>
									</tr>
									<tr>
										<td align="center">
											<div align="center" style="width: 30px; height: 20px; ">	
												<b><%=rset.getString("AUD")%></b>
											</div>
										</td>
									</tr>
									<tr>
										<td align="center">
											<div align="center" style="width: 30px; height: 20px; ">	
												<b><%=rset.getString("REFC")%></b>
											</div>
										</td>
									</tr>
									<tr>
										<td align="center">
											<div align="center" style="width: 30px; height: 20px; ">	
												<b><%=rset.getString("SUP")%></b>
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
				<table class="table table-bordered" border="2" align="center">
					<tr>
						<td>
								<div align="center" >
<%
						if(i>1)
						{
							COMANDO = " SELECT 	DNI, "+
										"		UNIDAD	"+
										" FROM  FIRMA_ROL	"+
										" where ESTADO = '2' "+
										"   AND UNIDAD = "+s_unidad+" ";
								rset = stmt.executeQuery(COMANDO);
							if(rset.next())
							{
%>									
									<img src="../images/<%=rset.getString("DNI")%>.jpg" width="250" height="165"><br>
<%			
							}
						}
%>
								</div>	
						</td>
						<td>
								<div align="center" >	
<%
						if(i>1)
						{
							COMANDO = " SELECT 	DNI, "+
										"		UNIDAD	"+
										" FROM  FIRMA_ROL	"+
										" where ESTADO = '3' ";
								rset = stmt.executeQuery(COMANDO);
							if(rset.next())
							{
%>
									<img src="../images/<%=rset.getString("DNI")%>.jpg" width="250" height="165"><br>
<%			
							}
						}
%>
								</div>	
						</td>
						<td>
								<div align="center" >	
<%
						if(i>1)
						{
							COMANDO = " SELECT 	DNI, "+
										"		UNIDAD	"+
										" FROM  FIRMA_ROL	"+
										" where ESTADO = '4' ";
								rset = stmt.executeQuery(COMANDO);
							if(rset.next())
							{
%>
									<img src="../images/<%=rset.getString("DNI")%>.jpg" width="250" height="165">
<%			
							}
						}
%>
								</div>	
						</td>
					</tr>					
				</table>
                        <br>
			<table  class="form-group" style="font-size: 14">
                                <tr>
                                	<td>[EME] = EMGERGENCIA </td>
                                        <td>      </td>
                                	<td>[HOS] = VISITA A HOSP</td>
                                        <td>       </td>
                                        <td>[SOP] = SALA DE OPERACIONES</td>
                                        <td>       </td>
                                        <td>[CEM] = CONSULTA EXTERNA</td>
                                        <td>       </td>
                                        <td>[ADM] = ADMINISTRATIVO</td>
                                </tr>
                                <tr>
                                        <td>[COB] = CENTRO OBSTETRICO</td>
                                        <td>       </td>
                                        <td>[PROC] = PROCD.DIAG.TERAP</td>
                                        <td>       </td>
                                        <td>[INC] = INTERCONSULTAS </td>
                                        <td>      </td>
                                	<td>[CMT] = COMITE</td>
                                        <td>       </td>
                                        <td>[CAP] = CAPACITACION</td>
                                </tr>
                                <tr>
                                        <td>[JMED] = JUNTA MEDICA</td>
                                        <td>       </td>
                                        <td>[TLM] = TELEMEDICINA</td>
                                        <td>       </td>
                                        <td>[AUD] = AUDITORIA</td>
                                        <td>       </td>
                                        <td>[REFC] = REFERENCIA Y CONTRAREFERENCIA</td>
                                        <td>       </td>
                                        <td>[SUP] = SUPERVISION</td>
                                </tr>
                        </table>  



		</div>
		<!-- / Primary table -->
	</div>
</div>
	<script src="../js/jquery.min.js"></script> 
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
</body>
