<%@ include file="../menu/cabecera2.jsp"%>


<script>
  

    init.push(function () {

            $('#reporte').fadeIn("fast").load('reporte.jsp?f_codigo='+$('#f_codigo').val()+'&f_unidad='+$('#f_situacion').val()+'&f_nomb=X', function(){ $("#cargando").css("display", "none");});

            $('#serv').hide();
            

        $('#modal-blurred-bg2').on('shown.bs.modal', function() {            
            $('#bs-datepicker-component').datepicker({
                format: "dd/mm/yyyy",
                startDate: "13-05-2022",
                endDate: "31-12-2022",
                todayBtn: "linked",
                autoclose: true,
                todayHighlight: true             
            });
        });


            $(document).delegate("#f_unidadrol_upd","change",function(){

                $.post('servicio.jsp?f_unidad='+$('#f_unidadrol_upd').val() ,function(data){
                    $("#serv").show();
                    $("#f_serviciorol_upd").html(data);

                });

            });            
          
            $(document).delegate("#f_unidadrol_add","change",function(){

                $.post('servicio.jsp?f_unidad='+$('#f_unidadrol_add').val() ,function(data){
                    $("#serv").show();
                    $("#f_serviciorol_add").html(data);

                });

            });            

            $(document).delegate("#f_situacion","change",function(){

              //  $.post('servicio.jsp?f_unidad='+$('#f_unidad').val() ,function(data){
                   // $("#serv").show();
                   // $("#f_servicio").html(data);
                    $('#reporte').fadeIn("fast").load('reporte.jsp?f_codigo='+$('#f_codigo').val()+'&f_unidad='+$('#f_situacion').val()+'&f_nomb='+$('#f_nomb').val(), function(){ $("#cargando").css("display", "none");});
              //  });

            });

            $(document).delegate("#f_unidad_upd","change",function(){

                $.post('servicio_upd.jsp?f_unidad_upd='+$('#f_unidad_upd').val()+'&f_servicio_upd='+$('#f_servicio_upd').val() ,function(data){
                    $("#serv_upd").show();
                    $("#f_servicio_upd").html(data);
                    
                });

            });

            $(document).delegate("#f_nomb","keyup",function(){

              $('#reporte').fadeIn("fast").load('reporte.jsp?f_codigo='+$('#f_codigo').val()+'&f_unidad='+$('#f_situacion').val()+'&f_servicio='+$('#f_servicio').val()+'&f_nomb='+$('#f_nomb').val(), function(){ $("#cargando").css("display", "none");});

            });

            $(document).delegate("#editar","click",function(){
                var id = $(this).attr('name');
                //alert(id);

              $( "#mostrar" ).load( 'editar_unidad.jsp?f_id='+id );
              $('#serv_upd').hide();

            });

            $(document).delegate("#traslado","click",function(){
                var id = $(this).attr('name');
                //alert(id);

              $( "#mostrar_traslado" ).load( 'traslado_personal.jsp?f_id='+id );

            });            
            
            $(document).delegate("#new_personal","click",function(){

                 $( "#mostrar2" ).load( 'add_prog.jsp?f_condicion_add='+$('#f_situacion').val() );
            });            

            $(document).delegate("#editar_upd","click",function(){
               // var codd = $(this).attr('name');

               // alert($('#f_cargo_funcional_upd').val());

                $.post('upd_maestro.jsp?f_dni_upd='+$('#f_dni_upd').val()+'&f_codigo_upd='+$('#f_codigo_upd').val()+'&f_plaza_upd='+$('#f_plaza_upd').val()+'&f_nombre_upd='+$('#f_nombre_upd').val()+'&f_cargo_presupuestal_upd='+$('#f_cargo_presupuestal_upd').val()+'&f_nivel_upd='+$('#f_nivel_upd').val()+'&f_remuneracion_upd='+$('#f_remuneracion_upd').val()+'&f_horario_upd='+$('#f_horario_upd').val()+'&f_horas_upd='+$('#f_horas_upd').val()+'&f_cargo_funcional_upd='+$('#f_cargo_funcional_upd').val()+'&f_unidad_organica_upd='+$('#f_unidad_organica_upd').val()+'&f_nivel_pago_upd='+$('#f_nivel_pago_upd').val()+'&f_grupo_trabajador_upd='+$('#f_grupo_trabajador_upd').val()+'&f_dni_reloj_upd='+$('#f_dni_reloj_upd').val()+'&f_essalud_upd='+$('#f_essalud_upd').val()+'&f_codsiaf_upd='+$('#f_codsiaf_upd').val()+'&f_cadena_funcional_upd='+$('#f_cadena_funcional_upd').val()+'&f_direccion_upd='+$('#f_direccion_upd').val()+'&f_estadocivil_upd='+$('#f_estadocivil_upd').val()+'&f_unidadrol_upd='+$('#f_unidadrol_upd').val()+'&f_serviciorol_upd='+$('#f_serviciorol_upd').val()+'&f_fecing_upd='+$('#f_fecing_upd').val()+'&f_fecnac_upd='+$('#f_fecnac_upd').val() , function(data){

                   if(data == 1){

                      $('#myModal').modal('hide');
                      $('#reporte').fadeIn("fast").load('reporte.jsp?f_codigo='+$('#f_codigo').val()+'&f_unidad='+$('#f_situacion').val()+'&f_servicio='+$('#f_servicio').val()+'&f_nomb='+$('#f_nomb').val(), function(){ $("#cargando").css("display", "none");});

                   }else{

                        alert('Error Vuelva a intentar en 5 minutos!!!');                        
                    }
                });

            });

            $(document).delegate("#editar_add","click",function(){
               // var codd = $(this).attr('name');

               // alert($('#f_cargo_funcional_upd').val());

                $.post('add_maestro.jsp?f_dni_add='+$('#f_dni_add').val()+'&f_codigo_add='+$('#f_codigo_add').val()+'&f_plaza_add='+$('#f_plaza_add').val()+'&f_nombre_add='+$('#f_nombre_add').val()+'&f_cargo_presupuestal_add='+$('#f_cargo_presupuestal_add').val()+'&f_nivel_add='+$('#f_nivel_add').val()+'&f_remuneracion_add='+$('#f_remuneracion_add').val()+'&f_horario_add='+$('#f_horario_add').val()+'&f_horas_add='+$('#f_horas_add').val()+'&f_cargo_funcional_add='+$('#f_cargo_funcional_add').val()+'&f_unidad_organica_add='+$('#f_unidad_organica_add').val()+'&f_nivel_pago_add='+$('#f_nivel_pago_add').val()+'&f_grupo_trabajador_add='+$('#f_grupo_trabajador_add').val()+'&f_dni_reloj_add='+$('#f_dni_reloj_add').val()+'&f_essalud_add='+$('#f_essalud_add').val()+'&f_codsiaf_add='+$('#f_codsiaf_add').val()+'&f_cadena_funcional_add='+$('#f_cadena_funcional_add').val()+'&f_condicion_add='+$('#f_condicion_add').val()+'&f_direccion_add='+$('#f_direccion_add').val()+'&f_estadocivil_add='+$('#f_estadocivil_add').val()+'&f_unidadrol_add='+$('#f_unidadrol_add').val()+'&f_serviciorol_add='+$('#f_serviciorol_add').val()+'&f_fecing_add='+$('#f_fecing_add').val()+'&f_fecnac_add='+$('#f_fecnac_add').val() , function(data){

                   if(data == 1){

                      $('#modal-blurred-bg').modal('hide');
                      $('#reporte').fadeIn("fast").load('reporte.jsp?f_codigo='+$('#f_codigo').val()+'&f_unidad='+$('#f_situacion').val()+'&f_servicio='+$('#f_servicio').val()+'&f_nomb='+$('#f_nomb').val(), function(){ $("#cargando").css("display", "none");});

                   }else{

                        alert('Error Vuelva a intentar en 5 minutos!!!');                        
                    }
                });

            });            

            $(document).delegate("#eliminar_cita","click",function(){
                var del = $(this).attr('name');
                //alert(del);
                $( "#mostrar3" ).load( 'eliminar_cita.jsp?f_id='+del );
            });            

            $(document).delegate("#delete_personal","click",function(){
              var iddel  = $('#f_id_del').val();
              var motivo = $('#f_obs').val();
              var fecha_del = $('#f_fecha_del').val();
              var situacion_destino = $('#f_situacion_destino').val();
              var cod_situacion = $('#f_cod_situacion').val();
              
              $.post('delete_personal.jsp?f_id='+iddel+'&f_motivo='+motivo+'&f_fecha_del='+fecha_del+'&f_situacion_destino='+situacion_destino+'&f_cod_situacion='+cod_situacion, function(data){
                if(data == 1)
                {
                    $('#modal-blurred-bg2').modal('hide');
                    $('#reporte').fadeIn("fast").load('reporte.jsp?f_codigo='+$('#f_codigo').val()+'&f_unidad='+$('#f_situacion').val()+'&f_servicio='+$('#f_servicio').val()+'&f_nomb='+$('#f_nomb').val(), function(){ $("#cargando").css("display", "none");});
                }else{
                  alert('Error Vuelva a intentar en 5 minutos!!!');
                }

              });

            });


            function pressServicio(){
                var vcl = $(this).val();
                    $('#ce').hide("fast");
                    $('#co').show("fast");
                    $('#to').attr("selected","selected");
                    $('#tablita').fadeOut("fast");
                    $("#cargando").css("display", "inline");
                    $('#reporte').fadeIn("fast").load('reporte.jsp?f_codigo='+$('#f_codigo').val()+'&f_unidad='+$('#f_situacion').val()+'&f_servicio='+$('#f_servicio').val()+'&f_nomb='+$('#f_nomb').val(), function(){ $("#cargando").css("display", "none");});
            } 



/*
----------------------------------------------------------------
                    AUTOCOMPLETE -- BOOTSTRAP --
*/   

            $(document).delegate("#f_personal","keydown",function(){
                $("#f_personal").autocomplete({
                    source: function(request, response) {
                        $.ajax({
                            url: 'search5.jsp?',
                            dataType: "json",
                            data: {
                                name: request.term
                            },
                            success: function(data) {
                                response($.map(data, function(item) {
                                    //if(item.estadorespuesta==1){
                                        return {
                                            label: item.name,
                                            value: item.value
                                        }
                    
                                }));
                            }
                        });
                    },
                    minLength: 2,
                    focus: function() {
                      return false;
                    },
                    select: function(event, ui) {
                        if(ui.item.value==0){
                            return false;
                        }else{
                            $("#f_personal").val(ui.item.label);
                            $("#f_codigo").val(ui.item.value);
                            return false;
                        }        
                    }
                });
                $("#f_personal").autocomplete("option","appendTo",".posicionar-aqui");
            })

// -------------------------------------------------------------------

            $(document).delegate("#f_codigo","keydown",function(){
                $("#f_codigo").autocomplete({
                    source: function(request, response) {
                        $.ajax({
                            url: 'search6.jsp?',
                            dataType: "json",
                            data: {
                                name: request.term
                            },
                            success: function(data) {
                                response($.map(data, function(item) {
                                    //if(item.estadorespuesta==1){
                                        return {
                                            label: item.name,
                                            value: item.value
                                        }
                    
                                }));
                            }
                        });
                    },
                    minLength: 2,
                    focus: function() {
                      return false;
                    },
                    select: function(event, ui) {
                        if(ui.item.value==0){
                            return false;
                        }else{
                            $("#f_personal").val(ui.item.label);
                            $("#f_codigo").val(ui.item.value);
                            return false;
                        }        
                    }
                });
                $("#f_codigo").autocomplete("option","appendTo",".posicionar-aqui");
            })
/*
----------------------------------------------------------------
*/

            // Setup validation
            $("#unidad_organica").validate({
                ignore: '.ignore, .select2-input',
                focusInvalid: false,
                rules: {

                    'f_personal': {
                        required: true,
                        minlength: 1
                    },
                    'f_servicio': {
                        required: true,
                        minlength: 1
                    },
                    'f_codigo': {
                        required: true,
                        minlength: 1
                    }
                },
                messages: {
                    'jq-validation-policy': 'You must check it!'
                }
            });
            $('#unidad_organica').on('submit', function () {
                if ($(this).valid()) {

                    $.post("addPersonalUnidad.jsp", $('#unidad_organica').serialize() ,function(data){
                       if(data == 1){

                          $('#reporte').fadeIn("fast").load('reporte.jsp?f_codigo='+$('#f_codigo').val()+'&f_unidad='+$('#f_unidad').val()+'&f_servicio='+$('#f_servicio').val()+'&f_nomb='+$('#f_nomb').val(), function(){ $("#cargando").css("display", "none");});

                       }else {

                            alert('Ya esta asignado a un servicio!!');

                        } 

                    });

                }
                return false;
            });
/*
----------------------------------------------------------------
*/



    });

    $(function() {
      $('#datetimepicker1').datetimepicker({
        language: 'pt-BR'
      });
    });
