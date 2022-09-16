<%@ include file="../menu/cabecera2.jsp"%>
<script>
  
    init.push(function () {

            $('#reporte').fadeIn("fast").load('reporte.jsp?f_codigo='+$('#f_codigo').val()+'&f_unidad='+$('#f_unidad').val()+'&f_servicio=0'+'&f_nomb=X', function(){ $("#cargando").css("display", "none");});

            $('#serv').hide();
            

            $('#f_servicio').change(pressServicio);

            $(document).delegate("#f_unidad","change",function(){

                $.post('servicio.jsp?f_unidad='+$('#f_unidad').val() ,function(data){
                    $("#serv").show();
                    $("#f_servicio").html(data);
                    $('#reporte').fadeIn("fast").load('reporte.jsp?f_codigo='+$('#f_codigo').val()+'&f_unidad='+$('#f_unidad').val()+'&f_servicio='+$('#f_servicio').val()+'&f_nomb='+$('#f_nomb').val(), function(){ $("#cargando").css("display", "none");});
                });

            });

            $(document).delegate("#f_unidad_upd","change",function(){

                $.post('servicio_upd.jsp?f_unidad_upd='+$('#f_unidad_upd').val()+'&f_servicio_upd='+$('#f_servicio_upd').val() ,function(data){
                    $("#serv_upd").show();
                    $("#f_servicio_upd").html(data);
                    
                });

            });

            $(document).delegate("#f_nomb","keyup",function(){

              $('#reporte').fadeIn("fast").load('reporte.jsp?f_codigo='+$('#f_codigo').val()+'&f_unidad='+$('#f_unidad').val()+'&f_servicio='+$('#f_servicio').val()+'&f_nomb='+$('#f_nomb').val(), function(){ $("#cargando").css("display", "none");});

            });

            $(document).delegate("#editar","click",function(){
                var id = $(this).attr('name');
                //alert(id);

              $( "#mostrar" ).load( 'editar_unidad.jsp?f_id='+id );
              $('#serv_upd').hide();

            });

            $(document).delegate("#editar_upd","click",function(){
               // var codd = $(this).attr('name');

                $.post('upd_unidad.jsp?f_codigo_upd='+$('#f_codigo_upd').val()+'&f_id_upd='+$('#f_id_upd').val()+'&f_servicio_upd='+$('#f_servicio_upd').val()+'&f_unidad_upd='+$('#f_unidad_upd').val() , function(data){

                   if(data == 1){

                      $('#myModal').modal('hide');
                      $('#reporte').fadeIn("fast").load('reporte.jsp?f_codigo='+$('#f_codigo').val()+'&f_unidad='+$('#f_unidad').val()+'&f_servicio='+$('#f_servicio').val()+'&f_nomb='+$('#f_nomb').val(), function(){ $("#cargando").css("display", "none");});

                   }else{

                        alert('Error Vuelva a intentar en 5 minutos!!!');                        
                    }
                });

            });

            $(document).delegate("#delete_personal","click",function(){
              var iddel = $(this).attr('name');
              //alert(iddel);
              $.post('delete_personal.jsp?f_id='+iddel, function(data){
                if(data == 1)
                {
                  $('#reporte').fadeIn("fast").load('reporte.jsp?f_codigo='+$('#f_codigo').val()+'&f_unidad='+$('#f_unidad').val()+'&f_servicio='+$('#f_servicio').val()+'&f_nomb='+$('#f_nomb').val(), function(){ $("#cargando").css("display", "none");});
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
                    $('#reporte').fadeIn("fast").load('reporte.jsp?f_codigo='+$('#f_codigo').val()+'&f_unidad='+$('#f_unidad').val()+'&f_servicio='+$('#f_servicio').val()+'&f_nomb='+$('#f_nomb').val(), function(){ $("#cargando").css("display", "none");});
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
/*
                    var url = 'addPersonalUnidad.jsp?';
                    var partFields = $("#unidad_organica").serialize();
                    window.location.href= url + partFields;
*/
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
                        <span class="input-group-addon">
                             COD :  
                        </span>
                        <input class="input-sm form-control" size="1" type="text" name="f_codigo" id="f_codigo"  >
          						</div>

          						<div class="input-dat
                      range input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
          								DEPART. / UNIDAD : 
                        </span> 
                          <select class="input-sm form-control" name="f_unidad" id="f_unidad">
                           <!-- <option value=""> **** Seleccione un Depart. o Unidad **** </option> -->
<%
                    COMANDO = "    SELECT   IdDepartUnid, "+
                                  "         Nombre, "+
                                  "         codigo "+
                                  "  FROM   dbo.DepartamentoUnidad "+
                                  " WHERE   ACTIVO = 1 "+
                                 // "   and   codigo <> '0000' "+
                                  //"   and   IdDepartUnid = 10 "+
                                  " ORDER  BY  CODIGO ASC ";
                            rset  = stmt.executeQuery(COMANDO);
                          while(rset.next())
                          {
%>
                            <option value="<%=rset.getString("IdDepartUnid")%>"><%=rset.getString("Nombre")%></option>
<%
                          }
%>
                          </select>
          						</div>

          						<div id="serv" align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
                            SERVICIO  : 
                        </span>
                          <select class="input-sm form-control" name="f_servicio" id="f_servicio">
                          </select>
          				</div>  

                         <div class="input-daterange input-group" id="bs-datepicker-range">
                            <span class="input-group-addon">Busqueda por trabajador</span>
                            <input class="input-sm form-control" type="text" id="f_nomb" name="f_nomb" value=""> 
                        </div>

                     <div class="form-group">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                      </div>

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
                <div id="myModal" class="modal fade" tabindex="-1" role="dialog" style="display: none;">
                    <div class="modal-dialog">
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

<%@ include file="../menu/pie2.jsp"%>