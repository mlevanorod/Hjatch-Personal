<%@ include file="../menu/cabecera2.jsp"%>
<!-- Javascript -->

    <script>
        init.push(function () {

            $('#reporte').fadeIn("fast").load('reporte.jsp?f_fecha='+$('#f_fecha').val()+'&f_turno='+$('#f_turno').val(), function(){ $("#cargando").css("display", "none");});

            $('#f_turno').change(pressTurno);

            $(document).delegate("#excel", "click", function(){
                window.open( 'excel.jsp?f_fecha='+$('#f_fecha').val()+'&f_turno='+$('#f_turno').val() );
                return false;
            });

            $('#f_fecha').datepicker({
                dateFormat: "dd/mm/yyyy"

            }).on('changeDate', function (ev) {
                    $('#reporte').fadeIn("fast").load('reporte.jsp?f_fecha='+$('#f_fecha').val()+'&f_turno='+$('#f_turno').val(), function(){ $("#cargando").css("display", "none");});
            });;

            function pressTurno(){
                var vcl = $(this).val();
                    $('#ce').hide("fast");
                    $('#co').show("fast");
                    $('#to').attr("selected","selected");
                    $('#tablita').fadeOut("fast");
                    $("#cargando").css("display", "inline");
                    $("#f_nomb").val('');
                    $('#reporte').fadeIn("fast").load('reporte.jsp?f_fecha='+$('#f_fecha').val()+'&f_turno='+vcl, function(){ $("#cargando").css("display", "none");});
            }


        });

    function formatItem(row){ return row[0]; }
        
    function formatItemNoID(row){ return row[0]; }
        
    function formatResult(row){ return row[0].replace(/(<.+?>)/gi, ''); }

    </script>

<%

    String s_fechact = "";
    String s_anio    = "";
    int i = 0;
    String ip = null; // IP del cliente
    String name_pc = null;
    InetAddress direccion = InetAddress.getLocalHost();
    ip = direccion.getLocalHost().getHostAddress();//ip como String
    name_pc  = direccion.getHostName();
    
    COMANDO =   " select CONVERT(VARCHAR(10), SYSDATETIME(), 103) fechact, datepart(year,getdate()) as anio ";
    rset = stmt.executeQuery(COMANDO);
    if(rset.next()) {
        s_fechact   = rset.getString("fechact");
        s_anio      = rset.getString("anio");
    }

%>

<!-- /7. $BOOTSTRAP_DATEPICKER -->
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
                <div class="table-primary">
                    <div align="center"  class="table-header">
                        <div class="table-caption">
                            Reporte de Nutricion
                            <%=ip%> - <%=name_pc%>
                        </div>
                    </div>
                        
                        <div class="input-daterange input-group" id="bs-datepicker-range">
                            <span class="input-group-addon">Fecha</span>
                            <input type="text" class="input-sm form-control" id="f_fecha" name="f_fecha" placeholder="<%=s_fechact%>" value="<%=s_fechact%>">
                            <span class="input-group-addon">Turno</span>
                                <select class="input-sm form-control" name="f_turno" id="f_turno">

                                    <option  value="A">ALMUERZO</option>
                                    <option  value="C">CENA</option>

                                </select>
                            <span class="input-group-addon">
                            <a href="#" id="excel" title="Exportar a Excel" style="border-color:#FFF">
                                <img src="../images/excel.png" width="20" height="20">
                            </a>
                            </span>
                        </div>

                </div>
        </div>
    </div>
<div id="cargando" class="cargando" style="display:none; color: red;"><img src="../images/loading.gif" width="20" height="20" /></div>
</table>
<div id="reporte"></div>


<%@ include file="../menu/pie2.jsp"%>