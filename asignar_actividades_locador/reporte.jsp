<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb2.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%	
	String s_anio		= request.getParameter("f_anio");	
	String s_mes		= request.getParameter("f_mes");
	String s_nomb		= request.getParameter("f_nomb");
	String s_unidad		= request.getParameter("f_unidad");
	String id_personal	= request.getParameter("f_id_personal");
	String s_codigo		= "";
	String estado 		= "";
	String nom_unidad	= "";
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


%>

<div class="row">
	<div class="wrapper1">
    	<div class="div1">
    	</div>
	</div>

	<div class="wrapper2">
		<!-- Primary table -->
		<div class="table-primary div2">
				<table class="table table-bordered" border="2">
					<thead>
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

	COMANDO2 = 	" EXEC SP_GET_ASISTENCIA_MAESTRO_13_LOCADOR "+s_unidad+", '"+s_mes+"', '"+s_anio+"' ";
				//out.print(COMANDO2);

		rset2 = stmt2.executeQuery(COMANDO2);
	while(rset2.next())
	{ i++; d=0;
			estado = rset2.getString("INDICADOR");
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
								<!--
									<a href="#" title="Editar Personal" name="<%=rset2.getString("CODIGO")%>" id="<%=rset2.getString("MOSTRAR")%>" data-toggle="modal" data-target="#myModal" > -->
									<b><%=rset2.getString("NOMBRE")%></b>
								<!-- </a> -->
								</div>
							</td>
							<td>
								<div align="center" >
									<b><%=rset2.getString("SITUACION")%></b>
								</div>
							</td>
<%	// CE
			COMANDO = 	" EXEC SP_GET_ASISTENCIA_MAESTRO_14 '"+s_codigo+"', '"+s_mes+"', '"+s_anio+"' ";
				
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
							<td bgcolor="<%=rset.getString("color")%>">
								<div align="center" >
										<a href="#" title="Asignar Actividades" name="<%=rset.getString("COD")%>" id="asignar_actividadd" onclick="asignar_actividad(<%=d%>, '<%=s_codigo%>')" data-toggle="modal" data-target="#modal-sizes-2" >
											<font COLOR=<%=color%>>
												<b><%=rset.getString("CODTUR")%></b>
											<font>	
										</a>
								</div>
							</td>
<%
				
			 }

			COMANDO = "  SELECT		CAST((SUM(B.HORA)) AS int) AS SUM_HORA "+
						"  FROM		ASISTENCIA A "+
						"  JOIN		T_Horarios B "+
						"    ON		B.CODHOR = A.CODACT "+
						" WHERE		A."+anio+" = '"+s_anio+"' "+
						"   AND		A.MES = '"+s_mes+"' "+
						"   AND		A.CODIGO = '"+s_codigo+"' ";

			//COMANDO = 	" EXEC SP_GET_ASISTENCIA_MAESTRO_2 '"+s_codigo+"', '"+s_mes+"', '"+s_anio+"' ";			
					//out.print(COMANDO);
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
		<!-- / Primary table -->
	</div>
</div>
