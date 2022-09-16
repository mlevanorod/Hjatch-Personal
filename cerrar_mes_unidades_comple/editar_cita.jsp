<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb2.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>

<%
	String 	s_codigo 	=	request.getParameter("f_codigo");
	String  s_anio		=	request.getParameter("f_anio");
	String  s_mes		=	request.getParameter("f_mes");
	String  mes 		=	"";
	int 	e 			=   0;
	int     cont        =	0;
	double  cant 		=	0.00;
	String  cant_dm     =	"";
	String  cant_dd		=	"";
	String  dni 		=	"";
	String  nombre 		=	"";
	String  unidad 		=	"";
	String  s_unidad	=	"";
	String  cargo 		=	"";
	String  cod 		=	"";
	String  situacion 	=	"";
	String  tipo 		=	"";
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
				"		DBO.COD_UNIDAD(CODUNIDADORG) AS UNIDAD_ORGANICA, "+
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
			unidad 			= rset.getString("UNIDAD_ORGANICA");
			cargo 			= rset.getString("CARGO_FUNCIONAL");
			situacion 		= rset.getString("SITUACION_LABORAL");
			s_unidad		= rset.getString("CODUNIDADORG");
		}	

	COMANDO3 = " SELECT 	MES, NOMBRE "+
				" FROM 	MES "+
				" WHERE	MES = '"+s_mes+"' ";

		rset3 = stmt3.executeQuery(COMANDO3);
		if(rset3.next())
		{
			mes = rset3.getString("nombre");
		}

	COMANDO = "  SELECT		COUNT(1) AS CANT_DM "+
				"  FROM		ASISTENCIA "+
				" WHERE		"+anio+" = '"+s_anio+"' "+
				"   AND		CODACT = 'DM' "+
				//"   AND     MES < '"+s_mes+"' "+
				"   AND 	CODIGO = '"+s_codigo+"' ";
			//out.print(COMANDO);
		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
		cant_dm = rset.getString("CANT_DM");
	}

	COMANDO = "  SELECT		SUM(B.HORA) AS SUM_HORA "+
				"  FROM		ASISTENCIA A "+
				"  JOIN		T_Horarios B "+
				"    ON		B.CODHOR = A.CODACT "+
				" WHERE		A."+anio+" = '"+s_anio+"' "+
				"   AND		A.MES = '"+s_mes+"' "+
				"   AND		A.CODIGO = '"+s_codigo+"' ";

		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
		cant_dd = rset.getString("SUM_HORA");
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

        <div align="left" class="form-group">
        	<div class="input-group">
                <span class="input-group-addon">Cant. Des. Med:</span>
	    		<input type="text" disabled class="form-control" value ="<%=cant_dm%> dias">    	
        	</div>
        </div>

		<div class="table-primary">
			<div align="center" class="table-header">
				<div class="table-caption">
					<%=mes%> - <%=s_anio%>
				</div>
				<div class="table-caption">
					CANT. HORAS : <font size="4" color="#0000FF"> <input type="text" size="5" value="&nbsp;<%=cant_dd%>&nbsp;" /> </font>
				</div>
			</div>
			<table >
				<thead>

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
							"		CODACT, "+
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
							"		CONVERT(VARCHAR(5), HORAI,108) as HORAI, "+
							"		CONVERT(VARCHAR(5), HORAS,108) as HORAS, "+
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
								<select  class="input-sm form-control" style="color:navy;  background:white; fxont-weight:bold" id="dia_<%=e%>" onchange="myFunction(<%=e%>)" name="dia_<%=e%>">
                    <%
                                COMANDO2 = "select  CODHOR, "+
                                            "       CASE	CODHOR "+
                                            "           	WHEN '"+cod+"' THEN 'selected' "+
                                            "        		ELSE ' '  "+
                                            "        END 	SEL_CODHOR,	 "+
                                            "       CASE	CODHOR "+
                                            "           	WHEN '"+cod+"' THEN HORA "+
                                            "        		ELSE '0'  "+
                                            "        END 	cant,	 "+
                                            "       CODTUR "+
                                            " FROM	T_HORARIOS ";
                                if("20".equals(situacion) || "06".equals(situacion))
                                {
                                	COMANDO2 += " WHERE TIPO_HORA IN ('T','V') AND TIPO_HORA <> 'N' ";
                            	}else{

                            		COMANDO2 += " WHERE TIPO_HORA IN ('N','V') AND TIPO_HORA <> 'T' ";

                            	}
                                	COMANDO2 += "order by CODHOR asc ";
                                 //out.print(COMANDO2);
                               rset2 = stmt2.executeQuery(COMANDO2);
                                while(rset2.next())
                                {
                                	cant = rset2.getDouble("cant");
                    %>
                    				
                                    <option <%=rset2.getString("SEL_CODHOR")%> value="<%=rset2.getString("CODHOR")%>">	<font  color="<%=rset.getString("CODACT_COLOR")%>" size=1>
                                    		<%=rset2.getString("CODHOR")%>
                                      </font>

                                    </option>
                    <%          }
                    %>
                                </select>

								<font size=1><%=rset.getString("HORAI")%> - <%=rset.getString("HORAS")%></font>
							</div>
						</td>
