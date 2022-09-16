<%@ include file="../menu/cabecera2.jsp"%>


	<script>

		init.push(function () {

			$('#reporte').fadeIn("fast").load('reporte.jsp?f_unidad=0', function(){ $("#cargando").css("display", "none");});

            $(document).delegate("#f_unidad","change",function(){

                //$.post('reporte.jsp?f_unidad='+$('#f_unidad').val() ,function(data){
                $('#reporte').fadeIn("fast").load('reporte.jsp?f_unidad='+$('#f_unidad').val(), function(){ $("#cargando").css("display", "none");});
                //});

            });

		});
	</script>

   <div class="row">
        <div class="col-md-7 col-md-offset-3">
                <div class="table-primary">
                    <div align="center"  class="table-header">
                        <div class="table-caption">
                            NOMINA DE PERSONAL
                        </div>
                    </div>

                    <div class="panel-body">

                        <div class="input-daterange input-group" id="bs-datepicker-range">

                            <span class="input-group-addon"> Unidad </span>
                                <select class="input-sm form-control" name="f_unidad" id="f_unidad">
                    <%
                                COMANDO = "select    IdDepartUnid, "+
                                            "        Codigo, "+
                                            "        Nombre, "+
                                            "        Tipo   "+
                                            " from   DepartamentoUnidad "+
                                            "order by codigo asc ";
                                 // out.print(COMANDO);
                                rset = stmt.executeQuery(COMANDO);
                                while(rset.next())
                                {
                    %>
                                    <option value="<%=rset.getString("IdDepartUnid")%>"><%=rset.getString("nombre")%></option>
                    <%          }
                    %>
                                </select>

                        </div>
                    </div>                        
                </div>

        </div>
    </div>

	<div id="cargando" class="cargando" align="center" style="display:none; color: red;"><img src="../images/loading.gif" width="40" height="40" /></div>
	</table>
	<div id="reporte"></div>

<%@ include file="../menu/pie2.jsp"%>
