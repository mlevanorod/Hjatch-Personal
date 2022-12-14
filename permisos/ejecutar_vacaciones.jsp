<%@ include file="../menu/cabecera2.jsp"%>


<%@ page contentType="text/html; charset=ISO-8859-1" %>
    <script>
        init.push(function () {

            $('#f_fecha_fin').datepicker({
                dateFormat: "dd/mm/yyyy"

            });

            $('#f_fecha_ini').datepicker({
                dateFormat: "dd/mm/yyyy"

            });         

            $(document).delegate("#enviar_upd","click",function(){
                var id = $('#f_id_licencia').val();
                if ($(this).valid()) {
                    $.post("addvacaciones.jsp", $('#editar_programacion').serialize() ,function(data){
                       if(data == 1){
                        
                        window.location.href = 'vacaciones.jsp?f_anio='+$('#f_anio').val()+'&f_codigo='+id;

                       }else{

                            alert('Error Vuelva a intentar en 5 minutos!!!');  

                        }
                    });
                }
            });      

            $(document).delegate("#ejecutar","click",function(){
                var id = $(this).attr('name');
                window.location.href = 'ejecutar_vacaciones.jsp?f_anio='+$('#f_anio').val()+'&f_id='+id;
            });            

            $(document).delegate("#eliminar_cita","click",function(){
                var codigo  = $('#f_id_licencia').val();
                var id      = $(this).attr('name');
                $.post("delete_vacaciones.jsp?f_id_licencia="+id+"&f_codigo="+codigo, function(data){
                   if(data == 1){
                      $.growl.notice({ message: "Vacaciones eliminada!" });
                      window.location.href = 'vacaciones.jsp?f_anio='+$('#f_anio').val()+'&f_codigo='+codigo;
                   }else {
                        alert('Error Vuelva a ingresar');
                    } 

                });

            });                  

        });


    </script>

<%
    String  s_id        =   request.getParameter("f_id");
    String  s_anio      =   request.getParameter("f_anio");
    String  s_mes       =   "";
    String  mes         =   "";
    int     e           =   0;
    int     cont        =   0;
    double  cant        =   0.00;
    String  dni         =   "";
    String  nombre      =   "";
    String  unidad      =   "";
    String  cargo       =   "";
    String  cod         =   "";
    String  situacion   =   "";
    String  tipo        =   "";
    String s_fechact    =   "";
    String  diasSemana[] = new String[17]; 

    String  anio   = new String("A??O".getBytes("ISO-8859-1"),"UTF-8");
            
            diasSemana[1] = "Lunes";
            diasSemana[2] = "Martes";
            diasSemana[3] = "Mi&eacute;rcoles";
            diasSemana[4] = "Jueves";
            diasSemana[5] = "Viernes";
            diasSemana[6] = "S&aacute;bado";
            diasSemana[7] = "Domingo";

    //out.print(s_id_cita);
    
    COMANDO = "SELECT   DNI_ACTUAL AS DNI, "+
                "       NOMBRE, "+
                "       DBO.COD_UNIDAD(CODUNIDADORG) AS UNIDAD_ORGANICA, "+
                "       DATENAME(month, getdate() ) as mes, "+
                "       CODFUNCION AS CARGO_FUNCIONAL, "+
                "       SITUACION AS SITUACION_LABORAL, "+
                "       CONVERT(VARCHAR(10), SYSDATETIME(), 103) fechact    "+
                "  FROM MAESTRO "+
                " WHERE CODIGO = '"+s_id+"' ";
        out.print(COMANDO);
        rset = stmt.executeQuery(COMANDO);
        if(rset.next())
        {
            dni             = rset.getString("DNI");
            nombre          = rset.getString("NOMBRE");
            mes             = rset.getString("mes");
            unidad          = rset.getString("UNIDAD_ORGANICA");
            cargo           = rset.getString("CARGO_FUNCIONAL");
            situacion       = rset.getString("SITUACION_LABORAL");
            s_fechact           = rset.getString("fechact");
        }   

    COMANDO3 = " SELECT     MES, NOMBRE "+
                " FROM  MES "+
                " WHERE MES = month(GETDATE()) ";

        rset3 = stmt3.executeQuery(COMANDO3);
        if(rset3.next())
        {
            mes = rset3.getString("nombre");
        }

%>

