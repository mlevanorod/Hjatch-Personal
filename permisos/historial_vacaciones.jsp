<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>

<%
    String  s_codigo    =   request.getParameter("f_codigo");
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
    String s_fechaing   =   "";
    String cantanio     =   "";
    String  diasSemana[] = new String[17]; 

    String  anio   = new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
            
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
                "       CONVERT(VARCHAR(10), SYSDATETIME(), 103) fechact,    "+
                "       CONVERT(VARCHAR(10), FECHA_ING, 103) FECHA_ING, "+
                "       DATEDIFF(year,  FECHA_ING, GETDATE()) as FEC_ANIO "+
                "  FROM MAESTRO "+
                " WHERE CODIGO = '"+s_codigo+"' ";
        //out.print(COMANDO);
        rset = stmt.executeQuery(COMANDO);
        if(rset.next())
        {
            dni             = rset.getString("DNI");
            nombre          = rset.getString("NOMBRE");
            mes             = rset.getString("mes");
            unidad          = rset.getString("UNIDAD_ORGANICA");
            cargo           = rset.getString("CARGO_FUNCIONAL");
            situacion       = rset.getString("SITUACION_LABORAL");
            s_fechact       = rset.getString("fechact");
            s_fechaing      = rset.getString("FECHA_ING");
            cantanio        = rset.getString("FEC_ANIO");
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
                        <span class="input-group-addon">Año</span>
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
                        <span class="input-group-addon">Fecha Inicio:</span>
                        <input type="text" disabled class="form-control" value ="<%=s_fechaing%>">      
                        <span class="input-group-addon"># <%=anio%>S:</span>
                        <input type="text" disabled class="form-control" value ="<%=cantanio%>">   
                    </div>
                </div>

                    <div class="table-primary">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th colspan="8">
                                        <div align="center" class="table-caption">
                                            HISTORIAL DE VACACIONES PROGRAMADAS
                                        </div>
                                    </th>
                                </tr>
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
                                        "      ,[ANO] "+
                                    "  FROM     VACACIONES "+
                                    " where     Codigo = '"+s_codigo+"' "+
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
                                            <%=rset.getString("REFERENCIA")%>
                                        </div>
                                    </td>       
                                    
                                    <td>
                                        <div align="center" class="table-caption">
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
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th colspan="10">
                                        <div align="center" class="table-caption">
                                            HISTORIAL DE LICENCIAS
                                        </div>
                                    </th>
                                </tr>
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
                                        TIPO LICENCIA
                                        </div>
                                    </th>
                                    <th>
                                        <div align="center" class="table-caption">
                                        COD. DETALLE
                                        </div>
                                    </th>
                                    <th>
                                        <div align="center" class="table-caption">
                                        DETALLE
                                        </div>
                                    </th>
                                    <th>
                                        <div align="center" class="table-caption">
                                        OBSERVACION
                                        </div>
                                    </th>
                                    <th>
                                        <div align="center" class="table-caption">
                                            OPCION
                                        </div>
                                    </th>                           
                                </tr>
                            </thead>
                            <tbody>
        <%  
                        cont=0;
                        e=0;
                        COMANDO = "SELECT       [id] "+
                                        "      ,[CODIGO] "+
                                        "      ,CONVERT(VARCHAR(10), DESDE, 103) as DESDE "+
                                        "      ,CONVERT(VARCHAR(10), HASTA, 103) as HASTA "+
                                        "      ,[DIAS] "+
                                        "      ,[DESINI] "+
                                        "      ,[CODDET] "+
                                        "      ,[DETALLE] "+
                                        "      ,[OBSERVA] "+
                                    "  FROM     LICENCIA "+
                                    " where     Codigo = '"+s_codigo+"' "+
                                    "   AND     '"+s_anio+"' BETWEEN YEAR(DESDE) AND YEAR(HASTA) ";
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
                                            <%=rset.getString("DESINI")%>
                                        </div>
                                    </td>
                                    <td>
                                        <div align="center" class="table-caption">
                                            <%=rset.getString("CODDET")%>
                                        </div>
                                    </td>
                                    <td>
                                        <div align="center" class="table-caption">
                                            <%=rset.getString("DETALLE")%>
                                        </div>
                                    </td>
                                    <td>
                                        <div align="center" class="table-caption">
                                            <%=rset.getString("OBSERVA")%>
                                        </div>
                                    </td>       
                                    
                                    <td>
                                        <div align="center" class="table-caption">
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
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th colspan="10">
                                        <div align="center" class="table-caption">
                                            HISTORIAL DE VACACIONES EJECUTADASS
                                        </div>
                                    </th>
                                </tr>
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
                                        FECHA    
                                        </div>
                                    </th>
                                    <th>
                                        <div align="center" class="table-caption">
                                        COD. DETALLE
                                        </div>
                                    </th>
                                    <th>
                                        <div align="center" class="table-caption">
                                        DETALLE
                                        </div>
                                    </th>
                                    <th>
                                        <div align="center" class="table-caption">
                                        OBSERVACION
                                        </div>
                                    </th>
                                    <th>
                                        <div align="center" class="table-caption">
                                            OPCION
                                        </div>
                                    </th>                           
                                </tr>
                            </thead>
                            <tbody>
        <%  
                        cont=0;
                        e=0;
                        COMANDO = "SELECT       [CODIGO] "+
                                        "      ,DESDE "+
                                        "      ,HASTA "+
                                        "      ,CONVERT(VARCHAR(10), FECHA, 103) as FECHA "+
                                        "      ,[CODDET] "+
                                        "      ,[DETALLE] "+
                                        "      ,[OBSERVA] "+
                                    "  FROM     PERMISOS "+
                                    " where     Codigo = '"+s_codigo+"' "+
                                    "   AND     PERIODO = '"+s_anio+"' "+
                                    " order by fecha  ";
                        rset = stmt.executeQuery(COMANDO);
                        while(rset.next())
                        {  e++;
                            //cont = cont + rset.getInt("dias");
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
                                            <%=rset.getString("FECHA")%>
                                        </div>
                                    </td>
                                    <td>
                                        <div align="center" class="table-caption">
                                            <%=rset.getString("CODDET")%>
                                        </div>
                                    </td>
                                    <td>
                                        <div align="center" class="table-caption">
                                            <%=rset.getString("DETALLE")%>
                                        </div>
                                    </td>
                                    <td>
                                        <div align="center" class="table-caption">
                                            <%=rset.getString("OBSERVA")%>
                                        </div>
                                    </td>       
                                    
                                    <td>
                                        <div align="center" class="table-caption">
                                            &nbsp;<a href="#" title="Click para Eliminar Vacaciones" name='<%=rset.getString("codigo")%>' id="eliminar_cita" data-toggle="modal" data-target="#modal-blurred-bg" >[ <img src="../images/deleted.gif" width="15" height="15"> ] </a>&nbsp;
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
                                            <strong><%=e%></strong>
                                        </div>
                                    </td>                                    
                                </tr>
                            </tbody>
                        </table>
                    </div> 

            </form>
        </div>

    </div>
</div>                


