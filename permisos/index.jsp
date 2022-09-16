<%@ include file="../menu/cabecera2.jsp"%>


    <script>

        function myFunction(num) {

            $.post('UpdProgramacion.jsp?f_dia='+num+'&f_aniow='+$('#f_aniow').val()+'&f_mesw='+$('#f_mesw').val()+'&f_codigow='+$('#f_codigow').val()+'&f_situacion='+$('#f_situacion').val()+'&f_dato='+$('#dia_'+num).val() ,function(data){
               if(data == 1){

                  //$('#myModal').modal('hide');
                  $( "#mostrar" ).load( 'editar_cita.jsp?f_codigo='+$('#f_codigow').val()+'&f_anio='+$('#f_anio').val()+'&f_mes='+$('#f_mes').val()+'&f_codunid='+$('#f_codunid').val() );

               }else if(data == 2) {

                    alert('Tiene un mayor Rango de Hora de Tipo G.');

                } else{

                    alert('La suma total de hora es mayor a lo permitido ');  

                }
            });
        }

        init.push(function () {

            $('#reporte').fadeIn("fast").load('reporte.jsp?f_mes='+$('#f_mes').val()+'&f_anio='+$('#f_anio').val()+'&f_nomb=X', function(){ $("#cargando").css("display", "none");});

            $('#f_mes').change(pressMes);
            $('#f_anio').change(pressAnio);
            //$('#f_unidad').change(pressUnidad);
            $("#f_detalle_licencia").hide();


            $(document).delegate("#editar_personal","click",function(){
                var id = $(this).attr('name');
                //alert(id);
                $( "#mostrar" ).load( 'editar_cita.jsp?f_codigo='+id+'&f_anio='+$('#f_anio').val()+'&f_mes='+$('#f_mes').val() );
            });

            $(document).delegate("#licencias","click",function(){
                var id = $(this).attr('name');
                //$('#reporte').fadeIn("fast").load('permiso.jsp?f_mes='+$('#f_mes').val()+'&f_anio='+$('#f_anio').val()+'&f_nomb='+$('#f_nomb').val()+'&f_id='+id, function(){ $("#cargando").css("display", "none");});
                window.location.href = 'permiso.jsp?f_mes='+$('#f_mes').val()+'&f_anio='+$('#f_anio').val()+'&f_id='+id;
            });

            $(document).delegate("#vacaciones","click",function(){
                var id = $(this).attr('name');
                //$('#reporte').fadeIn("fast").load('permiso.jsp?f_mes='+$('#f_mes').val()+'&f_anio='+$('#f_anio').val()+'&f_nomb='+$('#f_nomb').val()+'&f_id='+id, function(){ $("#cargando").css("display", "none");});
                window.location.href = 'vacaciones.jsp?f_anio='+$('#f_anio').val()+'&f_codigo='+id;
            });            

            $(document).delegate("#registrar_lactancia","click",function(){
                var codlac = $(this).attr('name');
                //alert('11');
                $("#mostrar3").load( 'registrar_lactancia.jsp?f_codigo='+codlac );

            });

            $(document).delegate("#rep_vacaciones","click",function(){
                var id = $(this).attr('name');
                $('#reporte').fadeIn("fast").load('historial_vacaciones.jsp?f_mes='+$('#f_mes').val()+'&f_anio='+$('#f_anio').val()+'&f_codigo='+id, function(){ $("#cargando").css("display", "none");});
                //window.location.href = 'vacaciones.jsp?f_anio='+$('#f_anio').val()+'&f_codigo='+id;
            });          

            $(document).delegate("#llave_aceptar","click",function(){
                var cod2lac = $(this).attr('name');

                $.post('cerrar_programa.jsp?f_mes='+$('#f_mes').val()+'&f_anio='+$('#f_anio').val()+'&f_cod='+cod2lac, function(data){

                   if(data == 1){

                     //$('#myModal').modal('hide');
                       $('#reporte').fadeIn("fast").load('reporte.jsp?f_mes='+$('#f_mes').val()+'&f_anio='+$('#f_anio').val()+'&f_nomb=X', function(){ $("#cargando").css("display", "none");});

                   }else{

                        alert('Error Vuelva a intentar en 5 minutos!!!');  

                    }
                });

            });

            $(document).delegate("#mostrar_personal","click",function(){
                var codd2 = $(this).attr('name');
              //  alert(codd2);
                $( "#mostrar" ).load( 'ver_programa.jsp?f_codigo='+codd2+'&f_anio='+$('#f_anio').val()+'&f_mes='+$('#f_mes').val() );
            });

            $(document).delegate("#f_nomb","keyup",function(){

                $('#reporte').fadeIn("fast").load('reporte.jsp?f_mes='+$('#f_mes').val()+'&f_anio='+$('#f_anio').val()+'&f_nomb='+$('#f_nomb').val(), function(){ $("#cargando").css("display", "none");});

            });

            $(document).delegate("#print_programa","click", function(){
                var cod = $(this).attr('name');
                
                var url = 'mostrar_personal.jsp?f_mes='+$('#f_mes').val()+'&f_anio='+$('#f_anio').val()+'&f_codigo='+cod;
                //var partFields = $("#addPac").serialize();
                window.location.href= url;
            });

            $(document).delegate("#new_personal","click",function(){

                 $( "#mostrar2" ).load( 'add_prog.jsp?f_anio='+$('#f_anio').val()+'&f_mes='+$('#f_mes').val() );
            });

            $('#f_fecha').datepicker({
                dateFormat: "dd/mm/yyyy"

            }).on('changeDate', function (ev) {
                   // $('#reporte').fadeIn("fast").load('reporte.jsp?f_fecha='+$('#f_fecha').val()+'&f_turno='+$('#f_turno').val()+'&f_tipo='+$('#f_tipo').val(), function(){ $("#cargando").css("display", "none");});
            });;    

            $(document).delegate("#delete_programa","click",function(){
                var codd = $(this).attr('name');

                $.post('delete_programa.jsp?f_mes='+$('#f_mes').val()+'&f_anio='+$('#f_anio').val()+'&f_codigo='+codd, function(data){

                   if(data == 1){

                      $('#modal-blurred-bg').modal('hide');
                       $('#reporte').fadeIn("fast").load('reporte.jsp?f_mes='+$('#f_mes').val()+'&f_anio='+$('#f_anio').val()+'&f_nomb=X', function(){ $("#cargando").css("display", "none");});

                   }else{

                        alert('Error Vuelva a intentar en 5 minutos!!!');                        
                    }
                });

            });


            $(document).delegate("#upd_per","click",function(){

                $.post("UpdLactancia.jsp", $('#guardar_persona').serialize() ,function(data){
                   if(data == 1){

                      $('#modal-blurred-bg2').modal('hide');

                   }else{

                        alert('Error Vuelva a intentar en 5 minutos!!!');  

                    }
                });

            });

            function pressMes(){
                var vcl = $(this).val();
                    $('#ce').hide("fast");
                    $('#co').show("fast");
                    $('#to').attr("selected","selected");
                    $('#tablita').fadeOut("fast");
                    $("#cargando").css("display", "inline");
                    $("#f_nomb").val('');
                    $('#reporte').fadeIn("fast").load('reporte.jsp?f_anio='+$('#f_anio').val()+'&f_mes='+vcl+'&f_nomb=X', function(){ $("#cargando").css("display", "none");});

            } 

            function pressAnio(){
                var vcl = $(this).val();
                    $('#ce').hide("fast");
                    $('#co').show("fast");
                    $('#to').attr("selected","selected");
                    $('#tablita').fadeOut("fast");
                    $("#cargando").css("display", "inline");
                    $("#f_nomb").val('');
                    $('#reporte').fadeIn("fast").load('reporte.jsp?f_mes='+$('#f_mes').val()+'&f_unidad='+$('#f_unidad').val()+'&f_anio='+vcl+'&f_nomb=X', function(){ $("#cargando").css("display", "none");});

            }

        });
    </script>

