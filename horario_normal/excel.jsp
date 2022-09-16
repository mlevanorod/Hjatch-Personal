<%@page contentType="application/vnd.ms-excel"%>
<%@ include file="../conectadb2.jsp" %>
<%@ include file="../conectadb.jsp" %>

<%	
	response.setHeader("Content-Disposition","attachment; filename=\"rol_guardia.xls"+"\"");
	String s_anio		= request.getParameter("f_anio");	
	String s_mes		= request.getParameter("f_mes");
	String s_unidad		= request.getParameter("f_unidad");
	String anio 		= new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
	String s_total 		= "";
	String cant_dd		= "";
	String mes 			= "";
	int i = 0;
	int d = 0;
	
%>
<div class="row">
	<div class="col-md-10 col-md-offset-1">
		<!-- Primary table -->
		<div class="table-primary">
				<table class="table table-bordered" border="2">
					<thead>
						<tr>
							<th colspan="34">
								<div align="center" >	
									ROL DE GUARDIAS <br>
									<%=s_mes%> - <%=s_anio%>
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
				for(int y=1; y<=31; y++ )
				{
%>				
							<th >
								<div align="center" >	
									<%=y%>
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

	COMANDO2 = 	"SELECT	 "+
				"		A.NOMBRE AS NOMBRE, "+
				"		substring([BDPERSONAL].[DBO].S_LABORAL(A.SITUACION),1,3) as SITUACION, "+
				"		A.codigo as CODIGO "+
				"  FROM	 "+
				"		MAESTRO A "+
				"  JOIN ASISTENCIA B "+
				"    ON A.CODIGO = B.CODIGO "+
				" WHERE	A.CODUNIDADORG = '"+s_unidad+"' "+
				"   AND B.DIA = 1 "+
				"   AND B.MES = '"+s_mes+"' "+
				"   and b.tipo = 'V' "+
				"   AND B."+anio+" = '"+s_anio+"' "+
				"  order by a.codigo ";

				//out.print(COMANDO2);
		rset2 = stmt2.executeQuery(COMANDO2);
	while(rset2.next())
	{ i++; d=0;
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
			COMANDO = " SELECT	"+
						"		CASE B.CODTUR	"+
						"			WHEN 'D' THEN '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'  "+
						"			ELSE B.CODTUR "+
						"		 END CODTUR, "+
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

				rset = stmt.executeQuery(COMANDO);

			while(rset.next())
			 {	d++;
%>
							<td>
								<div align="center" >	
									<%=rset.getString("CODTUR")%>
								</div>
							</td>
<%
			 }

			COMANDO = "  SELECT		SUM(B.HORA) AS SUM_HORA "+
						"  FROM		ASISTENCIA A "+
						"  JOIN		T_Horarios B "+
						"    ON		B.CODHOR = A.CODACT "+
						" WHERE		A."+anio+" = '"+s_anio+"' "+
						"   AND		A.MES = '"+s_mes+"' "+
						"   AND		A.CODIGO = '"+rset2.getString("CODIGO")+"' ";

				rset = stmt.executeQuery(COMANDO);
			if(rset.next())
			{
				cant_dd = rset.getString("SUM_HORA");
			}
				d = (31 - d);
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
<%@ include file= "../cierradb.jsp" %> 