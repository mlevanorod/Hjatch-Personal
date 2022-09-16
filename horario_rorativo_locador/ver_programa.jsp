<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>

<%
	String 	s_codigo 	=	request.getParameter("f_codigo");
	String  s_anio		=	request.getParameter("f_anio");
	String  s_mes		=	request.getParameter("f_mes");
	String  s_codunid	=	request.getParameter("f_codunid");
	String  mes 		=	"";
	int 	e 			=   0;
	int     cont        =	0;
	double  cant 		=	0.00;
	String  dni 		=	"";
	String  nombre 		=	"";
	String  unidad 		=	"";
	String  cargo 		=	"";
	String  cod 		=	"";
	String  situacion 	=	"";
	String  tipo 		=	"";
	int 	min 		=	0;
	String  diasSemana[] = new String[17]; 
	String  anio   = new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
        	
        	diasSemana[1] = "Lunes";
        	diasSemana[2] = "Martes";
        	diasSemana[3] = "Mi&eacute;rcoles";
        	diasSemana[4] = "Jueves";
        	diasSemana[5] = "Viernes";
        	diasSemana[6] = "S&aacute;bado";
        	diasSemana[7] = "Domingo";

	//out.print(s_id_cita);
	
	COMANDO = "SELECT	DNI_ACTUAL AS DNI, "+
				"		NOMBRE, "+
				//"		DBO.FN_SERVICIO("+s_codunid+") AS UNIDAD_ORGANICA, "+
				"		CODUNIDADORG,	"+
				"		DATENAME(month, getdate() ) as mes, "+
				"		CODFUNCION AS CARGO_FUNCIONAL, "+
				"		SITUACION AS SITUACION_LABORAL "+
				"  FROM	MAESTRO "+
				" WHERE	CODIGO = '"+s_codigo+"' ";
		//out.print(COMANDO);
		rset = stmt.executeQuery(COMANDO);
		if(rset.next())
		{
			dni 			= rset.getString("DNI");
			nombre   	 	= rset.getString("NOMBRE");
			mes 			= rset.getString("mes");
			//unidad 			= rset.getString("UNIDAD_ORGANICA");
			cargo 			= rset.getString("CARGO_FUNCIONAL");
			situacion 		= rset.getString("SITUACION_LABORAL");
		}		

	COMANDO = "  select	b.Nombre as NOMBRE "+
				"  from	dbo.ServicioDepartUnidad a "+
				"  join	dbo.DepartamentoUnidad b "+
				"    on	a.IdDepartUnid = b.IdDepartUnid "+
				" where	IdServDepartUnid = '"+s_codunid+"' ";

		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
		unidad = rset.getString("NOMBRE");
	}

	COMANDO3 = " SELECT 	MES, NOMBRE "+
				" FROM 	MES "+
				" WHERE	MES = '"+s_mes+"' ";

		rset3 = stmt3.executeQuery(COMANDO3);
		if(rset3.next())
		{
			mes = rset3.getString("nombre");
		}

%>

<div id="cont">
    <form name="editar_programacion" id="editar_programacion">

        <div align="left" class="form-group">
        	<div class="input-group">
                <span class="input-group-addon">Trabajador:</span>
	    		<input type="text" disabled class="form-control" value ="<%=nombre%>">
        	</div>
        </div>

        <div align="left" class="form-group">
        	<div class="input-group">
                <span class="input-group-addon">Unidad Organica:</span>
	    		<input type="text" disabled class="form-control" value ="<%=unidad%>">    	
        	</div>
        </div>

		<div class="table-primary">

			<table >
				<thead>
					<tr>
						<th colspan="7">
							<div align="center" class="table-header">
								<div class="table-caption">
									<%=mes%> - <%=s_anio%>
								</div>
							</div>
						</th>						
					</tr>
					<tr>

						<th>
							<div align="center" class="table-caption">
								Lunes
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Martes
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Miercoles
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Jueves
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Viernes
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Sabado
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
								Domingo
							</div>
						</th>

					</tr>
				</thead>
				<tbody>
					<tr>
