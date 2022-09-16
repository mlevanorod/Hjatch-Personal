<%@ include file="../menu/cabecera2.jsp"%>

    <script>
        init.push(function () {

            $('#reporte').fadeIn("fast").load('reporte.jsp?f_anio='+$('#f_anio').val()+'&f_mes='+$('#f_mes').val()+'&f_turno='+$('#f_turno').val()+'&f_tipo='+$('#f_tipo').val(), function(){ $("#cargando").css("display", "none");});

            $('#f_turno').change(pressTurno);
            $('#f_tipo').change(pressTipo);

            $(document).delegate("#pdf", "click", function(){
                window.open( 'pdf.jsp?f_anio='+$('#f_anio').val()+'&f_mes='+$('#f_mes').val()+'&f_turno='+$('#f_turno').val()+'&f_tipo='+$('#f_tipo').val() );
                return false;
            });

            $('#f_mes').change(pressMes);
            $('#f_anio').change(pressAnio);

            function pressTurno(){
                var vcl = $(this).val();
                    $('#ce').hide("fast");
                    $('#co').show("fast");
                    $('#to').attr("selected","selected");
                    $('#tablita').fadeOut("fast");
                    $("#cargando").css("display", "inline");
                    $('#reporte').fadeIn("fast").load('reporte.jsp?f_anio='+$('#f_anio').val()+'&f_mes='+$('#f_mes').val()+'&f_turno='+vcl+'&f_tipo='+$('#f_tipo').val(), function(){ $("#cargando").css("display", "none");});
            }

            function pressTipo(){
                var vcl = $(this).val();
                    $('#ce').hide("fast");
                    $('#co').show("fast");
                    $('#to').attr("selected","selected");
                    $('#tablita').fadeOut("fast");
                    $("#cargando").css("display", "inline");
                    $('#reporte').fadeIn("fast").load('reporte.jsp?f_anio='+$('#f_anio').val()+'&f_mes='+$('#f_mes').val()+'&f_tipo='+vcl+'&f_turno='+$('#f_turno').val(), function(){ $("#cargando").css("display", "none");});
            }

            function pressMes(){
                var vcl = $(this).val();
                    $('#ce').hide("fast");
                    $('#co').show("fast");
                    $('#to').attr("selected","selected");
                    $('#tablita').fadeOut("fast");
                    $("#cargando").css("display", "inline");
                    $('#reporte').fadeIn("fast").load('reporte.jsp?f_anio='+$('#f_anio').val()+'&f_mes='+vcl+'&f_turno='+$('#f_turno').val()+'&f_tipo='+$('#f_tipo').val(), function(){ $("#cargando").css("display", "none");});
            }

            function pressAnio(){
                var vcl = $(this).val();
                    $('#ce').hide("fast");
                    $('#co').show("fast");
                    $('#to').attr("selected","selected");
                    $('#tablita').fadeOut("fast");
                    $("#cargando").css("display", "inline");
                    $('#reporte').fadeIn("fast").load('reporte.jsp?f_mes='+$('#f_mes').val()+'&f_anio='+vcl+'&f_turno='+$('#f_turno').val()+'&f_tipo='+$('#f_tipo').val(), function(){ $("#cargando").css("display", "none");});
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
                            Reporte de Nutricional
                        </div>
                    </div>
                        
                        <div class="input-daterange input-group" id="bs-datepicker-range">
                            <span class="input-group-addon">Anio</span>
                                <select  class=" form-control" name="f_anio" id="f_anio">
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
                                <select class=" form-control" name="f_mes" id="f_mes">
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
                            <span class="input-group-addon">Turno</span>
                                <select class=" form-control" name="f_turno" id="f_turno">

                                    <option  value="D">DESAYUNO</option>
                                    <option  value="A">ALMUERZO</option>
                                    <option  value="C">CENA</option>

                                </select>
                            <span class="input-group-addon">Tipo</span>
                                <select class=" form-control" name="f_tipo" id="f_tipo">

                                    <option  value="N">NORMAL</option>
                                    <option  value="T">TERAPEUTICO</option>

                                </select>
                            <span class="input-group-addon">
                                <a href="#" id="pdf" title="Exportar a Pdf" style="border-color:#FFF">
                                    <img src="../images/pdf.png" width="20" height="20">
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