<%@ include file="../conectadb.jsp" %>

<%
    String  s_id_cita   =   request.getParameter("f_id");
    String  nom_pac     =   "";
    String  nom_tec     =   "";
    String  hora        =   "";
    String  col_tec     =   "";
    String  id_hora     =   "";
    String  id_pac      =   "";
    String  fec_cita    =   "";
    String  estado      =   "";
    String  nom_situacion      =   "";
    String  cod_situacion      =   "";
    
    COMANDO = " select       M.nombre as nombre_pac, "+
                "            CONVERT(VARCHAR(10), SYSDATETIME(), 103) as fecha,  "+
                "            CONVERT(VARCHAR(8), SYSDATETIME(), 24) as hora, "+
                "            TS.CODIGO AS cod_inicial, "+
                "            TS.NOMBRE as nomb_inicial "+
                "  from      MAESTRO  M "+
                "  JOIN      T_TipoSituacion TS "+
                "    ON      M.SITUACION = TS.CODIGO "+
                " where      M.codigo = '"+s_id_cita+"' ";
                
        rset    =   stmt.executeQuery(COMANDO);
    if( rset.next() )
    {
        nom_pac     =   rset.getString("nombre_pac");
        fec_cita    =   rset.getString("fecha");
        hora        =   rset.getString("hora");
        nom_situacion = rset.getString("nomb_inicial");
        cod_situacion = rset.getString("cod_inicial");
    }

%>

<div id="container">
    <form name="datos3" id="datos3">

        <div align="center"  class="form-group">
            <div class="input-group">
                <span class="input-group-addon">Personal Baja:</span>
                <input class="form-control" type="text" id="f_nom_pac" name="f_nom_pac" value="<%=nom_pac%>" size="30" />
            </div>
        </div>

        <div align="center"  class="form-group">
            <div class="input-group">
                <span class="input-group-addon">Situacion Inicial:</span>
                <input class="form-control" type="text" id="f_nom_situacion" name="f_nom_situacion" value="<%=nom_situacion%>" size="30" />
                <input class="form-control" type="hidden" id="f_cod_situacion" name="f_cod_situacion" value="<%=cod_situacion%>" size="30" />
            </div>
        </div>        

        <div align="center"  class="form-group">            
            <div class="input-group">
                <span class="input-group-addon">Fecha Baja:</span>
                <input class="form-control" type="text"  value="<%=fec_cita%>" id="f_fecha_del" name="f_fecha_del" />
            </div>
        </div>

        <div align="center"  class="form-group">
            <div class="input-group">
                <span class="input-group-addon">Situacion Destino:</span>
                <select id="f_situacion_destino" name="f_situacion_destino"  class="input-sm form-control">
<%
                                COMANDO = "  SELECT      * "+
                                            "  FROM      T_TipoSituacion "+
                                            " WHERE      ESTADO = 1 "+
                                            "   and      codigo <> '"+cod_situacion+"' ";
                                    rset = stmt.executeQuery(COMANDO);
                                    while (rset.next()) {
%>
                                        <option value="<%=rset.getString("CODIGO")%>"> <%=rset.getString("NOMBRE")%> </option>
<%                                        
                                    }
%>
                </select>
            </div>
        </div>        

        <div align="center"  class="input-daterange form-group" id="bs-datepicker-range">            
            <div class="input-group">
                <span class="input-group-addon">Motivo Baja:</span>
                <input class="form-control" name="f_obs" id="f_obs" type="text" size="30" />
            </div>
        </div>


        <div align="left"  class="form-group">
                <div align="center" class="modal-header">
                    <input type="hidden" id="f_id_del" name="f_id_del" value="<%=s_id_cita%>" />



                    <button type="button" id="delete_personal" class="btn btn-primary" >Guardar</button>&nbsp;&nbsp;

                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    
                </div>
        </div>

    </form>
</div>


<%@ include file= "../cierradb.jsp" %>