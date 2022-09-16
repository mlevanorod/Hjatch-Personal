<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb2.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%	
	String s_anio		= request.getParameter("f_anio");	
	String s_mes		= request.getParameter("f_mes");
	String s_nomb		= request.getParameter("f_nomb");
	String s_unidad		= request.getParameter("f_unidad");
	String s_actividad	= request.getParameter("f_actividad");
	String id_personal	= request.getParameter("f_id_personal");
	String s_codigo		= "";
	String estado 		= "";
	String nom_unidad	= "";
	String nom_actividad = "---";
	String anio 		= new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
	String s_total 		= "";
	String cant_dd		= "";
	String mes 			= "";
	String color 		= "";
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

	COMANDO = "  SELECT		UPPER(NOMBRE) AS NOMBRE "+
				"  FROM		ServicioDepartUnidad "+
				" WHERE		idservdepartunid = '"+s_unidad+"' ";

		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
		nom_unidad = rset.getString("NOMBRE");
	}


	COMANDO = "SELECT	NOMBRE "+
				"  FROM	ACTIVIDADES "+
				" WHERE	ACTIVO = 1 "+
				"   and	ID_ACTIVIDAD = "+s_actividad+" ";
		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
		nom_actividad = rset.getString("NOMBRE");
	}

%>
<div class="row">
	<div >
		<!-- Primary table -->
		<div class="table-primary">
			<div style="overflow-y:auto">
				<table class="table table-bordered" border="2" style="white-space:nowrap">
					<thead>
						<tr>
							<th colspan="35">
								<div align="center" >	
									<font size="4"><%=nom_unidad%> - <%=nom_actividad%></font> 
									 <br>
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
						
						</tr>
					</thead>
					<tbody>
						<tr>
<%

	COMANDO2 = 	" EXEC SP_GET_ASISTENCIA_MAESTRO_8 "+s_unidad+", '"+s_mes+"', '"+s_anio+"', "+s_actividad+" ";
				//out.print(COMANDO2);

		rset2 = stmt2.executeQuery(COMANDO2);
	while(rset2.next())
	{ i++; d=0;
			estado = "4";
			s_codigo = rset2.getString("CODIGO");
%>
						<tr>
							<td>								
								<div align="center" >
									<b><%=i%></b>
								</div>
							</td>
							<td nowrap>
								<div align="left" >

									<b><%=rset2.getString("NOMBRE")%></b>

								</div>
							</td>
							<td>
								<div align="center" >
									<b><%=rset2.getString("SITUACION")%></b>
								</div>
							</td>
<%	// CE
			COMANDO = 	" EXEC SP_GET_ASISTENCIA_MAESTRO_6 '"+s_codigo+"', '"+s_mes+"', '"+s_anio+"', "+s_actividad+" ";
					//out.print(COMANDO);
				rset = stmt.executeQuery(COMANDO);

			while(rset.next())
			 {	
			 		d++;
			 		COMANDO3 = "select case [BDPERSONAL].dbo.FN_COLOR_ACTIVIDAD ('"+s_codigo+"', "+d+", "+xmes+", '"+s_anio+"') when 'blue' then 'blue' else 'red' end color_selec ";
			 			//out.print(COMANDO3);
			 			rset3	=	stmt3.executeQuery(COMANDO3);
			 			rset3.next();
			 			color = rset3.getString("color_selec");
%>
							<td >
								<div align="center" >


											<font COLOR=<%=color%>>
												<b><%=rset.getString("ACTIV")%></b>
											<font>	

								</div>
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