</script>


	<!-- /7. $BOOTSTRAP_DATEPICKER -->
    <div class="row">
      <form id="unidad_organica" name="unidad_organica">
        <div class="col-md-6 col-md-offset-3">
                <div class="table-primary">
                    <div align="center"  class="table-header">
                        <div class="table-caption">
                            ASIGNAR PERSONAL - UNIDAD ORGANICA
                        </div>
                    </div>

                    <div class="panel-body">
    
          						<div align="left" class="input-daterange input-group" id="bs-datepicker-range"> 
                                    <span class="input-group-addon">
                       					PERSONAL :  
                                    </span>
                                    <input class="input-sm form-control" type="text" name="f_personal" id="f_personal"  >
                      			</div>  

                                <div class="input-daterange input-group" id="bs-datepicker-range">
                                    <span class="input-group-addon">Situacion</span>
                                    <select id="f_situacion" name="f_situacion"  class="input-sm form-control">
<%
                                COMANDO = "  SELECT      * "+
                                            "  FROM      T_TipoSituacion "+
                                            " WHERE      ESTADO = 1 ";
                                    rset = stmt.executeQuery(COMANDO);
                                    while (rset.next()) {
%>
                                        <option value="<%=rset.getString("CODIGO")%>"> <%=rset.getString("NOMBRE")%> </option>
<%                                        
                                    }
