<%@ include file="../menu/cabecera2.jsp"%>

<!-- Javascript -->

	<script>

        function myFunction(num) {

            $.post('UpdProgramacion.jsp?f_dia='+num+'&f_aniow='+$('#f_aniow').val()+'&f_mesw='+$('#f_mesw').val()+'&f_codigow='+$('#f_codigow').val()+'&f_unidadw='+$('#f_unidadw').val()+'&f_dato='+$('#dia_'+num).val() ,function(data){
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

        function asignar_actividad(dia, cod_act)
        {
            //var cod = $(this).attr('name');
            //alert(cod_act);
            $( "#mostrar4" ).load( 'asignar_actividad.jsp?f_codigo='+cod_act+'&f_anio='+$('#f_anio').val()+'&f_mes='+$('#f_mes').val()+'&f_dia='+dia+'&f_servicio='+$('#f_servicio').val() );
        }


		init.push(function () {

			$('#reporte').fadeIn("fast").load('reporte.jsp?f_mes='+$('#f_mes').val()+'&f_unidad='+$('#f_servicio').val()+'&f_anio='+$('#f_anio').val()+'&f_id_personal='+$('#f_id_personal').val(), function(){ $("#cargando").css("display", "none");});

			$('#excel').click(SendToExcel);
			$('#print').click(SendToPrint);
            $('#f_mes').change(pressMes);
            $('#f_anio').change(pressAnio);
            $('#f_servicio').change(pressUnidad);

            function SendToExcel(){
                window.open( 'pdf'+$('#f_servicio').val()+'.jsp?f_mes='+$('#f_mes').val()+'&f_unidad='+$('#f_servicio').val()+'&f_anio='+$('#f_anio').val()+'&f_id_personal='+$('#f_id_personal').val() );
                return false;
            }

            function SendToPrint(){
                window.open( 'print.jsp?f_mes='+$('#f_mes').val()+'&f_unidad='+$('#f_servicio').val()+'&f_anio='+$('#f_anio').val()+'&f_id_personal='+$('#f_id_personal').val() );
                return false;
            }

            $(document).delegate("#f_NI", "click", function(){
                //alert('AAA');
                $('#NI').toggle('slow');
            });

            $(document).delegate("#f_NIP", "click", function(){
                //alert('AAA');
                $('#NIP').toggle('slow');
            });

            $(document).delegate("#f_MED", "click", function(){
                //alert('AAA');
                $('#MED').toggle('slow');
            });

            $(document).delegate("#f_PEM", "click", function(){
                //alert('AAA');
                $('#PEM').toggle('slow');
            });

            $(document).delegate("#f_CIR", "click", function(){
                //alert('AAA');
                $('#CIR').toggle('slow');
            });

            $(document).delegate("#f_GIN", "click", function(){
                //alert('AAA');
                $('#GIN').toggle('slow');
            });

            $(document).delegate("#f_PF", "click", function(){
                //alert('AAA');
                $('#PF').toggle('slow');
            });

            $(document).delegate("#f_NEO", "click", function(){
                //alert('AAA');
                $('#NEO').toggle('slow');
            });

            $(document).delegate("#f_TRA", "click", function(){
                //alert('AAA');
                $('#TRA').toggle('slow');
            });

            $(document).delegate("#f_UCI", "click", function(){
                //alert('AAA');
                $('#UCI').toggle('slow');
            });

            $(document).delegate("#f_EM", "click", function(){
                //alert('AAA');
                $('#EM').toggle('slow');
            });

            $(document).delegate("#f_COB", "click", function(){
                //alert('AAA');
                $('#COB').toggle('slow');
            });

            $(document).delegate("#f_FP", "click", function(){
                //alert('AAA');
                $('#FP').toggle('slow');
            });
            $(document).delegate("#f_CON", "click", function(){
                //alert('AAA');
                $('#CON').toggle('slow');
            });
            $(document).delegate("#f_PSE", "click", function(){
                //alert('AAA');
                $('#PSE').toggle('slow');
            });
            $(document).delegate("#f_HME", "click", function(){
                //alert('AAA');
                $('#HME').toggle('slow');
            });
            $(document).delegate("#f_HPE", "click", function(){
                //alert('AAA');
                $('#HPE').toggle('slow');
            });
            $(document).delegate("#f_HGO", "click", function(){
                //alert('AAA');
                $('#HGO').toggle('slow');
            });
            $(document).delegate("#f_HCT", "click", function(){
                //alert('AAA');
                $('#HCT').toggle('slow');
            });
            $(document).delegate("#f_CQ", "click", function(){
                //alert('AAA');
                $('#CQ').toggle('slow');
            });
            $(document).delegate("#f_PC", "click", function(){
                //alert('AAA');
                $('#PC').toggle('slow');
            });
            $(document).delegate("#f_CS", "click", function(){
                //alert('AAA');
                $('#CS').toggle('slow');
            });
            $(document).delegate("#f_ADM", "click", function(){
                //alert('AAA');
                $('#ADM').toggle('slow');
            });
            $(document).delegate("#f_OTR", "click", function(){
                //alert('AAA');
                $('#OTR').toggle('slow');
            });
            $(document).delegate("#f_HCI", "click", function(){
                //alert('AAA');
                $('#HCI').toggle('slow');
            });
            $(document).delegate("#f_HGI", "click", function(){
                //alert('AAA');
                $('#HGI').toggle('slow');
            });
            $(document).delegate("#f_HNE", "click", function(){
                //alert('AAA');
                $('#HNE').toggle('slow');
            });
            $(document).delegate("#f_HTR", "click", function(){
                //alert('AAA');
                $('#HTR').toggle('slow');
            });
            $(document).delegate("#f_EME", "click", function(){
                //alert('AAA');
                $('#EME').toggle('slow');
            });
            $(document).delegate("#f_PRO", "click", function(){
                //alert('AAA');
                $('#PRO').toggle('slow');
            });


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

            $(document).delegate("#enviar_upd","click",function(){


                    $('#myModal').modal('hide');
                    $('#reporte').fadeIn("fast").load('reporte.jsp?f_mes='+$('#f_mes').val()+'&f_unidad='+$('#f_servicio').val()+'&f_anio='+$('#f_anio').val()+'&f_id_personal='+$('#f_id_personal').val(), function(){ $("#cargando").css("display", "none");});
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

            $(document).delegate("#acpt_actividad", "click", function(){

                $.post("aceptar_actividad.jsp", $('#aceptar_actividad2').serialize() ,function(data){
                    if(data == 1)
                    {
                        $('#modal-sizes-2').modal('hide');
                        $('#reporte').fadeIn("fast").load('reporte.jsp?f_mes='+$('#f_mes').val()+'&f_unidad='+$('#f_servicio').val()+'&f_anio='+$('#f_anio').val()+'&f_id_personal='+$('#f_id_personal').val(), function(){ $("#cargando").css("display", "none");});
                    }else{
                        alert('Error vuelva a intentar en 5 minutos!! ');
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

            function pressUnidad(){
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

    COMANDO = "SELECT   CODUNIDADORG "+
              "  FROM  MAESTRO "+
              " WHERE  DNI_ACTUAL = '"+id_personal+"' ";
              //" WHERE  DNI_ACTUAL = '44151676' ";
        rset = stmt.executeQuery(COMANDO);
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
                            INFORME DE ACTIVIDADES
                        </div>
                    </div>

                    <div class="panel-body">

                        <div class="input-daterange input-group" id="bs-datepicker-range">

                            <span class="input-group-addon">
								<a title="Imprimir Rol Actividad" href="#" id="print" style="border-color:#FFF"><img alt="Exportar a Excel" src="../images/excel.png" width="17" height="17" /></a>
							</span>

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
                                //  out.print(COMANDO3);
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
                                    COMANDO = "  select     idservdepartunid, "+
                                                "           nombre "+
                                                "  from     ServicioDepartUnidad "+
                                                " where     dniacceso = '"+id_personal+"' "+
                                                "    or     DniAcceso_act = '"+id_personal+"' "+
                                                "order by idservdepartunid ";
                                    //  out.print(COMANDO);
                                    rset = stmt.executeQuery(COMANDO);
                                    while(rset.next())
                                    {
                        %>
                                        <option value="<%=rset.getString("idservdepartunid")%>"><%=rset.getString("nombre")%></option>
                        <%          }
                        %>
                                    </select>

                                <input type="hidden" name="f_unidad" id="f_unidad" value="<%=s_codunid%>">
                                <input type="hidden" id="f_id_personal" name="f_id_personal" value="<%=id_personal%>">
                            <span class="input-group-addon">
								<a title="Imprimir Actividades" href="#" id="excel" style="border-color:#FFF"><img alt="Imprimir Actividades" src="../images/printer.gif" width="17" height="17" /></a>
							</span>
                        </div>
                        
                    </div>
                </div>

        </div>
    </div>
<div id="cargando" class="cargando" align="center" style="display:none; color: red;"><img src="../images/loading.gif" width="40" height="40" /></div>
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


                <!-- Large modal -->
                <div id="modal-sizes-2" class="modal fade" tabindex="-1" role="dialog" style="display: none;">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                                <h4 class="modal-title" align="center"> <font size="4"><b>SELECCIONAR ACTIVIDADES </b></font> </h4>
                            </div>
                            <div class="modal-body" id="mostrar4">
                                <img src="../images/loading.gif" width="20" height="20" />
                            </div>
                        </div> <!-- / .modal-content -->
                    </div> <!-- / .modal-dialog -->
                </div> <!-- / .modal -->
                <!-- / Large modal -->


<%@ include file="../menu/pie2.jsp"%>