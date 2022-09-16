<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>

    <script>
        init.push(function () {

            $('#f_fecha_fin').datepicker({
                dateFormat: "dd/mm/yyyy"

            });

            $('#f_fecha_ini').datepicker({
                dateFormat: "dd/mm/yyyy"

            });         

            $(document).delegate("#enviar_upd","click",function(){
                var id = $('#f_id_licencia').val();
                if ($(this).valid()) {
                    $.post("addlicencia.jsp", $('#editar_programacion').serialize() ,function(data){
                       if(data == 1){
                        
                        window.location.href = 'permiso.jsp?f_mes='+$('#f_mes').val()+'&f_anio='+$('#f_anio').val()+'&f_id='+id;

                       }else{

                            alert('Error Vuelva a intentar en 5 minutos!!!');  

                        }
                    });
                }
            });      

            $(document).delegate("#eliminar_cita","click",function(){
            	var codigo 	= $('#f_id_licencia').val();
            	var id 		= $(this).attr('name');
                $.post("delete_licencia.jsp?f_id_licencia="+id+"&f_codigo="+codigo, function(data){
                   if(data == 1){
                      $.growl.notice({ message: "Licencia eliminada!" });
                      window.location.href = 'permiso.jsp?f_mes='+$('#f_mes').val()+'&f_anio='+$('#f_anio').val()+'&f_id='+codigo;
                   }else {
                        alert('Error Vuelva a ingresar');
                    } 

                });

            });                  

        });


    </script>

<%
	String 	s_codigo 	=	request.getParameter("f_codigo");
	String  s_anio		=	request.getParameter("f_anio");
	String  s_mes		=	"";
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
	String s_fechact 	= 	"";
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
				"		DATENAME(month, getdate() ) as mes, "+
				"		CODFUNCION AS CARGO_FUNCIONAL, "+
				"		SITUACION AS SITUACION_LABORAL, "+
				"		CONVERT(VARCHAR(10), SYSDATETIME(), 103) fechact	"+
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
			s_fechact   		= rset.getString("fechact");
		}	

	COMANDO3 = " SELECT 	MES, NOMBRE "+
				" FROM 	MES "+
				" WHERE	MES = month(GETDATE()) ";

		rset3 = stmt3.executeQuery(COMANDO3);
		if(rset3.next())
		{
			mes = rset3.getString("nombre");
		}

%>