<%

    String s_fechact = "";
    String s_anio    = "";
    String s_codunid = "";
    int i = 0;
    
    COMANDO =   " select CONVERT(VARCHAR(10), SYSDATETIME(), 103) fechact, datepart(year,getdate()) as anio ";
    rset = stmt.executeQuery(COMANDO);
    if(rset.next()) {
        s_fechact   = rset.getString("fechact");
        s_anio      = rset.getString("anio");
    }


%>

<!-- /7. $BOOTSTRAP_DATEPICKER -->
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
                <div class="table-primary">
                    <div align="center"  class="table-header">
                        <div class="table-caption">
                            Programacion de Horario para Turnos Rotativos
                        </div>
                    </div>

                    <div class="panel-body">
                        
                        <div class="input-daterange input-group" id="bs-datepicker-range">

                            <span class="input-group-addon">Periodo</span>
                                <select class="input-sm form-control" name="f_anio" id="f_anio">

                                    <option <%if(s_anio.equals("2014")){%> selected <%}%> value="2014">2014</option>
                                    <option <%if(s_anio.equals("2015")){%> selected <%}%> value="2015">2015</option>
                                    <option <%if(s_anio.equals("2016")){%> selected <%}%> value="2016">2016</option>
                                    <option <%if(s_anio.equals("2017")){%> selected <%}%> value="2017">2017</option>
                                    <option <%if(s_anio.equals("2018")){%> selected <%}%> value="2018">2018</option>
                                    <option <%if(s_anio.equals("2019")){%> selected <%}%> value="2019">2019</option>
                                    <option <%if(s_anio.equals("2020")){%> selected <%}%> value="2020">2020</option>
                                    <option <%if(s_anio.equals("2021")){%> selected <%}%> value="2021">2021</option>                           
                                    <option <%if(s_anio.equals("2022")){%> selected <%}%> value="2022">2022</option>
                                    <option <%if(s_anio.equals("2023")){%> selected <%}%> value="2023">2023</option>
                                    <option <%if(s_anio.equals("2024")){%> selected <%}%> value="2024">2024</option>
                                </select>

                            <span class="input-group-addon">Mes</span>
                                <select class="input-sm form-control" name="f_mes" id="f_mes">
                    <%
                                COMANDO3 = "select  mes, "+
                                            "       CASE MES "+
                                            "           WHEN datepart(month,getdate())THEN 'selected' "+
                                            "        ELSE ' '  "+
                                            "    END SEL_MES, "+
                                            "       nombre "+
                                            " from  mes "+
                                            //" where mes >= datepart(month,getdate()) "+
                                            "order by mes asc ";
                                //  out.print(COMANDO);
                                rset3 = stmt3.executeQuery(COMANDO3);
                                while(rset3.next())
                                {
                    %>
                                    <option <%=rset3.getString("SEL_MES")%> value="<%=rset3.getString("mes")%>"><%=rset3.getString("nombre")%></option>
                    <%          }
                    %>
                   
                                </select>

                        </div>
                        <div class="input-daterange input-group" id="bs-datepicker-range">
                            <span class="input-group-addon">Busqueda por trabajador</span>
                            <input class="input-sm form-control" type="text" id="f_nomb" name="f_nomb" value="">                             
                        </div>

                    </div>
                </div>

        </div>
    </div>