<%

				COMANDO = "SELECT "+
							"		CASE MIN_ADIC "+
							"				WHEN '0' THEN CODACT  "+
							"				ELSE '&nbsp; C &nbsp;' "+
							"		 END CODACT, "+
							"		MIN_ADIC, "+
							"		CASE CODACT "+
							"			WHEN 'D' THEN '#FF0000' "+
							"			ELSE '#0000FF' "+
							"	     END CODACT_COLOR, "+ 
							"		right( '00' + cast( DIA AS varchar(2)), 2 ) as DIA, "+
							"		MES, "+
							"		"+anio+", "+
							"		right( '00' + cast( DIA AS varchar(2)), 2 ) + '/' + CONVERT(varchar(2), MES) + '/' +  CONVERT(varchar(4), "+anio+") AS DAN, "+
							"		DATENAME(weekday, (right( '00' + cast( DIA AS varchar(2)), 2 ) + '/' + CONVERT(varchar(2), MES) + '/' +  CONVERT(varchar(4), "+anio+"))) as DIASEMANA,"+
							"		DATEPART(dw, (right( '00' + cast( DIA AS varchar(2)), 2 ) + '/' + CONVERT(varchar(2), MES) + '/' +  CONVERT(varchar(4), "+anio+")) ) as NUMSEMANA, "+
							"		CASE MIN_ADIC "+
							"				WHEN '0' THEN CONVERT(VARCHAR(5), HORAI,108)  "+
							"				ELSE '&nbsp;&nbsp;' "+
							"		 END HORAI, "+
							//"		CONVERT(VARCHAR(5), HORAI,108) as HORAI, "+
							"		CASE MIN_ADIC "+
							"				WHEN '0' THEN CONVERT(VARCHAR(5), HORAS,108)  "+
							"				ELSE '&nbsp;&nbsp;' "+
							"		 END HORAS, "+
							//"		CONVERT(VARCHAR(5), HORAS,108) as HORAS, "+
							"		rtrim(TIPO) AS TIPO "+
							"  FROM	ASISTENCIA "+
							" WHERE	CODIGO = '"+s_codigo+"' "+
							"   AND	"+anio+" = '"+s_anio+"' "+
							"   AND	MES	 = '"+s_mes+"' "+
							"  order by dia ";
					//out.print(COMANDO);
					rset = stmt.executeQuery(COMANDO);
				while(rset.next())
				{ e++;
					//out.print(e);
					cont = rset.getInt("NUMSEMANA");
					cod = rset.getString("CODACT");
					tipo = rset.getString("TIPO");
					min  = rset.getInt("MIN_ADIC");
					//out.print(tipo);
					if(e==1)
					{
						for(int i=1; i<cont; i++)
						{						
%>						

						<td>
							<div align="center" class="table-caption">
								&nbsp;
							</div>
						</td>				
<%
							
						}

%>						

						<td>
							<div align="center" class="table-caption">
								<font color="<%=rset.getString("CODACT_COLOR")%>" size=1><b><%=e%></b></font> <br>
								<font color="<%=rset.getString("CODACT_COLOR")%>" size=3><b>
									<input  type="text" size="5" value="&nbsp;&nbsp;&nbsp;&nbsp;<%=rset.getString("CODACT")%>" /> <br>
								</b></font>
								<font size=1><b><%=rset.getString("HORAI")%> - <%=rset.getString("HORAS")%></b></font>&nbsp;&nbsp;
								
							</div>
						</td>
<%
					}else{
%>
						<td>
							<div align="center" class="table-caption">
								<font color="<%=rset.getString("CODACT_COLOR")%>" size=1><b><%=e%></b></font> <br>
								<font color="<%=rset.getString("CODACT_COLOR")%>" size=3><b>
							
									<input  type="text" size="5" value="&nbsp;&nbsp;&nbsp;&nbsp;<%=rset.getString("CODACT")%>" /> <br>

								</b></font>
								<font size=1><b><%=rset.getString("HORAI")%> - <%=rset.getString("HORAS")%></b></font>&nbsp;&nbsp;
								
							</div>
						</td>
<%
					}


					if(cont==7)
					{
%>
					</tr>
					<tr>
<%
					}
				}

%>

					</tr>

				</tbody>
			</table>
		</div>


    </form>
</div>