<%
					}else{
%>
						<td>
							<div align="center" class="table-caption">
								<font color="<%=rset.getString("CODACT_COLOR")%>" size=1><b><%=e%></b></font> <br>

								<select class="input-sm form-control" style="color:navy;  background:white; fxont-weight:bold" id="dia_<%=e%>" onchange="myFunction(<%=e%>)" name="dia_<%=e%>" >
                    <%
                                COMANDO2 = "select  CODHOR, "+
                                            "       CASE	CODHOR "+
                                            "           	WHEN '"+cod+"' THEN 'selected' "+
                                            "        		ELSE ' '  "+
                                            "        END 	SEL_CODHOR,	 "+
                                            "       CASE	CODHOR "+
                                            "           	WHEN '"+cod+"' THEN HORA "+
                                            "        		ELSE '0'  "+
                                            "        END 	cant,	 "+
                                            "       CODTUR "+
                                            " FROM	T_HORARIOS ";
                                if("20".equals(situacion) || "06".equals(situacion))
                                {
                                	COMANDO2 += " WHERE TIPO_HORA IN ('T','V') AND TIPO_HORA <> 'N' ";
                            	}else{

                            		COMANDO2 += " WHERE TIPO_HORA IN ('N','V') AND TIPO_HORA <> 'T' ";

                            	}
                                	COMANDO2 += "order by CODHOR asc ";
                                //  out.print(COMANDO);
                                rset2 = stmt2.executeQuery(COMANDO2);
                               while(rset2.next())
                                {
									cant = rset2.getDouble("cant");
                    %>
                    				
                                    <option <%=rset2.getString("SEL_CODHOR")%> value="<%=rset2.getString("CODHOR")%>">	<font  color="<%=rset.getString("CODACT_COLOR")%>" size=0.5>
                                    		<%=rset2.getString("CODHOR")%>
                                      </font>
                                    </option>
                    <%          }
                    %>
                                </select>
                                
								<font color="<%=rset.getString("CODACT_COLOR")%>" size=1><%=rset.getString("HORAI")%> - <%=rset.getString("HORAS")%></font>
								
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

        <div align="left"  class="form-group">
                <div align="center" class="modal-header">

                    <button type="button" id="enviar_upd" class="btn btn-primary" >Guardar</button>&nbsp;&nbsp;
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    
                </div>
        </div>
                	<input type="hidden" name="f_cantw" id="f_cantw" value="<%=e%>">
                    <input type="hidden" id="f_codigow" name="f_codigow" value="<%=s_codigo%>">
                    <input type="hidden" id="f_aniow" name="f_aniow" value="<%=s_anio%>"> 
                    <input type="hidden" id="f_mesw" name="f_mesw" value="<%=s_mes%>"> 
                    <input type="hidden" id="f_unidadw" name="f_unidadw" value="<%=s_unidad%>">
                    <input type="hidden" id="f_situacion" name="f_situacion" value="<%=situacion%>">
    </form>
</div>