<div id="cargando" class="cargando" style="display:none; color: red;"><img src="../images/loading.gif" width="20" height="20" /></div>
</table>
<div id="reporte" align="center">
        <img src="../images/loading.gif" width="40" height="40" />
</div>

                <!-- Modal -->
                <div id="myModal" class="modal fade" tabindex="-1" role="dialog" style="display: none;">
                    <div class="modal-dialog">
                        <div align="center" class="modal-content">
                            <div align="center" class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                                <h4 class="modal-title" id="myModalLabel">Programacion de Horarios Variantes</h4>
                            </div>
                            <div class="modal-body" id="mostrar">
                               <img src="../images/loading.gif" width="20" height="20" />
                            </div> <!-- / .modal-body -->

                        </div> <!-- / .modal-content -->
                    </div> <!-- / .modal-dialog -->
                </div> <!-- /.modal -->
                <!-- / Modal -->


                <!-- Template -->
                <div id="modal-blurred-bg" class="modal fade modal-blur" tabindex="-1" role="dialog" style="display: none;">
                    <div class="modal-dialog modal-lg">
                        <div  class="modal-content">
                            <div align="center" class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">x</button>
                                <h4 class="modal-title">Nueva Programacion del Personal</h4>
                            </div>
                            <div class="modal-body posicionar-aqui" id="mostrar2">
                               <img src="../images/loading.gif" width="20" height="20" />
                            </div> <!-- / .modal-body -->
                        </div> <!-- / .modal-content -->
                    </div> <!-- / .modal-dialog -->
                </div> <!-- / .modal -->
                <!-- / Template -->

                <!-- Template -->
                <div id="modal-blurred-bg2" class="modal fade modal-blur" tabindex="-1" role="dialog" style="display: none;">
                    <div class="modal-dialog modal-lg">
                        <div  class="modal-content">
                            <div align="center" class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">x</button>
                                <h4 class="modal-title">REGISTRO DE LACTANCIA</h4>
                            </div>
                            <div class="modal-body" id="mostrar3">
                               <img src="../images/loading.gif" width="20" height="20" />
                            </div> <!-- / .modal-body -->
                        </div> <!-- / .modal-content -->
                    </div> <!-- / .modal-dialog -->
                </div> <!-- / .modal -->
                <!-- / Template -->

<%@ include file="../menu/pie2.jsp"%>