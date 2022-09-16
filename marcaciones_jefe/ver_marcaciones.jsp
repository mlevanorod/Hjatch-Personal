<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ include file="../conectadb2.jsp" %>
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
				" WHERE	 DNI_RELOG = '"+s_codigo+"' ";
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
						<th colspan="15">
							<div align="center" class="table-header">
							<div align="center" class="table-caption">
							</div>
							<div align="center" class="table-caption">
							</div>

                            
							<div align="center" class="table-caption">
							</div>
                            
								<div class="table-caption">
									<%=mes%> - <%=s_anio%>
								</div>
							<div align="center" class="table-caption">
							</div>
							<div align="center" class="table-caption">
							</div>
							<div align="center" class="table-caption">
							</div>
							<div align="center" class="table-caption">
							</div>

							<div align="center" class="table-caption">
							</div>
							<div align="center" class="table-caption">
							</div>
							<div align="center" class="table-caption">
							</div>

                                
							</div>
						</th>						
					</tr>
					<tr>

						<th>
							<div align="center" class="table-caption">
								FECHA
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
							</div>
						</th>
						<th>
							<div align="center" class="table-caption">
							</div>
						</th>
                        
						<th>
							<div align="center" class="table-caption">
							</div>
						</th>
                        
						<th>
							<div align="center" class="table-caption">
								|
							</div>
						</th>

						<th>
							<div align="center" class="table-caption">
							</div>
						</th>

						<th>
							<div align="center" class="table-caption">
							</div>
						</th>

						<th>
							<div align="center" class="table-caption">
							</div>
						</th>


                       	<th>
							<div align="center" class="table-caption">
								HORA
							</div>
						</th>
                        
					</tr>
				</thead>
				<tbody>
       
                
		
<%
                  COMANDO = "select convert(varchar(10), Fecha,101) fecha,   hora from RELOGDIGI where Codigo = '" +s_codigo+"'" + "and year(fecha) = '" +s_anio+ "and MONTH(fecha) = '" +s_mes+ "'" + "order by Fecha asc";

					//out.print(COMANDO);
					rset = stmt.executeQuery(COMANDO);
%>		


              
                 <tr>
                   <td>		<div align="center" class="table-caption">
								<font color="<%=rset.getString("fecha")%>" </font>  
							</div>
                    </td>
                    <td> 	<div align="center" class="table-caption">
								<font color="<%=rset.getString("hora")%>" </font> 
							</div>
                    
                    </td>
                 </tr>
               </table>
               


			
		</div>

 
</div>
