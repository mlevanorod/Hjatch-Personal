<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb2.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ include file="../conectadb4.jsp" %>
<%@ include file="../conectadb5.jsp" %>
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
	String anio 		= new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
	String s_total 		= "";
	String mes 			= "";
	String color 		= "";
    String cod_unidad   = "";
 	int  cant_prog		=	0;
	int xmes 			= Integer.parseInt(s_mes);
	int i = 0;
	int d = 0;
	int umes = 0;
	int num = 0;
	int totalv= 0;
	int total= 0;
	String cad = "";


	COMANDO3 = "SELECT  MES, upper(NOMBRE) as NOMBRE	"+
				" FROM MES  "+
				" WHERE MES = '"+s_mes+"' ";
		rset3 = stmt3.executeQuery(COMANDO3);

		if(rset3.next())
		{
			mes = rset3.getString("NOMBRE");
		}

	COMANDO = "  SELECT		CODIGO,UPPER(NOMBRE) AS NOMBRE "+
				"  FROM		ServicioDepartUnidad "+
				" WHERE		idservdepartunid = "+s_unidad+" ";

		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
            cod_unidad = rset.getString("CODIGO");
            nom_unidad = rset.getString("NOMBRE");
	}

	//out.print(s_nomb);

%>
<div class="row">
	<div  align="center" class="print">
		<!-- Primary table -->
		<div class="table-primary">
			<div style="overflow-y:auto">
				<table class="table table-bordered" border="2" style="white-space:nowrap">
					<thead>
						<tr>
							<th colspan="37">
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
									ACTIVIDADES
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
%>							<th>
								<div align="center">
									TOTALES
								</div>
							</th>
				
						</tr>
					</thead>
					<tbody>
						<tr>
<%

	//COMANDO2 = 	" EXEC SP_GET_ASISTENCIA_MAESTRO_1 "+s_unidad+", '"+s_mes+"', '"+s_anio+"' ";

COMANDO2 = 	"	SELECT	 "+
			"			A.codigo as CODIGO,  "+
			"			B.INDICADOR as INDICADOR,  "+
            "			A.NOMBRE AS NOMBRE,  "+
			"			substring([DBO].S_LABORAL(A.SITUACION),1,3) as SITUACION,  "+
			"			ISNULL(A.DNI_ACTUAL,'---') AS DNI "+
			"	  FROM	  "+
			"			MAESTRO A  "+
			"	  JOIN ASISTENCIAPROG B  "+
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
			//	  order by b.INDICADOR desc, A.SITUACION, a.NOMBRE  "
		//out.print(COMANDO2);
		rset2 = stmt2.executeQuery(COMANDO2);
	while(rset2.next())
	{ i++; d=0;
			estado = rset2.getString("INDICADOR");

//				if(i==7 || i==13 || i==19)
//				{
s_codigo=rset2.getString("CODIGO");
COMANDO = "  SELECT		CAST((SUM(B.HORA)) AS int) AS SUM_HORA "+
						"  FROM		ASISTENCIAPROG A "+
						"  JOIN		T_Horarios B "+
						"    ON		B.CODHOR = A.CODACT "+
						" WHERE		A."+anio+" = '"+s_anio+"' "+
						"   AND		A.MES = '"+s_mes+"' "+
						"   AND		A.CODIGO = '"+s_codigo+"' ";

		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
		cant_prog = Integer.parseInt(rset.getString("SUM_HORA"));
	}

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
									 <%
									 COMANDO4 = 	"SELECT NOMBRE FROM ACTIVIDADES AC INNER JOIN REL_ACTIVIDADES RA ON AC.ID_ACTIVIDAD = RA.ID_ACTIVIDAD"+
													" WHERE RA.IdServDepartUnid = '"+s_unidad+"'";
													rset4 = stmt4.executeQuery(COMANDO4);
													while(rset4.next()){ 
													total=0;
									%>
													<tr>
														<td colspan="2"><%=rset4.getString("NOMBRE")%></td>
													</tr>
									<%	// CE
										}
									%>
													<tr>
														<td colspan="2"><b>TOTAL</b></td>
													</tr>

													</table>
							</td>
								<%	// CE
											COMANDO = " EXEC SP_GET_ASISTENCIA_MAESTRO_15 '"+rset2.getString("CODIGO")+"', '"+s_mes+"', '"+s_anio+"' ";
									//out.print(COMANDO);
												rset = stmt.executeQuery(COMANDO);

											while(rset.next())
											 {	d++;
											 	totalv=0;
											 	num=0;
								%>
															<td>
																<table border="1">
																	<%

										COMANDO4 = 	"SELECT ABREVIATURA FROM ACTIVIDADES AC INNER JOIN REL_ACTIVIDADES RA ON AC.ID_ACTIVIDAD = RA.ID_ACTIVIDAD "+
													" WHERE RA.IdServDepartUnid = "+s_unidad+" ";

												rset4 = stmt4.executeQuery(COMANDO4);

												while(rset4.next()){

													cad = rset.getString(rset4.getString("ABREVIATURA"));

												if(!cad.equals("  ")) {	
													num=Integer.parseInt(cad);
													totalv=totalv+num;
												}else{
													num=0;
												}

												if(!cad.equals("  ") ) {
													num=Integer.parseInt(cad);
													total=total+num;
												}else{
													num=0;
												}
												
								%>
												<tr>
													<td align="center" >
														<div align="center" style="width: 23px; height: 18px; ">	
															<b><%=rset.getString(rset4.getString("ABREVIATURA"))%></b>
														</div>
													</td>
												</tr>
								<%	// CE
									}
								%>
													<tr>
														<td align="center" >
															<div align="center" style="width: 23px; height: 18px; ">	
																<b><%=totalv%></b>
															</div>
														</td>
													</tr>
												</table>

												</td>
								<%
											 }

											 
								%>
											<td>
												<div align="middle" style="width: 23px; height: 18px; ">
													<b><%=total%> <br/>
								<%				
													if(cant_prog>total){
								%> 					
														<font size="2" color="#0000FF"> Faltan <br/>asignar <br/> <%=cant_prog-total%> Horas <br/></font></b>
								<%				
													}else if(total>cant_prog){
								%> 	
														<font size="2" color="#ff0000"> Sobrepaso <br/>las horas <br/>programadas<br/> por <%=total-cant_prog%></font></b>
								<%				
													}
								%> 
												</div>
											</td>

								<%
									} //out.print(estado);
								%>
					</tbody>
				</table>
			</div>
				<table class="table table-bordered" border="2" align="center">
					<tr>
						<td>
								<div align="center" >
