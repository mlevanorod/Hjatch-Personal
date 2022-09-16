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
				" WHERE		idservdepartunid = "+s_unidad+" "+
				" 	and     activo = 1 ";

		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
		nom_unidad = rset.getString("NOMBRE");
	}

	//out.print(s_nomb);

%>
<div class="row">
	<div  align="center" class="print">
		<div class="wrapper1">
    		<div class="div1">
    		</div>
		</div>

	<div class="wrapper2">
		<!-- Primary table -->
		<div class="table-primary div2" >
				<table class="table table-bordered" border="2" style="white-space:nowrap">
					<thead>
						<tr>
							<th colspan="35">
								<div align="center" >	
									<font size="8"> <%=nom_unidad%> </font> <br>
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
%>				
						</tr>
					</thead>
					<tbody>
						<tr>
<%
	COMANDO2 = 	" EXEC SP_GET_ASISTENCIA_MAESTRO_LOCADOR "+s_unidad+", '"+s_mes+"', '"+s_anio+"' ";
	//out.print(COMANDO2);
	rset2 = stmt2.executeQuery(COMANDO2);
	while(rset2.next())
	{ i++; d=0;
			estado = rset2.getString("INDICADOR");
%>
						<tr>
							<td>								
								<div align="center" >
									<b><%=i%></b>
								</div>
							</td>
							<td nowrap width="240">
								<div align="left">
									<b><%=rset2.getString("NOMBRE")%></b>
								</div>
							</td>
							<td align="center">
							<table border="1" align="center">
 <%

		COMANDO4 = 	"SELECT NOMBRE FROM ACTIVIDADES AC INNER JOIN REL_ACTIVIDADES RA ON AC.ID_ACTIVIDAD = RA.ID_ACTIVIDAD"+
					" WHERE RA.IdServDepartUnid = "+s_unidad+"  AND AC.ACTIVO = 1  ";
				rset4 = stmt4.executeQuery(COMANDO4);
				while(rset4.next()){
%>
									<tr>
										<td colspan="2"><%=rset4.getString("NOMBRE")%></td>
									</tr>
<%	// CE
	}
%>
								</table>

	
			</td>
<%	
		COMANDO5 = " EXEC SP_GET_ASISTENCIA_MAESTRO_NEW '"+rset2.getString("CODIGO")+"', '"+s_mes+"', '"+s_anio+"' ";
					//out.print(COMANDO5);
				rset5 = stmt5.executeQuery(COMANDO5);
			while(rset5.next())
			 {	
			 d++;
%>
							<td bgcolor="<%=rset5.getString("color")%>">
							<table border="1">
<%

		COMANDO4 = 	" SELECT ABREVIATURA FROM ACTIVIDADES AC INNER JOIN REL_ACTIVIDADES RA ON AC.ID_ACTIVIDAD = RA.ID_ACTIVIDAD"+
					" WHERE RA.IdServDepartUnid = "+s_unidad+"   AND AC.ACTIVO = 1  ";
				rset4 = stmt4.executeQuery(COMANDO4);
				while(rset4.next()){
%>
				<tr>
					<td align="center" >
						<div align="center" style="width: 23px; height: 18px; ">	
							<b><%=rset5.getString(rset4.getString("ABREVIATURA"))%></b>
						</div>
					</td>
				</tr>
<%	// CE
	}
%>
			</table>
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

		</div>
		<!-- / Primary table -->
	</div>
	</div>
</div>