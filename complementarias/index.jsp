<%@ include file="../menu/cabecera2.jsp"%>

    <script>


        function myFunction(num) {

            $.post('UpdProgramacion.jsp?f_dia='+num+'&f_aniow='+$('#f_aniow').val()+'&f_mesw='+$('#f_mesw').val()+'&f_codigow='+$('#f_codigow').val()+'&f_unidadw='+$('#f_unidadw').val()+'&f_situacion='+$('#f_situacion').val()+'&f_dato='+$('#dia_'+num).val() ,function(data){
               if(data == 1){

                  //$('#myModal').modal('hide');
                  $( "#mostrar" ).load( 'editar_cita.jsp?f_codigo='+$('#f_codigow').val()+'&f_anio='+$('#f_anio').val()+'&f_mes='+$('#f_mes').val()+'&f_codunid='+$('#f_servicio').val() );

               }else if(data == 2) {

                    alert('Tiene un mayor Rango de Hora de Tipo G.');

                } else{

                    alert('La suma total de hora es mayor a lo permitido ');  

                }
            });
        }

        init.push(function () {

            $('#reporte').fadeIn("fast").load('reporte.jsp?f_mes='+$('#f_mes').val()+'&f_anio='+$('#f_anio').val()+'&f_codunid='+$('#f_servicio').val()+'&f_nomb=X', function(){ $("#cargando").css("display", "none");});

            $('#f_mes').change(pressMes);
            $('#f_anio').change(pressAnio);
            $('#excel').click(SendToExcel);
            $('#f_servicio').change(pressServicio);

            function SendToExcel(){
                window.open( 'pdf.jsp?f_mes='+$('#f_mes').val()+'&f_unidad='+$('#f_servicio').val()+'&f_anio='+$('#f_anio').val() );
                return false;
            }

            $(document).delegate("#editar_personal","click",function(){
                var id = $(this).attr('name');
                //alert(id);
                $( "#mostrar" ).load( 'editar_cita.jsp?f_codigo='+id+'&f_anio='+$('#f_anio').val()+'&f_mes='+$('#f_mes').val()+'&f_codunid='+$('#f_servicio').val() );
            });

            $(document).delegate("#dar","click",function(){
                $.post('UpdVacaciones.jsp?f_aniow='+$('#f_aniow').val()+'&f_mesw='+$('#f_mesw').val()+'&f_codigow='+$('#f_codigow').val()+'&f_unidadw='+$('#f_unidadw').val()+'&f_del='+$('#f_del').val()+'&f_al='+$('#f_al').val() ,function(data){
                   if(data == 1){

                      //$('#myModal').modal('hide');
                      $( "#mostrar" ).load( 'editar_cita.jsp?f_codigo='+$('#f_codigow').val()+'&f_anio='+$('#f_anio').val()+'&f_mes='+$('#f_mes').val()+'&f_codunid='+$('#f_servicio').val() );

                   }else{

                        alert('Error Ingrese bien los Datos..');  

                    }
                });
            });

            $(document).delegate("#mostrar_personal","click",function(){
                var id2 = $(this).attr('name');
                //alert(id);
                $( "#mostrar" ).load( 'ver_programa.jsp?f_codigo='+id2+'&f_anio='+$('#f_anio').val()+'&f_mes='+$('#f_mes').val()+'&f_codunid='+$('#f_servicio').val() );
            });
/*
            $(document).delegate("#vacaciones","click",function(){
                var cod2 = $(this).attr('name');
                //alert(id);
                $( "#mostrar3" ).load( 'asignar_vacaciones.jsp?f_codigo='+cod2+'&f_anio='+$('#f_anio').val()+'&f_mes='+$('#f_mes').val()+'&f_codunid='+$('#f_codunid').val() );
            });
*/
            $(document).delegate("#f_nomb","keyup",function(){

            $('#reporte').fadeIn("fast").load('reporte.jsp?f_mes='+$('#f_mes').val()+'&f_anio='+$('#f_anio').val()+'&f_codunid='+$('#f_servicio').val()+'&f_nomb='+$('#f_nomb').val(), function(){ $("#cargando").css("display", "none");});

            });

            $(document).delegate("#print_programa","click", function(){
                var cod = $(this).attr('name');
                
                var url = 'mostrar_personal.jsp?f_mes='+$('#f_mes').val()+'&f_anio='+$('#f_anio').val()+'&f_codigo='+cod;
                //var partFields = $("#addPac").serialize();
                window.location.href= url;
            });

            $(document).delegate("#new_personal","click",function(){

                 $( "#mostrar2" ).load( 'add_prog.jsp?f_anio='+$('#f_anio').val()+'&f_mes='+$('#f_mes').val()+'&f_codunid='+$('#f_servicio').val() );
            });

            $(document).delegate("#crear_programacion","click",function(){
            //$('#datos_personal').on('submit', function (){
                $.post("addProg_pac.jsp", $('#datos_personal').serialize() ,function(data){
                   if(data == 1){

                      $('#modal-blurred-bg').modal('hide');
                       $('#reporte').fadeIn("fast").load('reporte.jsp?f_mes='+$('#f_mes').val()+'&f_anio='+$('#f_anio').val()+'&f_codunid='+$('#f_servicio').val()+'&f_nomb=X', function(){ $("#cargando").css("display", "none");});

                   }else if(data == 2) {

                        alert('Ya tiene una Programacion en este Mes..');

                    } else{

                        alert('Error Vuelva a intentar en 5 minutos!!!');                        
                    }
                });

            });

            $(document).delegate("#delete_programa","click",function(){            
                var codd = $(this).attr('name');

                $.post('delete_programa.jsp?f_mes='+$('#f_mes').val()+'&f_anio='+$('#f_anio').val()+'&f_codigo='+codd, function(data){

                   if(data == 1){

                      $('#modal-blurred-bg').modal('hide');
                       $('#reporte').fadeIn("fast").load('reporte.jsp?f_mes='+$('#f_mes').val()+'&f_anio='+$('#f_anio').val()+'&f_codunid='+$('#f_servicio').val()+'&f_nomb=X', function(){ $("#cargando").css("display", "none");});

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
                    $('#reporte').fadeIn("fast").load('reporte.jsp?f_anio='+$('#f_anio').val()+'&f_mes='+vcl+'&f_codunid='+$('#f_servicio').val()+'&f_nomb=X', function(){ $("#cargando").css("display", "none");});

            } 

            function pressServicio(){
                var vcl = $(this).val();
                    $('#ce').hide("fast");
                    $('#co').show("fast");
                    $('#to').attr("selected","selected");
                    $('#tablita').fadeOut("fast");
                    $("#cargando").css("display", "inline");
                    $("#f_nomb").val('');
                    $('#reporte').fadeIn("fast").load('reporte.jsp?f_mes='+$('#f_mes').val()+'&f_anio='+$('#f_anio').val()+'&f_codunid='+vcl+'&f_nomb=X', function(){ $("#cargando").css("display", "none");});

            } 

            function pressAnio(){
                var vcl = $(this).val();
                    $('#ce').hide("fast");
                    $('#co').show("fast");
                    $('#to').attr("selected","selected");
                    $('#tablita').fadeOut("fast");
                    $("#cargando").css("display", "inline");
                    $("#f_nomb").val('');
                    $('#reporte').fadeIn("fast").load('reporte.jsp?f_mes='+$('#f_mes').val()+'&f_anio='+vcl+'&f_codunid='+$('#f_servicio').val()+'&f_nomb=X', function(){ $("#cargando").css("display", "none");});

            }

/*
----------------------------------------------------------------
                    AUTOCOMPLETE -- BOOTSTRAP --
*/   

            $(document).delegate("#f_personal","keydown",function(){
                $("#f_personal").autocomplete({
                    source: function(request, response) {
                        $.ajax({
                            url: 'search5.jsp?f_codunid='+$('#f_servicio').val(),
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
                            url: 'search6.jsp?f_codunid='+$('#f_servicio').val(),
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
// -------------------------------------------------------------------


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

    COMANDO = "  SELECT  CODUNIDADORG "+
                "  FROM  MAESTRO "+
                " WHERE  DNI_ACTUAL = '"+id_personal+"' ";
        rset = stmt.executeQuery(COMANDO);
        //out.print(COMANDO);
    if(rset.next())
    {
        s_codunid = rset.getString("CODUNIDADORG");
    }

%>

<!-- /7. $BOOTSTRAP_DATEPICKER -->
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
                <div class="table-primary">
                    <div align="center"  class="table-header">
                        <div class="table-caption">
                            Programaci&oacute;n de Horas Complementarias
                        </div>
                    </div>

                    <div class="panel-body">
                        
                        <div class="input-daterange input-group" id="bs-datepicker-range">

                            <span class="input-group-addon">Anio</span>
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

                            <span class="input-group-addon">Servicio</span>
                                <select class="input-sm form-control" name="f_servicio" id="f_servicio">
                    <%
                                if( id_personal.equals("10801585") )
                                {
                                    COMANDO = "select  idservdepartunid, "+
                                            "       nombre "+
                                            " from  ServicioDepartUnidad "+
                                            " where tipoadicional = 'C' "+
                                            "order by idservdepartunid ";
                                
                                }else{
                                    COMANDO = "select  idservdepartunid, "+
                                            "       nombre "+
                                            " from  ServicioDepartUnidad "+
                                            " where dniacceso = '"+id_personal+"' "+
                                            "   and tipoadicional = 'C' "+
                                            "order by idservdepartunid ";
                                    
                                }
                                  //out.print(COMANDO);
                                rset = stmt.executeQuery(COMANDO);
                                while(rset.next())
                                {
                    %>
                                    <option value="<%=rset.getString("idservdepartunid")%>"><%=rset.getString("nombre")%></option>
                    <%          }
                    %>
                                </select>

                                <input type="hidden" id="f_codunid" name="f_codunid" value="<%=s_codunid%>"> 
                            <span class="input-group-addon">
                                <a title="Exportar a Excel" href="#" id="excel" style="border-color:#FFF"><img alt="Previsualizar" src="../images/printer.gif" width="17" height="17" /></a>
                            </span>
                        </div>
<!--
                         <div class="input-daterange input-group" id="bs-datepicker-range">
                            <span class="input-group-addon">Busqueda por trabajador</span>
                            <input class="input-sm form-control" type="text" id="f_nomb" name="f_nomb" value=""> 
                        </div>
-->
                    </div>
                </div>

        </div>
    </div>
<div id="cargando" class="cargando" style="display:none; color: red;"><img src="../images/loading.gif" width="20" height="20" /></div>
</table>
<div id="reporte"></div>

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

                <!-- Modal -->
                <div id="myModal2" class="modal fade" tabindex="-1" role="dialog" style="display: none;">
                    <div class="modal-dialog">
                        <div align="center" class="modal-content">
                            <div align="center" class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                                <h4 class="modal-title" id="myModalLabel">Asignar Vacaciones</h4>
                            </div>
                            <div class="modal-body" id="mostrar3" >
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

                <!-- Danger -->
                <div id="uidemo-modals-alerts-danger" class="modal modal-alert modal-danger fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <i class="fa fa-times-circle"></i>
                            </div>
                            <div class="modal-title">Some alert title</div>
                            <div class="modal-body">Some alert text</div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">OK</button>
                            </div>
                        </div> <!-- / .modal-content -->
                    </div> <!-- / .modal-dialog -->
                </div> <!-- / .modal -->
                <!-- / Danger -->

<%@ include file="../menu/pie2.jsp"%>