<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <!-- Primary table -->
        <div align="center"  class="table-header">
            <div class="table-caption">
                Vacaciones del Personal
            </div>
        </div>      
        <div id="cont">
            <form name="editar_programacion" id="editar_programacion">

                <div align="center" class="form-group">
                    <div class="input-group" align="center">
                        <span class="input-group-addon"><%=anio%></span>
                            <input type="text" name="f_anio3" class="form-control" disabled id="f_anio3" value="<%=s_anio%>">

                    </div>
                </div>

                <div align="center" class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon">
                            <a href="index.jsp?f_anio=<%=s_anio%>&f_mes=<%=s_mes%>"> << Atras </a>
                        </span>
                        <span class="input-group-addon">Trabajador:</span>
                        <input type="text" disabled class="form-control" value ="<%=nombre%>">
                    </div>
                </div>

                <div align="center" class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon">Unidad Organica:</span>
                        <input type="text" disabled class="form-control" value ="<%=unidad%>">      
                    </div>
                </div>

                <div align="center" class="form-group">

                    <div class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">Desde:</span>
                        <input type="text" class="form-control" id="f_fecha_ini" name="f_fecha_ini" placeholder="<%=s_fechact%>" value="<%=s_fechact%>">        
                        <span></span>
                        <span class="input-group-addon">Hasta:</span>
                        <input type="text" class="form-control" id="f_fecha_fin" name="f_fecha_fin" placeholder="<%=s_fechact%>" value="<%=s_fechact%>">        
                    </div>          

                
                </div>     

                <div align="center" class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon">Tipo Vacaciones:</span>
                        <select  class="input-sm form-control" name="f_tipo_licencia" id="f_tipo_licencia">
                            <option value="1">Cantidad Horas Laborable</option>
                            <option value="2">Cantidad Horas Nulas</option>
                        </select>   
                    </div>          
                </div>   

                <div align="center" class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon">Observacion:</span>
                        <input type="text" class="form-control" id="f_observacion" name="f_observacion" >       
                    </div>          
                </div>             

                <div align="center" class="form-group">
                    <div align="center" class="col-sm-offset-1 col-sm-9">
                        <input type="hidden" name="f_mes" id="f_mes" value="<%=s_mes%>"> 
                        <input type="hidden" name="f_anio" id="f_anio" value="<%=s_anio%>">
                        <input type="hidden" name="f_id_vacaciones" id="f_id_vacaciones" value="<%=s_id%>"> 
                        <button type="button" id="enviar_upd" class="btn btn-primary" >Guardar</button>&nbsp;&nbsp;
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>

                    </div>
                </div>

                    <div class="table-primary">
                        <div align="center"  class="table-header">
                            <div class="table-caption">
                                Vacaciones Programados
                            </div>
                        </div>     
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>
                                        <div align="center" class="table-caption">
                                        #
                                    </div>
                                    </th>
                                    <th>
                                        <div align="center" class="table-caption">
                                        CODIGO
                                    </div>
                                    </th>                   
                                    <th>
                                        <div align="center" class="table-caption">
                                        DESDE
                                    </div>
                                    </th>           
                                    <th>
                                        <div align="center" class="table-caption">
                                        HASTA
                                    </div>
                                    </th>           
                                    <th>
                                        <div align="center" class="table-caption">
                                        DIAS    
                                        </div>
                                    </th>
                                    <th>
                                        <div align="center" class="table-caption">
                                        ESTADO
                                        </div>
                                    </th>
                                    <th>
                                        <div align="center" class="table-caption">
                                        TIPO
                                        </div>
                                    </th>
                                    <th>
                                        <div align="center" class="table-caption">
                                        REFERENCIA
                                        </div>
                                    </th>
                                    <th>
                                        <div align="center" class="table-caption">
                                            Opcion
                                        </div>
                                    </th>                           
                                </tr>
                            </thead>
                            <tbody>
        <%  
                        COMANDO = "SELECT       [id] "+
                                        "      ,[CODIGO] "+
                                        "      ,CONVERT(VARCHAR(10), DESDE, 103) as DESDE "+
                                        "      ,CONVERT(VARCHAR(10), HASTA, 103) as HASTA "+
                                        "      ,[DIAS] "+
                                        "      ,[ESTADO] "+
                                        "      ,[CUENTA] "+
                                        "      ,[CODORDEN] "+
                                        "      ,[REFERENCIA] "+
                                        "      ,[NUMPOSTERGA] "+
                                        "      , CASE TIPO   "+
                                        "           WHEN '1' THEN 'H. LABORABLES'      "+
                                        "           WHEN '2' THEN 'H. NULAS'      "+
                                        "           ELSE '---' "+
                                        "         END TIPO  "+
                                        "      ,[ANO] "+
                                    "  FROM     VACACIONES "+
                                    " where     Codigo = '"+s_id+"' "+
                                    "   AND     ANO = '"+s_anio+"' ";
                        rset = stmt.executeQuery(COMANDO);
                        while(rset.next())
                        {  e++;
                            cont = cont + rset.getInt("dias");
        %>                      
                                <tr>
                                    <td>
                                        <div align="center" class="table-caption">
                                            <%=e%>
                                        </div>
                                    </td>
                                    <td>
                                        <div align="center" class="table-caption">
                                            <%=rset.getString("codigo")%>
                                        </div>
                                    </td>    
                                    <td>
                                        <div align="center" class="table-caption">
                                            <%=rset.getString("desde")%>
                                        </div>
                                    </td>           
                                    <td>
                                        <div align="center" class="table-caption">
                                            <%=rset.getString("hasta")%>
                                        </div>
                                    </td>
                                    <td>
                                        <div align="center" class="table-caption">
                                            <%=rset.getString("DIAS")%>
                                        </div>
                                    </td>
                                    <td>
                                        <div align="center" class="table-caption">
                                            <%=rset.getString("ESTADO")%>
                                        </div>
                                    </td>
                                    <td>
                                        <div align="center" class="table-caption">
                                            <%=rset.getString("TIPO")%>
                                        </div>
                                    </td>
                                    <td>
                                        <div align="center" class="table-caption">
                                            <%=rset.getString("REFERENCIA")%>
                                        </div>
                                    </td>       
                                    
                                    <td>
                                        <div align="center" class="table-caption">
                                            &nbsp;<a href="#" title="Click para Ejecutar Vacaciones" name='<%=rset.getString("id")%>' id="ejecutar" data-toggle="modal" data-target="#modal-blurred-bg" >[ <img src="../images/check_calendar.png" width="15" height="15"> ] </a>&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;<a href="#" title="Click para Eliminar Vacaciones" name='<%=rset.getString("id")%>' id="eliminar_cita" data-toggle="modal" data-target="#modal-blurred-bg" >[ <img src="../images/deleted.gif" width="15" height="15"> ] </a>&nbsp;
                                        </div>
                                    </td>                           
                                </tr>
        <%              }
        %>                      
                                <tr>
                                    <td colspan="4">
                                        <div align="center" class="table-caption">
                                            <strong>TOTAL DIAS</strong>
                                        </div>
                                    </td>
                                    <td >
                                        <div align="center" class="table-caption">
                                            <strong><%=cont%></strong>
                                        </div>
                                    </td>                                    
                                </tr>
                            </tbody>
                        </table>
                    </div>

                <div class="table-primary">

                    <table align="center">
                        <thead>
                            <tr>
                                <th colspan="7">
                                    <div align="center" class="table-header">
                                        <div class="table-caption">
                                            <%=s_anio%> <br>
                                            <%=mes%>
                                        </div>
                                    </div>
                                </th>                       
                            </tr>
                            <tr>

                                <th>
                                    <div align="center" class="table-caption">
                                        Lunes
                                    </div>
                                </th>
                                <th>
                                    <div align="center" class="table-caption">
                                        Martes
                                    </div>
                                </th>
                                <th>
                                    <div align="center" class="table-caption">
                                        Miercoles
                                    </div>
                                </th>
                                <th>
                                    <div align="center" class="table-caption">
                                        Jueves
                                    </div>
                                </th>
                                <th>
                                    <div align="center" class="table-caption">
                                        Viernes
                                    </div>
                                </th>
                                <th>
                                    <div align="center" class="table-caption">
                                        Sabado
                                    </div>
                                </th>
                                <th>
                                    <div align="center" class="table-caption">
                                        Domingo
                                    </div>
                                </th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
        <%
            e=0;
                        COMANDO = "SELECT "+
                                    //"     CODACT, "+
                                    "       CASE 'V' "+
                                    "           WHEN [dbo].[VACACIONES_NEW] ("+anio+",MES,DIA,CODIGO) THEN 'V' "+
                                    "           ELSE CASE MIN_ADIC  "+
                                    "                   WHEN '0' THEN CODACT  "+
                                    "                   ELSE '  C  '  "+
                                    "                 END "+
                                    "        END CODACT,  "+
                                    "       CASE 'V' "+
                                    "           WHEN [dbo].[VACACIONES_NEW] ("+anio+",MES,DIA,CODIGO) THEN '#c0c0c0' "+
                                    "           ELSE CASE CODACT  "+
                                    "                   WHEN 'D' THEN '#FF0000' "+
                                    "                   ELSE '#0000FF'  "+
                                    "                 END "+
                                    "        END CODACT_COLOR,  "+ 
                                    "       right( '00' + cast( DIA AS varchar(2)), 2 ) as DIA, "+
                                    "       MES, "+
                                    "       "+anio+", "+
                                    "       right( '00' + cast( DIA AS varchar(2)), 2 ) + '/' + CONVERT(varchar(2), MES) + '/' +  CONVERT(varchar(4), "+anio+") AS DAN, "+
                                    "       DATENAME(weekday, (right( '00' + cast( DIA AS varchar(2)), 2 ) + '/' + CONVERT(varchar(2), MES) + '/' +  CONVERT(varchar(4), "+anio+"))) as DIASEMANA,"+
                                    "       DATEPART(dw, (right( '00' + cast( DIA AS varchar(2)), 2 ) + '/' + CONVERT(varchar(2), MES) + '/' +  CONVERT(varchar(4), "+anio+")) ) as NUMSEMANA, "+
                                    "       CASE MIN_ADIC "+
                                    "               WHEN '0' THEN CONVERT(VARCHAR(5), HORAI,108)  "+
                                    "               ELSE '&nbsp;&nbsp;' "+
                                    "        END HORAI, "+
                                    //"     CONVERT(VARCHAR(5), HORAI,108) as HORAI, "+
                                    "       CASE MIN_ADIC "+
                                    "               WHEN '0' THEN CONVERT(VARCHAR(5), HORAS,108)  "+
                                    "               ELSE '&nbsp;&nbsp;' "+
                                    "        END HORAS, "+
                                    //"     CONVERT(VARCHAR(5), HORAS,108) as HORAS, "+
                                    "       rtrim(TIPO) AS TIPO "+
                                    "  FROM ASISTENCIA "+
                                    " WHERE CODIGO = '"+s_id+"' "+
                                    "   AND "+anio+" = YEAR(getdate()) "+
                                    "   AND MES  = month(getdate()) "+
                                    "  order by dia ";
                            //out.print(COMANDO);
                            rset = stmt.executeQuery(COMANDO);
                        while(rset.next())
                        { e++;
                            //out.print(e);
                            cont = rset.getInt("NUMSEMANA");
                            cod = rset.getString("CODACT");
                            tipo = rset.getString("TIPO");
                            //out.print(tipo);
                            if(e==1)
                            {
                                for(int i=1; i<cont; i++)
                                {                       
        %>                      

                                <td>
                                    <div align="center" class="table-caption">
                                        &nbsp;
                                    </div>
                                </td>               
        <%
                                    
                                }

        %>                      

                                <td>
                                    <div align="center" class="table-caption">
                                        <font color="<%=rset.getString("CODACT_COLOR")%>" size=1><b><%=e%></b></font> <br>
                                        <font color="<%=rset.getString("CODACT_COLOR")%>" size=3><b>
                                            <input  type="text" size="5" value="&nbsp;&nbsp;&nbsp;&nbsp;<%=rset.getString("CODACT")%>" /> <br>
                                        </b></font>
                                        <font size=1><b><%=rset.getString("HORAI")%> - <%=rset.getString("HORAS")%></b></font>&nbsp;&nbsp;
                                        
                                    </div>
                                </td>
        <%
                            }else{
        %>
                                <td>
                                    <div align="center" class="table-caption">
                                        <font color="<%=rset.getString("CODACT_COLOR")%>" size=1><b><%=e%></b></font> <br>
                                        <font color="<%=rset.getString("CODACT_COLOR")%>" size=3><b>
                                            <input  type="text" size="5" value="&nbsp;&nbsp;&nbsp;&nbsp;<%=rset.getString("CODACT")%>" /> <br>
                                        </b></font>
                                        <font size=1><b><%=rset.getString("HORAI")%> - <%=rset.getString("HORAS")%></b></font>&nbsp;&nbsp;
                                        
                                    </div>
                                </td>
        <%
                            }


                            if(cont==7)
                            {
        %>
                            </tr>
                            <tr>
        <%
                            }
                        }

        %>

                            </tr>

                        </tbody>
                    </table>
                </div>


            </form>
        </div>

    </div>
</div>


<%@ include file="../menu/pie2.jsp"%>