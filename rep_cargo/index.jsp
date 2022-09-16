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
                            REPORTE DE PERSONAL CARGOS
                        </div>
                    </div>

                    <div class="panel-body">

                        <div class="input-daterange input-group" id="bs-datepicker-range">

                            <span class="input-group-addon"> Cargos </span>
                                <select class="input-sm form-control" name="f_unidad" id="f_unidad">
                                    <option value="0"> Seleccionar Cargo </option>
                    <%
                                COMANDO = "select    ID_CARGO, "+
                                            "        Nombre "+
                                            " from   CARGO "+
                                            "where   estado = 1 "+
                                            "order by Nombre asc ";
                                 // out.print(COMANDO);
                                rset = stmt.executeQuery(COMANDO);
                                while(rset.next())
                                {
                    %>
                                    <option value="<%=rset.getString("ID_CARGO")%>"><%=rset.getString("nombre")%></option>
                    <%          }
                    %>
                                    <option value="999"> ** TODOS LOS CARGOS ** </option>
                                </select>

                        </div>
                    </div>                        
                </div>

        </div>
    </div>

	<div id="cargando" class="cargando" align="center" style="display:none; color: red;"><img src="../images/loading.gif" width="40" height="40" /></div>
	</table>
	<div id="reporte"></div>

                <!-- 
                <script>
                    init.push(function () {
                        Morris.Bar({
                            element: 'hero-bar',
                            data: [
                                { device: 'Nombrado', geekbench:  5 },
                                { device: 'Dest. a Otra', geekbench: 3 },
                                { device: 'Dest. de Otra', geekbench: 2 },
                                { device: 'Cas', geekbench: 9 },
                                { device: 'Baja', geekbench: 0 },
                                { device: 'Tercero', geekbench: 5 },
                                { device: 'Residente', geekbench: 9 },
                                { device: 'Interno', geekbench: 7 }
                            ],
                            xkey: 'device',
                            ykeys: ['geekbench'],
                            labels: ['Cantidad'],
                            barRatio: 0.4,
                            xLabelAngle: 35,
                            hideHover: 'auto',
                            barColors: PixelAdmin.settings.consts.COLORS,
                            gridLineColor: '#cfcfcf',
                            resize: true
                        });
                    });
                </script>
                
                <div class="panel">
                    <div class="panel-heading">
                        <span class="panel-title">Rep. Cargo</span>
                    </div>
                    <div class="panel-body">
                        <div class="graph-container">
                            <div id="hero-bar" class="graph"></div>
                        </div>
                    </div>
                </div>
 -->
<%@ include file="../menu/pie2.jsp"%>