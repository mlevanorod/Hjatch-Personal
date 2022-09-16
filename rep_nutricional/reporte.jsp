<%@ include file="../conectadb.jsp" %>

<%
	String s_turno 	= request.getParameter("f_turno");
	String s_tipo  	= request.getParameter("f_tipo");	
	String s_anio	= request.getParameter("f_anio");	
	String s_mes	= request.getParameter("f_mes");
	String s_fecha 	= "01/"+s_mes+"/"+s_anio;	
	//out.print(s_fecha);
	int count = 0;
	int dias = 0;

	COMANDO = "SELECT DAY(DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,'"+s_fecha+"')+1,0))) AS DIA";
		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
		dias = rset.getInt("DIA");
	}
%>
    <script>

		function myFunction(cant) {
		  var x = document.getElementById("f_cantidad_"+cant).value;
		  var y = document.getElementById("f_precio_"+cant).value;
		  document.getElementById("f_total_"+cant).value = parseFloat(x * y).toFixed(2);;
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
										<div align="center">TURNO</div>
									</th>
									<th>
										<div align="center">DESCRIPCION</div>
									</th>
<%
									for (int i=1; i<=dias; i++) 
									{									
%>
									<th>
										<div align="center"><%=i%></div>
									</th>
<%
									}
%>
																																										
								</tr>
							</thead>
							<tbody>
							
<%
						COMANDO = "SELECT		ID_REGIMEN, "+
									"			CASE TURNO "+
									"					WHEN 'D' THEN	'DESAYUNO' "+
									"					WHEN 'A' THEN	'ALMUERZO' "+
									"					WHEN 'C' THEN	'CENA' "+
									"					ELSE ' ' "+
									"			 END TURNO2, "+
									"			ORDEN,	"+
									"			NOMB_REGIMEN, "+
									"			ISNULL([1], 0) AS D1, "+
									"			ISNULL([2], 0) AS D2, "+
									"			ISNULL([3], 0) AS D3, "+
									"			ISNULL([4], 0) AS D4, "+
									"			ISNULL([5], 0) AS D5, "+
									"			ISNULL([6], 0) AS D6, "+
									"			ISNULL([7], 0) AS D7, "+
									"			ISNULL([8], 0) AS D8, "+
									"			ISNULL([9], 0) AS D9, "+
									"			ISNULL([10], 0) AS D10, "+
									"			ISNULL([11], 0) AS D11, "+
									"			ISNULL([12], 0) AS D12, "+
									"			ISNULL([13], 0) AS D13, "+
									"			ISNULL([14], 0) AS D14, "+
									"			ISNULL([15], 0) AS D15, "+
									"			ISNULL([16], 0) AS D16, "+
									"			ISNULL([17], 0) AS D17, "+
									"			ISNULL([18], 0) AS D18, "+
									"			ISNULL([19], 0) AS D19, "+
									"			ISNULL([20], 0) AS D20, "+
									"			ISNULL([21], 0) AS D21, "+
									"			ISNULL([22], 0) AS D22, "+
									"			ISNULL([23], 0) AS D23, "+
									"			ISNULL([24], 0) AS D24, "+
									"			ISNULL([25], 0) AS D25, "+
									"			ISNULL([26], 0) AS D26, "+
									"			ISNULL([27], 0) AS D27, "+
									"			ISNULL([28], 0) AS D28, "+
									"			ISNULL([29], 0) AS D29, "+
									"			ISNULL([30], 0) AS D30, "+
									"			ISNULL([31], 0) AS D31 "+
									"  FROM		 "+
									"			( "+
									"			SELECT		D.ID_REGIMEN AS ID_REGIMEN, "+
									"						N.DESCRIPCION AS NOMB_REGIMEN, "+
									"						D.TURNO AS TURNO, "+
									"						TOTAL, "+
									"						ORDEN,	"+
									"						DAY(FECHA) AS DIA "+
									"			  FROM		REGIMEN_DETALLE D "+
									"			  JOIN		REGIMEN_NUTRICIONAL N "+
									"			    ON		D.ID_REGIMEN = N.ID_REGIMEN "+
									"			 WHERE		YEAR(FECHA) = '"+s_anio+"' "+
									"			   AND		MONTH(FECHA) = '"+s_mes+"' "+
									"			   AND		D.TIPO = '"+s_tipo+"' "+
									"			   AND		D.TURNO = '"+s_turno+"' "+
									"			   AND		N.ESTADO = '1' "+
									"			) AS DATA "+
									" PIVOT		( "+
									"			SUM(TOTAL)  "+
									"			FOR DIA IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10], "+
									"						[11],[12],[13],[14],[15],[16],[17],[18],[19],[20], "+
									"						[21],[22],[23],[24],[25],[26],[27],[28],[29],[30], [31] "+
									"					   ) "+
									"			) AS PVT "+
									"ORDER BY ORDEN ";
								//out.print(COMANDO);
							rset = stmt.executeQuery(COMANDO);
						while(rset.next())
						{	count++;
%>								
								<tr>
									<td>
										<div align="center"><%=rset.getString("TURNO2")%></div>
									</td>
									<td>
										<%=rset.getString("NOMB_REGIMEN")%>
									</td>
									
<%
									for (int i=1; i<=dias; i++) 
									{									
%>
									<td>
										<div align="center"><%=rset.getString("D"+i)%></div>
									</td>
<%
									}
%>									

								</tr>
<%
						}
%>								
								<tr>
									<td colspan="32" align="center">
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
