<%@ include file="../conectadb.jsp" %>

<%
	String s_turno = request.getParameter("f_turno");
	String s_tipo  = request.getParameter("f_tipo");
	String s_fecha = request.getParameter("f_fecha");
	int count = 0;
%>
    <script>

		function myFunction(cant) {
		  var x = document.getElementById("f_cantidad_"+cant).value;
		  var y = document.getElementById("f_precio_"+cant).value;
		  document.getElementById("f_total_"+cant).value = parseFloat(x * y).toFixed(2);
		  document.getElementById("f_total2_"+cant).value = parseFloat(x * y).toFixed(2);
		  //alert(cant);
		} 

        // Setup validation
        $("#addReg").validate({
            ignore: '.ignore, .select2-input',
            focusInvalid: false,
            rules: {

                'f_cantidad_1': {
                    required: true
                }
            },
            messages: {
                'jq-validation-policy': 'You must check it!'
            }
        });

        $('#addReg').on('submit', function () {
            var url = 'addReg.jsp?';
            var partFields = $("#addReg").serialize();


	        $.post( window.location.href= url + partFields
	        	,function(data){
	            
               if(data == 1){

                //alert('TODO BIEN');
				$.growl.warning({ message: "Se guardo, correctamente!" });
				

               }else{

                    alert('Error Vuelva a intentar en 5 minutos!!!');                        
                }	            
	            
	    	});


      	});    



    </script>
<!-- 6. $BORDERED_TABLES ===========================================================================

				Bordered tables
-->
				
				<div class="panel" align="center">
					<div class="panel-body">
						<form class="form-horizontal" id="addReg">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>
										<div align="center">DESCRIPCION</div>
									</th>
									<th>
										<div align="center">CANTIDAD</div>
									</th>
									<th>
										<div align="center">PRECIO UNIT.</div>
									</th>
									<th>
										<div align="center">TOTAL</div>
									</th>
								</tr>
							</thead>
							<tbody>
							
<%
						COMANDO = "	SELECT		RN.ID_REGIMEN AS ID_REGIMEN,  "+
								"				RN.DESCRIPCION AS DESCRIPCION,  "+
								"				RN.PRECIO AS PRECIO, "+
								"				CASE  "+
								"					WHEN (SELECT RD.CANTIDAD  "+
								"					   FROM REGIMEN_DETALLE RD  "+
								"					  WHERE RD.ID_REGIMEN = RN.ID_REGIMEN  "+
								"					    AND RD.FECHA = '"+s_fecha+"'  "+
								"						 ) > 1 THEN 'value' "+
								"					ELSE 'placeholder' "+
								"				 END dato, "+
								"				ISNULL((SELECT RD.CANTIDAD FROM REGIMEN_DETALLE RD WHERE RD.ID_REGIMEN = RN.ID_REGIMEN AND RD.FECHA = '"+s_fecha+"' ),0) AS CANTIDAD, "+
								"				ISNULL((SELECT RD.TOTAL FROM REGIMEN_DETALLE RD WHERE RD.ID_REGIMEN = RN.ID_REGIMEN AND RD.FECHA = '"+s_fecha+"' ),0) AS TOTAL "+
								"	  FROM		REGIMEN_NUTRICIONAL RN "+
								"	 WHERE		RN.TURNO = '"+s_turno+"'  "+
								"	   AND		RN.TIPO = '"+s_tipo+"' "+
								"	   AND		RN.ESTADO = 1 	    "+
								"	 ORDER BY ORDEN	";
							//	out.print(COMANDO);
							rset = stmt.executeQuery(COMANDO);
						while(rset.next())
						{	count++;
%>								
								<tr>
									<td>
										<div align="center"><%=rset.getString("DESCRIPCION")%></div>
										<input type="hidden" id="f_regimen_<%=count%>" name="f_regimen" value="<%=rset.getString("ID_REGIMEN")%>">
									</td>
									<td>
										<div align="center"><input type="number" style="text-align:center;" name="f_cantidad" onkeyup="myFunction(<%=count%>)" id="f_cantidad_<%=count%>" <%=rset.getString("dato")%>="<%=rset.getString("CANTIDAD")%>"></div>
									</td>
									<td >
										<div align="center"><input style="text-align:center;" type="double" id="f_precio_<%=count%>" disabled value="<%=rset.getString("PRECIO")%>"> </div>
									</td>
									<td >
										<div align="center">
											<input align="right" style="text-align:center;" name="f_total" type="hidden" id="f_total_<%=count%>" value="<%=rset.getString("TOTAL")%>">
											<input align="right" style="text-align:center;" name="f_total2" type="doble" disabled id="f_total2_<%=count%>" value="<%=rset.getString("TOTAL")%>"> 
										</div>
									</td>
								</tr>
<%
						}
%>								
								<tr>
									<td colspan="4" align="center">
										<input type="submit" if="f_guardar" value="Guardar">
										<input type="hidden" name="f_turno" id="f_turno" value="<%=s_turno%>">
										<input type="hidden" name="f_tipo" id="f_tipo" value="<%=s_tipo%>">
										<input type="hidden" name="f_fecha" id="f_fecha" value="<%=s_fecha%>">
									</td>
								</tr>
							
							</tbody>
						</table>
						</form>
					</div>
				</div>
				
<!--
		fin
-->
