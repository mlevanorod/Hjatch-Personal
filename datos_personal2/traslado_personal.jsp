<%@ include file="../conectadb.jsp" %>

<%
        int d = 0;
        String s_id = request.getParameter("f_id");
%>

        <div class="table-primary">

            <table class="table table-bordered">
<%  
    COMANDO =   "SELECT      TS.id_traslado_situacion "+
                "            ,CONVERT(VARCHAR(10), TS.fecha_traslado, 103) as fecha_traslado "+
                "            ,TS.motivo_traslado "+
                "            ,TS.situacion_inicial "+
                "            ,TS.situacion_destino "+
                "            ,TS.estado "+
                "            ,TS.codigo "+
                "            ,M.NOMBRE AS Nomb_personal "+
                "            ,isnull(TS1.NOMBRE,'') AS NOMB_INICIAL "+
                "            ,isnull(TS2.NOMBRE,'') AS NOMB_DESTINO "+
                "  FROM      [traslado_situacion] TS "+
                "  JOIN      MAESTRO M "+
                "    ON      TS.CODIGO = M.CODIGO "+
                "left  JOIN      T_TipoSituacion TS1 "+
                "    ON      TS1.CODIGO = TS.situacion_inicial "+
                "left  JOIN      T_TipoSituacion TS2 "+
                "    ON      TS2.CODIGO = TS.situacion_destino "+
                " WHERE      TS.ESTADO = 1 "+
                "   and      ts.codigo = '"+s_id+"'    "+
                " order by TS.id_traslado_situacion desc ";

        //out.print(COMANDO);
        rset    =   stmt.executeQuery(COMANDO);
            while(rset.next())
            {
                 d++;
                 if(d==1){
%>
                <thead>
                    <tr>
                        <th colspan="11">
                            <div align="center" class="table-caption">
                                HISTORIAL DE TRASLADO
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
                                Codigo
                            </div>
                        </th>
                        <th>
                            <div align="center" class="table-caption">
                                Personal
                            </div>
                        </th>
                        <th>
                            <div align="center" class="table-caption">
                                Situacion Inicial
                            </div>
                        </th>
                        <th>
                            <div align="center" class="table-caption">
                                Fecha Traslado
                            </div>
                        </th>
                        <th>
                            <div align="center" class="table-caption">
                                Situacion Destino
                            </div>
                        </th>                       
                        <th>
                            <div align="center" class="table-caption">
                                Motivo
                            </div>
                        </th>
                    </tr>
                </thead>
                <tbody>
<%
                }
%>                  
                    <tr>
                        <td>
                            <div align="center" class="table-caption">
                                <%=d%>
                            </div>
                        </td>
                        <td>
                            <div align="center" class="table-caption">
                                <%=rset.getString("codigo")%>
                            </div>
                        </td>
                        <td>
                            <div align="center" class="table-caption">
                                <%=rset.getString("Nomb_personal")%>
                            </div>
                        </td>
                        <td>
                            <div align="center" class="table-caption">
                                <%=rset.getString("NOMB_INICIAL")%>
                            </div>
                        </td>
                        <td>
                            <div align="center" class="table-caption">                         
                                <%=rset.getString("fecha_traslado")%>
                            </div>
                        </td>
                        <td>
                            <div align="center" class="table-caption">                         
                                <%=rset.getString("NOMB_DESTINO")%>
                            </div>
                        </td>
                        <td>
                            <div align="center" class="table-caption">
                                <%=rset.getString("motivo_traslado")%>
                            </div>
                        </td>                        
                    </tr>
<%
            }
%>
                    
                </tbody>
            </table>

        </div>
        <!-- / Primary table -->