<div class="row">
	<div class="col-md-8 col-md-offset-2">
		<!-- Primary table -->

		<div id="cont">
		    <form name="editar_programacion" id="editar_programacion">

                <div align="center" class="form-group">
		        	<div class="input-group" align="center">
                        <span class="input-group-addon">Anio</span>
                            <input type="text" name="f_anio" class="form-control" disabled id="f_anio" value="<%=s_anio%>">

                    </div>
                </div>

		        <div align="center" class="form-group">
		        	<div class="input-group">
		        		<span class="input-group-addon">
		        			<a href="index.jsp?f_anio=<%=s_anio%>&f_mes=<%=s_mes%>"> << Atras </a>
		        		</span>
		                <span class="input-group-addon">Trabajador:</span>
			    		<input type="text" disabled class="form-control" value ="<%=nombre%>">
		        	</div>
		        </div>

		        <div align="center" class="form-group">
		        	<div class="input-group">
		                <span class="input-group-addon">Unidad Organica:</span>
			    		<input type="text" disabled class="form-control" value ="<%=unidad%>">    	
		        	</div>
		        </div>

		        <div align="center" class="form-group">

		        	<div class="input-daterange input-group" id="bs-datepicker-range">
		                <span class="input-group-addon">Desde:</span>
			    		<input type="text" class="form-control" id="f_fecha_ini" name="f_fecha_ini" placeholder="<%=s_fechact%>" value="<%=s_fechact%>">    	
			    		<span></span>
		                <span class="input-group-addon">Hasta:</span>
			    		<input type="text" class="form-control" id="f_fecha_fin" name="f_fecha_fin" placeholder="<%=s_fechact%>" value="<%=s_fechact%>">    	
		        	</div>        	

		    	
		        </div>     

		        <div align="center" class="form-group">
		        	<div class="input-group">
		                <span class="input-group-addon">Tipo Vacaciones:</span>
			    		<select  class="input-sm form-control" name="f_tipo_licencia" id="f_tipo_licencia">
			    			<option value="1">Cantidad Horas Laborable</option>
	                    	<option value="2">Cantidad Horas Nulas</option>
			    		</select> 	
		        	</div>        	
		        </div>   

		        <div align="center" class="form-group">
		        	<div class="input-group">
		                <span class="input-group-addon">Observacion:</span>
			    		<input type="text" class="form-control" id="f_observacion" name="f_observacion" >    	
		        	</div>        	
		        </div>             

		        <div align="center" class="form-group">
			        <div align="center" class="col-sm-offset-1 col-sm-9">
			        	<input type="hidden" name="f_mes" id="f_mes" value="<%=s_mes%>"> 
			        	<input type="hidden" name="f_anio" id="f_anio" value="<%=s_anio%>">
			          	<input type="hidden" name="f_id_licencia" id="f_id_licencia" value="<%=s_codigo%>">	
			          	<button type="button" id="enviar_upd" class="btn btn-primary" >Guardar</button>&nbsp;&nbsp;
			          	<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>

			        </div>
		        </div>

		        	<div class="table-primary">
		        		<table class="table table-bordered">
		        			<thead>
		        				<tr>
		        					<th>
		        						<div align="center" class="table-caption">
										#
									</div>
		        					</th>
		        					<th>
		        						<div align="center" class="table-caption">
										CODIGO
									</div>
		        					</th>         			
		        					<th>
		        						<div align="center" class="table-caption">
										DESDE
									</div>
		        					</th>			
		        					<th>
		        						<div align="center" class="table-caption">
										HASTA
									</div>
		        					</th>			
		        					<th>
		        						<div align="center" class="table-caption">
										DIAS	
										</div>
		        					</th>
		        					<th>
		        						<div align="center" class="table-caption">
										ESTADO
										</div>
		        					</th>
		        					<th>
		        						<div align="center" class="table-caption">
										REFERENCIA
										</div>
		        					</th>
		        					<th>
		        						<div align="center" class="table-caption">
											Opcion
										</div>
		        					</th>	    					
		        				</tr>
		        			</thead>
		        			<tbody>
		<%	
						COMANDO = "SELECT		* "+
							  		"  FROM		VACACIONES "+
							  		" where		Codigo = '"+s_codigo+"' "+
							  		"   AND		ANO = '"+s_anio+"' ";
						rset = stmt.executeQuery(COMANDO);
						while(rset.next())
						{  e++;
		%>        				
		        				<tr>
		        					<th>
		        						<div align="center" class="table-caption">
											<%=e%>
										</div>
		        					</th>
		        					<th>
		        						<div align="center" class="table-caption">
											<%=rset.getString("codigo")%>
										</div>
		        					</th>    
		        					<th>
		        						<div align="center" class="table-caption">
											<%=rset.getString("desde")%>
										</div>
		        					</th>			
		        					<th>
		        						<div align="center" class="table-caption">
											<%=rset.getString("hasta")%>
										</div>
		        					</th>
		        					<th>
		        						<div align="center" class="table-caption">
											<%=rset.getString("DIAS")%>
										</div>
		        					</th>
		        					<th>
		        						<div align="center" class="table-caption">
											<%=rset.getString("ESTADO")%>
										</div>
		        					</th>
		        					<th>
		        						<div align="center" class="table-caption">
											<%=rset.getString("REFERENCIA")%>
										</div>
		        					</th>		
		        					
		        					<th>
		        						<div align="center" class="table-caption">
											&nbsp;<a href="#" title="Click para Eliminar Licencia" name='<%=rset.getString("id")%>' id="eliminar_cita" data-toggle="modal" data-target="#modal-blurred-bg" >[ <img src="../images/deleted.gif" width="15" height="15"> ] </a>&nbsp;
										</div>
		        					</th>        					
		        				</tr>
		<%				}
		%>        				
		        			</tbody>
		        		</table>
		        	</div>

				<div class="table-primary">

					<table align="center">
						<thead>
							<tr>
								<th colspan="7">
									<div align="center" class="table-header">
										<div class="table-caption">
											<%=s_anio%>
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
			e=0;
						COMANDO = "SELECT "+
									//"		CODACT, "+
									"		CASE 'L' "+
									"			WHEN [dbo].[LICENCIA_DIARIA] ("+anio+",MES,DIA,CODIGO) THEN 'LIC' "+
									"			ELSE CASE MIN_ADIC  "+
									"					WHEN '0' THEN CODACT  "+
									"					ELSE '  C  '  "+
									"				  END "+
									"		 END CODACT,  "+
									"		CASE 'L' "+
									"			WHEN [dbo].[LICENCIA_DIARIA] ("+anio+",MES,DIA,CODIGO) THEN '#c0c0c0' "+
									"			ELSE CASE CODACT  "+
									"					WHEN 'D' THEN '#FF0000' "+
									"					ELSE '#0000FF'  "+
									"				  END "+
									"		 END CODACT_COLOR,  "+ 
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
									"   AND	MES	 = month(getdate()) "+
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

	</div>
</div>
