<%@ include file="../conectadb.jsp" %>

	<div class="panel-body">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>#</th>
					<th>Cargo</th>
					<th>Nombrado</th>
					<th>Dest. a Otra</th>
					<th>Dest. de Otra</th>
					<th>Cas</th>
					<th>Interno</th>
					<th>Tercero</th>
					<th>Residente</th>
					
				</tr>
			</thead>
			<tbody>
<%
	String 	s_unidad 	=		request.getParameter("f_unidad");
	//out.print(s_unidad);
	int count = 1;

	COMANDO = "SELECT		B.COD_SERVICIO, "+
				"			B.Nombre AS NOM_SERVICIO, "+
				"			ISNULL(B.[01],0) AS '01', "+
				"			ISNULL(B.[02],0) AS '02', "+
				"			ISNULL(B.[03],0) AS '03', "+
				"			ISNULL(B.[06],0) AS '06', "+
				"			ISNULL(B.[13],0) AS '13', "+
				"			ISNULL(B.[20],0) AS '20', "+
				"			ISNULL(B.[21],0) AS '21' "+
				"  FROM		( "+
				"			SELECT		C.ID_CARGO AS COD_SERVICIO, "+
				"						T.CODIGO AS COD_TIPO, "+
				"						C.Nombre, "+
				"						ISNULL(COUNT(T.CODIGO),0) AS CANT_TIPO "+
				"			  FROM		MAESTRO M "+
				"			  JOIN		CARGO C "+
				"			    ON		M.ID_CARGO = C.ID_CARGO "+
				"			  JOIN		T_TipoSituacion T "+
				"			    ON		M.SITUACION = T.CODIGO "+
				"			 WHERE		C.ESTADO = 1 ";
					if(!s_unidad.equals("999"))
					{
				 COMANDO +=	"  AND		C.ID_CARGO = "+s_unidad+" ";
					}
					
				 COMANDO += "GROUP BY	C.ID_CARGO, "+
				"						T.CODIGO, "+
				"						C.Nombre "+
				"			) A "+
				"	PIVOT ( SUM( CANT_TIPO ) FOR COD_TIPO IN ([01],[02],[03],[06],[13],[20],[21]) ) B ";
			//out.print(COMANDO);
	rset = stmt.executeQuery(COMANDO);
	while(rset.next())
	{
%>
				<tr>
					<td>
						<%=count++%>
					</td>
					<td>
						<%=rset.getString("NOM_SERVICIO")%>
					</td>
					<td>						
						<%=rset.getString("01")%>						
					</td>
					<td>
						<%=rset.getString("02")%>
					</td>
					<td>
						<%=rset.getString("03")%>
					</td>
					<td>
						<%=rset.getString("06")%>
					</td>
					<td>
						<%=rset.getString("13")%>
					</td>					
					<td>
						<%=rset.getString("20")%>
					</td>
										<td>
						<%=rset.getString("21")%>
					</td>

				</tr>
	
<%
	}
				if (s_unidad.equals("999")) {
%>
				<tr>
					<td colspan="2"> 
						<div align="center">
							<strong> TOTAL </strong>
						</div>  
					</td>
<%
					COMANDO = "		SELECT		T.CODIGO AS COD_TIPO, "+
							"					COUNT(T.CODIGO) AS CANT_TIPO "+
							"		  FROM		MAESTRO M "+
							"		  JOIN		CARGO C "+
							"		    ON		M.ID_CARGO = C.ID_CARGO  "+
							"		  JOIN		T_TipoSituacion T "+
							"		    ON		M.SITUACION = T.CODIGO "+
							"		 WHERE		C.ESTADO = 1 "+
							"		 GROUP BY   T.CODIGO ";

					rset = stmt.executeQuery(COMANDO);
					while(rset.next())
					{
%>
					<td>
						<strong> <%=rset.getString("CANT_TIPO")%> </strong> 					
					</td>

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