%>
                                        
                                    </select>
                                </div>

                                 <div class="input-daterange input-group" id="bs-datepicker-range">
                                    <span class="input-group-addon">Busqueda por trabajador</span>
                                    <input class="input-sm form-control" type="text" id="f_nomb" name="f_nomb" value=""> 
                                </div>
<!--
                                <div class="input-group">
                                    <div id="bs-datepicker-component" style="position: relative; z-index: 9999;">
                                        <input type="text" class="form-control date-picker"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    </div>
                                </div>

            <div class="input-group">
                <div class="input-group date" id="bs-datepicker-component">
                    <input type="text" class="form-control"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                </div>
            </div>
-->
                                <div class="form-group">
                                    <div align="center" class="col-sm-offset-1 col-sm-9">

                                      <button type="submit" id="enviar_upd" class="btn btn-primary" >Guardar</button>&nbsp;&nbsp;
                                      <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>

                                    </div>
                                </div>
          			</div>

                </div>
        </div>
      </form>
    </div>

<div id="cargando" class="cargando" style="display:none; color: red;"><img src="../images/loading.gif" width="20" height="20" /></div>

<div id="reporte"><img src="../images/loading.gif" width="20" height="20" /></div>

                <!-- Modal -->
                <div id="myModalTraslado" class="modal fade" tabindex="-1" role="dialog" style="display: none;">
                    <div class="modal-dialog modal-lg">
                        <div align="center" class="modal-content">
                            <div align="center" class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                                <h4 class="modal-title" id="myModalTras">Historial de Traslado</h4>
                            </div>
                            <div class="modal-body" id="mostrar_traslado">
                               <img src="../images/loading.gif" width="20" height="20" />
                            </div> <!-- / .modal-body -->

                        </div> <!-- / .modal-content -->
                    </div> <!-- / .modal-dialog -->
                </div> <!-- /.modal -->
                <!-- / Modal -->

                <!-- Modal -->
                <div id="myModal" class="modal fade" tabindex="-1" role="dialog" style="display: none;">
                    <div class="modal-dialog modal-lg">
                        <div align="center" class="modal-content">
                            <div align="center" class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                                <h4 class="modal-title" id="myModalLabel">Editar Unidad Organica del Personal</h4>
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
                                <h4 class="modal-title">Dar de Baja al Personal</h4>
                            </div>
                            <div class="modal-body posicionar-aqui" id="mostrar3">
                               <img src="../images/loading.gif" width="20" height="20" />
                            </div> <!-- / .modal-body -->
                        </div> <!-- / .modal-content -->
                    </div> <!-- / .modal-dialog -->
                </div> <!-- / .modal -->
                <!-- / Template -->           


<%@ include file="../menu/pie2.jsp"%>