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
						<tr>
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
			//	  order by b.INDICADOR desc, A.SITUACION, a.NOMBRE  "

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
									 <%

		COMANDO4 = 	"SELECT NOMBRE FROM ACTIVIDADES AC INNER JOIN REL_ACTIVIDADES RA ON AC.ID_ACTIVIDAD = RA.ID_ACTIVIDAD"+
					" WHERE RA.IdServDepartUnid = '"+s_unidad+"'";
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
<%	// CE
			COMANDO = " EXEC SP_GET_ASISTENCIA_MAESTRO_12 '"+rset2.getString("CODIGO")+"', '"+s_mes+"', '"+s_anio+"' ";
	//out.print(COMANDO);
				rset = stmt.executeQuery(COMANDO);

			while(rset.next())
			 {	d++;
%>
							<td>
								<table border="1">
									<%

		COMANDO4 = 	"SELECT ABREVIATURA FROM ACTIVIDADES AC INNER JOIN REL_ACTIVIDADES RA ON AC.ID_ACTIVIDAD = RA.ID_ACTIVIDAD"+
					" WHERE RA.IdServDepartUnid = '"+s_unidad+"'";
				rset4 = stmt4.executeQuery(COMANDO4);
				while(rset4.next()){
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
			</div>
				<table class="table table-bordered" border="2" align="center">
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
		</div>
		<!-- / Primary table -->
	</div>
</div>