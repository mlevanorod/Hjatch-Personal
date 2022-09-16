<%@ include file="../menu/cabecera2.jsp"%>

<!-- Javascript -->

    <script>
        init.push(function () {

            $('#reporte').fadeIn("fast").load('reporte.jsp?f_mes='+$('#f_mes').val()+'&f_unidad=0'+'&f_anio='+$('#f_anio').val()+'&f_id_personal='+$('#f_id_personal').val(), function(){ $("#cargando").css("display", "none");});

            $('#excel').click(SendToExcel);
            $('#f_mes').change(pressMes);
            $('#f_anio').change(pressAnio);
            $('#f_servicio').change(pressServicio);
            $("#f_servicio").hide();

            $(document).delegate("#f_unidad","change",function(){

                $.post('servicio.jsp?f_unidad='+$('#f_unidad').val() ,function(data){
                    $("#f_servicio").show();
                    $("#f_servicio").html(data);
                    $('#reporte').fadeIn("fast").load('reporte.jsp?f_mes='+$('#f_mes').val()+'&f_unidad='+$('#f_servicio').val()+'&f_anio='+$('#f_anio').val()+'&f_id_personal='+$('#f_id_personal').val(), function(){ $("#cargando").css("display", "none");});
                });

            });

            function SendToExcel(){
                window.open( 'pdf.jsp?f_mes='+$('#f_mes').val()+'&f_unidad='+$('#f_servicio').val()+'&f_anio='+$('#f_anio').val()+'&f_id_personal='+$('#f_id_personal').val() );
                return false;
            }

            $(document).delegate("#click_personal","click",function(){
                var id = $(this).attr('name');
                //alert(id);
                $( "#mostrar2" ).load( 'acepta_personal.jsp?f_id_personal='+id+'&f_mes='+$('#f_mes').val()+'&f_unidad='+$('#f_servicio').val()+'&f_anio='+$('#f_anio').val() );
            });

            $(document).delegate("#click_director","click",function(){
                var id = $(this).attr('name');
                //alert(id);
                $( "#mostrar3" ).load( 'acepta_director.jsp?f_id_personal='+id+'&f_mes='+$('#f_mes').val()+'&f_unidad='+$('#f_servicio').val()+'&f_anio='+$('#f_anio').val() );
            });

            $(document).delegate("#editar_personal","click",function(){
                var idp = $(this).attr('name');
                $( "#mostrar" ).load( 'editar_cita.jsp?f_codigo='+idp+'&f_anio='+$('#f_anio').val()+'&f_mes='+$('#f_mes').val() );
            });

            $(document).delegate("#mostrar_personal","click",function(){
                var codd2 = $(this).attr('name');
              //  alert(codd2);
                $( "#mostrar" ).load( 'ver_programa.jsp?f_codigo='+codd2+'&f_anio='+$('#f_anio').val()+'&f_mes='+$('#f_mes').val() );
            });

            $(document).delegate("#dia","change",function(){

                $.post("UpdProgramacion.jsp", $('#editar_programacion').serialize() ,function(data){
                   if(data == 1){

                      //$('#myModal').modal('hide');
                      $( "#mostrar" ).load( 'editar_cita.jsp?f_codigo='+$('#f_codigow').val()+'&f_anio='+$('#f_anio').val()+'&f_mes='+$('#f_mes').val()+'&f_codunid='+$('#f_codunid').val() );

                   }else if(data == 2) {

                        alert('Tiene un mayor Rango de Hora de Tipo G.');

                    } else{

                        alert('La suma total de hora es mayor a lo permitido ');  

                    }
                });

            });

            $(document).delegate("#enviar_upd","click",function(){

                $.post("UpdProgramacion.jsp", $('#editar_programacion').serialize() ,function(data){
                   if(data == 1){

                      $('#myModal').modal('hide');
                      $('#reporte').fadeIn("fast").load('reporte.jsp?f_mes='+$('#f_mes').val()+'&f_unidad='+$('#f_servicio').val()+'&f_anio='+$('#f_anio').val()+'&f_id_personal='+$('#f_id_personal').val(), function(){ $("#cargando").css("display", "none");});

                   }else if(data == 2) {

                        alert('Tiene un mayor Rango de Hora de Tipo G.');

                    } else{

                        alert('La suma total de hora es mayor a lo permitido ');  

                    }
                });

            });

            $(document).delegate("#aceptar_rol","click",function(){

                $.post("aceptar_rol.jsp", $('#aceptar_roles').serialize() ,function(data){
                   if(data == 1){

                      $('#modal-blurred-bg2').modal('hide');
                      $('#reporte').fadeIn("fast").load('reporte.jsp?f_mes='+$('#f_mes').val()+'&f_unidad='+$('#f_servicio').val()+'&f_anio='+$('#f_anio').val()+'&f_id_personal='+$('#f_id_personal').val(), function(){ $("#cargando").css("display", "none");});

                   }else if(data == 2) {

                        alert('Clave Incorrecta..');

                    } else{

                        alert('Ese Usuario no tiene permiso a este Proceso!!!');  

                    }
                });

            });

            $(document).delegate("#aceptar_rol2","click",function(){

                $.post("aceptar_roles.jsp", $('#aceptar_roles2').serialize() ,function(data){
                   if(data == 1){

                      $('#modal-blurred-bg3').modal('hide');
                      $('#reporte').fadeIn("fast").load('reporte.jsp?f_mes='+$('#f_mes').val()+'&f_unidad='+$('#f_servicio').val()+'&f_anio='+$('#f_anio').val()+'&f_id_personal='+$('#f_id_personal').val(), function(){ $("#cargando").css("display", "none");});

                   }else if(data == 2) {

                        alert('Clave Incorrecta..');

                    } else{

                        alert('Ese Usuario no tiene permiso a este Proceso!!!');  

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
                    $('#reporte').fadeIn("fast").load('reporte.jsp?f_anio='+$('#f_anio').val()+'&f_unidad='+$('#f_servicio').val()+'&f_mes='+vcl+'&f_id_personal='+$('#f_id_personal').val(), function(){ $("#cargando").css("display", "none");});
            }

            function pressServicio(){
                var vcl = $(this).val();
                    $('#ce').hide("fast");
                    $('#co').show("fast");
                    $('#to').attr("selected","selected");
                    $('#tablita').fadeOut("fast");
                    $("#cargando").css("display", "inline");
                    $("#f_nomb").val('');
                    $('#reporte').fadeIn("fast").load('reporte.jsp?f_anio='+$('#f_anio').val()+'&f_unidad='+vcl+'&f_mes='+$('#f_mes').val()+'&f_id_personal='+$('#f_id_personal').val(), function(){ $("#cargando").css("display", "none");});
            } 

            function pressAnio(){
                var vcl = $(this).val();
                    $('#ce').hide("fast");
                    $('#co').show("fast");
                    $('#to').attr("selected","selected");
                    $('#tablita').fadeOut("fast");
                    $("#cargando").css("display", "inline");
                    $("#f_nomb").val('');
                    $('#reporte').fadeIn("fast").load('reporte.jsp?f_mes='+$('#f_mes').val()+'&f_unidad='+$('#f_servicio').val()+'&f_anio='+vcl+'&f_id_personal='+$('#f_id_personal').val(), function(){ $("#cargando").css("display", "none");});
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
                            REPORTE DE ROL DE GUARDIAS
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
                                //  out.print(COMANDO3);
                                rset3 = stmt3.executeQuery(COMANDO3);
                                while(rset3.next())
                                {
                    %>
                                    <option <%=rset3.getString("SEL_MES")%> value="<%=rset3.getString("mes")%>"><%=rset3.getString("nombre")%></option>
                    <%          }
                    %>
                                </select>

                            <span class="input-group-addon"> Unidad </span>
                                <select class="input-sm form-control" name="f_unidad" id="f_unidad">
                    <%
                                COMANDO = "select    IdDepartUnid, "+
                                            "        Codigo, "+
                                            "        Nombre, "+
                                            "        Tipo   "+
                                            " from   DepartamentoUnidad "+
                                            //" where CODIGO not in (0221,0380,0202,0290,0320,0100,0201,0150,0120,0171,0231,0340,0233,0235,0234,0382,0383,0294,0384,0193,0210,0130,0160) "+
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

                            <span class="input-group-addon"> Servicio </span>
                                <select class="input-sm form-control" name="f_servicio" id="f_servicio">
                                  

                                </select>

                                <input type="hidden" id="f_id_personal" name="f_id_personal" value="<%=id_personal%>">
                            <span class="input-group-addon">
                                <a title="Exportar a Excel" href="#" id="excel" style="border-color:#FFF"><img alt="Exportar a excel" src="../images/printer.gif" width="17" height="17" /></a>
                            </span>
                        </div>
                        
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

                <!-- Template -->
                <div id="modal-blurred-bg2" class="modal fade modal-blur" tabindex="-1" role="dialog" style="display: none;">
                    <div class="modal-dialog modal-sm">
                        <div  class="modal-content">
                            <div align="center" class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">x</button>
                                <h4 class="modal-title">VALIDAR LA ACEPTACION DE ROLES</h4>
                            </div>
                            <div class="modal-body" id="mostrar2">
                               <img src="../images/loading.gif" width="20" height="20" />
                            </div> <!-- / .modal-body -->
                        </div> <!-- / .modal-content -->
                    </div> <!-- / .modal-dialog -->
                </div> <!-- / .modal -->
                <!-- / Template -->

                <!-- Template -->
                <div id="modal-blurred-bg3" class="modal fade modal-blur" tabindex="-1" role="dialog" style="display: none;">
                    <div class="modal-dialog modal-sm">
                        <div  class="modal-content">
                            <div align="center" class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">x</button>
                                <h4 class="modal-title">VALIDAR LA ACEPTACION DE ROLES</h4>
                            </div>
                            <div class="modal-body" id="mostrar3">
                               <img src="../images/loading.gif" width="20" height="20" />
                            </div> <!-- / .modal-body -->
                        </div> <!-- / .modal-content -->
                    </div> <!-- / .modal-dialog -->
                </div> <!-- / .modal -->
                <!-- / Template -->

<%@ include file="../menu/pie2.jsp"%>