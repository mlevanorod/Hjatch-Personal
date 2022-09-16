<%@ include file="../menu/cabecera2.jsp"%>


<%
    String  s_id_unidad = request.getParameter("f_id_unidad");
       int  s_id_dep    = 0;

%>
<script >
  init.push(function (){

            $('#reporte').fadeIn("fast").load('reporte.jsp?f_codigo='+$('#f_codigo').val()+'&f_unidad='+$('#f_unidad').val()+'&f_servicio='+$('#f_servicio').val()+'&f_personal='+$('#f_personal').val(), function(){ $("#cargando").css("display", "none");});

            $('#serv').hide();

            $(document).delegate("#f_unidad","change",function(){

                $.post('servicio.jsp?f_unidad='+$('#f_unidad').val() ,function(data){
                    $("#serv").show();
                    $("#f_servicio").html(data);
                    $('#reporte').fadeIn("fast").load('reporte.jsp?f_codigo='+$('#f_codigo').val()+'&f_unidad='+$('#f_unidad').val()+'&f_servicio='+$('#f_servicio').val()+'&f_nomb='+$('#f_nomb').val(), function(){ $("#cargando").css("display", "none");});
                });

            });

            $(document).delegate("#enviar_upd","click",function(){
               // var codd = $(this).attr('name');

                $.post('guardar_serv.jsp?f_codigo='+$('#f_codigo').val()+'&f_servicio='+$('#f_servicio').val()+'&f_unidad='+$('#f_unidad').val()+'&f_personal='+$('#f_personal').val() , function(data){

                   if(data == 1){

                      $.post('servicio.jsp?f_unidad='+$('#f_unidad').val() ,function(data){
                          $("#serv").show();
                          $("#f_servicio").html(data);
                          $('#reporte').fadeIn("fast").load('reporte.jsp?f_codigo='+$('#f_codigo').val()+'&f_unidad='+$('#f_unidad').val()+'&f_servicio='+$('#f_servicio').val()+'&f_nomb='+$('#f_nomb').val(), function(){ $("#cargando").css("display", "none");});
                      });                      

                   }else{

                        alert('Error Vuelva a intentar en 5 minutos!!!');                        
                    }
                });

            });

            $(document).delegate("#delete_personal","click",function(){
              var codd = $(this).attr('name');

                $.post('mod_acceso.jsp?f_servicio='+codd , function(data){

                   if(data == 1){

                      $.post('servicio.jsp?f_unidad='+$('#f_unidad').val() ,function(data){
                          $("#serv").show();
                          $("#f_servicio").html(data);
                          $('#reporte').fadeIn("fast").load('reporte.jsp?f_codigo='+$('#f_codigo').val()+'&f_unidad='+$('#f_unidad').val()+'&f_servicio='+$('#f_servicio').val()+'&f_nomb='+$('#f_nomb').val(), function(){ $("#cargando").css("display", "none");});
                      });


                   }else{

                        alert('Error Vuelva a intentar en 5 minutos!!!');                        
                    }
                });

            });

/*
----------------------------------------------------------------
                    AUTOCOMPLETE -- BOOTSTRAP --
*/   

            $(document).delegate("#f_personal","keydown",function(){
                $("#f_personal").autocomplete({
                    source: function(request, response) {
                        $.ajax({
                            url: 'search5.jsp',
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
                            url: 'search6.jsp',
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

  });

</script>

  <!-- /7. $BOOTSTRAP_DATEPICKER -->
    <div class="row">
      <form id="unidad_organica" name="unidad_organica">
        <div class="col-md-6 col-md-offset-3">
                <div class="table-primary">

                  <div align="center"  class="table-header">
                      <div class="table-caption">
                          ACCESO DE PERSONAL A LA UNIDAD
                      </div>
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
                              "         case "+s_id_dep+" "+
                              "           when IdDepartUnid then 'selected' "+
                              "           else '   ' "+
                              "         end sel, "+
                              "         codigo "+
                              "  FROM   dbo.DepartamentoUnidad "+
                              " WHERE   ACTIVO = 1 "+
                              //"   and   codigo <> '0000' "+
                              //"   and   IdDepartUnid = "+s_id_dep+" "+
                              " ORDER  BY  CODIGO ASC ";
                            out.print(COMANDO);
                        rset  = stmt.executeQuery(COMANDO);
                      while(rset.next())
                      {
              %>
                        <option <%=rset.getString("sel")%> value="<%=rset.getString("IdDepartUnid")%>"><%=rset.getString("Nombre")%></option>
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

                 <div class="form-group">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                  </div>

                  <div class="form-group">
                      <div align="center" class="col-sm-offset-1 col-sm-9">

                          <button type="button" id="enviar_upd" class="btn btn-primary" >Guardar</button>&nbsp;&nbsp;
                          <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>

                      </div>
                  </div>


                </div>



        </div>
      </form>
    </div>

<div id="cargando" class="cargando" style="display:none; color: red;"><img src="../images/loading.gif" width="20" height="20" /></div>

<div id="reporte"><img src="../images/loading.gif" width="20" height="20" /></div>

<%@ include file="../menu/pie2.jsp"%>