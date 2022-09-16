<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb2.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%	
	String s_anio		= request.getParameter("f_anio");	
	String s_mes		= request.getParameter("f_mes");
	String s_nomb		= request.getParameter("f_nomb");
	String s_unidad		= request.getParameter("f_unidad");
	String nom_unidad	= "";
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

	COMANDO = "  select	a.Nombre as NOMBRE "+
				"  from	dbo.ServicioDepartUnidad a "+
				"  join	dbo.DepartamentoUnidad b "+
				"    on	a.IdDepartUnid = b.IdDepartUnid "+
				" where	IdServDepartUnid = '"+s_unidad+"' ";
		//out.print(COMANDO);
		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
		nom_unidad = rset.getString("NOMBRE");
	}

%>
<div class="row">
	<div >
		<!-- Primary table -->
		<div class="table-primary">
			<div style="overflow-y:auto">
				<table class="table table-bordered" border="2" style="white-space:nowrap">
					<thead>


<%

	COMANDO2 = 	"SELECT	 "+
				"		A.NOMBRE AS NOMBRE, "+
				"		substring([BDPERSONAL].[DBO].S_LABORAL(B.SITUACION),1,3) as SITUACION, "+
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
				"  JOIN ASISTENCIA_DEVOLUCION B "+
				"    ON A.CODIGO = B.CODIGO "+
				" WHERE	B.idservdepartunid = '"+s_unidad+"' "+
				"   AND B.DIA = 1 "+
				"   AND B.MES = '"+s_mes+"' "+
				"   AND B."+anio+" = '"+s_anio+"' "+
				//"   AND B.INDICADOR = 4 "+
				//"	AND B.MIN_ADIC = '1'	"+
				"   AND A.CODHORA IN ('R','M3','T3','M4','M1') "+
				"  order by b.INDICADOR desc, A.SITUACION, a.NOMBRE ";
				//out.print(COMANDO2);

	//COMANDO2 = 	" EXEC SP_GET_ASISTENCIA_MAESTRO_1 "+s_unidad+", '"+s_mes+"', '"+s_anio+"' ";

		rset2 = stmt2.executeQuery(COMANDO2);
	while(rset2.next())
	{ i++; d=0;
			estado = rset2.getString("INDICADOR");
			if(i==1){
%>
						<tr>
							<th colspan="35">
								<div align="center" >	
									<font size="4"><%=nom_unidad%></font> <br>
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
									COND
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
							<th>
								<div align="center" >	
									HORAS
								</div>								
							</th>						
						</tr>
					</thead>
					<tbody>
						<tr>

<%
					}
%>
						<tr>
							<td>								
								<div align="center" >
									<b><%=i%></b>
								</div>
							</td>
							<td nowrap>
								<div align="left" >
								<!--
									<a href="#" title="Editar Personal" name="<%=rset2.getString("CODIGO")%>" id="<%=rset2.getString("MOSTRAR")%>" data-toggle="modal" data-target="#myModal" >
								-->								
									<b><%=rset2.getString("NOMBRE")%></b>
								<!--
									</a>
								-->
								</div>
							</td>
							<td>
								<div align="center" >
									<b><%=rset2.getString("SITUACION")%></b>
								</div>
							</td>
<%	// CE
			COMANDO = 	" EXEC SP_GET_ASISTENCIA_MAESTRO_23 '"+rset2.getString("CODIGO")+"', '"+s_mes+"', '"+s_anio+"' ";
					//out.print(COMANDO);
				rset = stmt.executeQuery(COMANDO);

			while(rset.next())
			 {	d++;
%>
							<td bgcolor="<%=rset.getString("color")%>">
								<div align="center" >	
									<b><%=rset.getString("CODTUR")%></b>
								</div>
							</td>
<%
			 }

			COMANDO = "  SELECT		CAST((SUM(B.HORA)) AS int) AS SUM_HORA "+
						"  FROM		ASISTENCIA_DEVOLUCION A "+
						"  JOIN		T_Horarios B "+
						"    ON		B.CODHOR = A.CODACT "+
						" WHERE		A."+anio+" = '"+s_anio+"' "+
						"   AND		A.MES = '"+s_mes+"' "+
						//"   AND 	A.INDICADOR = 4 "+
						"	AND 	A.MIN_ADIC = '1'	"+
						"   AND		A.CODIGO = '"+rset2.getString("CODIGO")+"' ";

				rset = stmt.executeQuery(COMANDO);
			if(rset.next())
			{
				cant_dd = rset.getString("SUM_HORA");
			}
				d = (umes - d);
				for(int t=1; t<=d; t++)
				{
%>
							<td>
								<div align="center" >	
									&nbsp;
								</div>								
							</td>					
<%	
				}
%>
							<td>
								<div align="center" >	
									<b><%=rset.getString("SUM_HORA")%></b>
								</div>								
							</td>
    					</tr>

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
						if("3.0".equals(estado) || "3.0".equals(estado) || "4.0".equals(estado))
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
						if("3.0".equals(estado) || "3.0".equals(estado) || "4.0".equals(estado))
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