<%
						if("2.0".equals(estado) || "3.0".equals(estado) || "4.0".equals(estado))
						{
							
							COMANDO = "select top 1 ltrim(rtrim(DNI)) AS DNI from [BDPERSONAL].[dbo].[FIRMA_JEFE_SERV] WHERE ID_SERV = '"+s_unidad+"' AND INICIO < '15-"+s_mes+"-"+s_anio+"' AND FIN > '15-"+s_mes+"-"+s_anio+"'";
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
						if("2.0".equals(estado) || "3.0".equals(estado) || "4.0".equals(estado))
						{
							COMANDO = "select top 1 ltrim(rtrim(DNI)) AS DNI from [BDPERSONAL].[dbo].[FIRMA_JEFE_DEP] WHERE ID_DEPART = (SELECT IdDepartUnid FROM ServicioDepartUnidad WHERE IdServDepartUnid ='"+s_unidad+"') AND INICIO < '15-"+s_mes+"-"+s_anio+"' AND FIN > '15-"+s_mes+"-"+s_anio+"'";
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
						if("3.0".equals(estado)  || "4.0".equals(estado))
						{
							COMANDO = "select top 1 ltrim(rtrim(DNI)) AS DNI from [BDPERSONAL].[dbo].[FIRMA_JEFE_DEP] WHERE ID_DEPART = 7 AND INICIO < '15-"+s_mes+"-"+s_anio+"' AND FIN > '15-"+s_mes+"-"+s_anio+"'";
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
						if("4.0".equals(estado))
						{
							COMANDO = "select top 1 ltrim(rtrim(DNI)) AS DNI from [BDPERSONAL].[dbo].[FIRMA_JEFE_DEP] WHERE ID_DEPART = 2 AND INICIO < '15-"+s_mes+"-"+s_anio+"' AND FIN > '15-"+s_mes+"-"+s_anio+"'";
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
		</div>
		<!-- / Primary table -->
	</div>
</div>