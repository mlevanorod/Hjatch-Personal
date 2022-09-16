<%@ include file="../conectadb.jsp" %>

<%
    String  codigo             =    "";
    String  condicion          =    request.getParameter("f_condicion_add");

    COMANDO = " SELECT   max(CODIGO)+1 as codigo "+
                " FROM   MAESTRO  ";

        rset    =   stmt.executeQuery(COMANDO);
        if(rset.next())
        {   
            codigo = rset.getString("codigo");
        }
        codigo = "0"+codigo;
        //out.print(codigo);
%>

    <div class="row">
      <form action="" id="edit_unidad" name="edit_unidad">
                <div class="table-primary">

                    <div class="panel-body">
    
                                <div align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
                            DNI :  
                        </span>
                        <input class="input-sm form-control"  type="text" required minlength="4" maxlength="8" name="f_dni_add" id="f_dni_add"  >
                        <span class="input-group-addon">
                            ID Codigo :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_codigo_add" id="f_codigo_add" value="<%=codigo%>" >
                                </div>

                      <div align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
                            Cod Plaza :  
                        </span>
                        <input class="input-sm form-control" type="text" required minlength="1" maxlength="6" name="f_plaza_add" id="f_plaza_add" >
                        <span class="input-group-addon">
                            Condicion :  
                        </span>
                        <select class="input-sm form-control" name="f_condicion_add" id="f_condicion_add">
<%
                        COMANDO = " SELECT    CODIGO, NOMBRE, "+
                                  "           CASE rtrim(CODIGO)   "+
                                  "                WHEN rtrim('"+condicion+"') THEN 'selected' "+
                                  "                else ' '    "+
                                  "            end dato  "+
                                  "   FROM    T_TipoSituacion "+
                                  "  WHERE    ESTADO = '1' ";
                            rset = stmt.executeQuery(COMANDO);
                        while(rset.next())
                        {
%>                          
                          <option <%=rset.getString("dato")%> value="<%=rset.getString("CODIGO")%>" > <%=rset.getString("NOMBRE")%> </option>
<%
                        }
%>                          
                        </select>                        
                      </div>

                      <div align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
                            Fecha Ingreso :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_fecing_add" id="f_fecing_add" placeholder="DD/MM/YYYY" >

                        <span class="input-group-addon">
                            Fecha Nacimiento :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_fecnac_add" id="f_fecnac_add" placeholder="DD/MM/YYYY" >                        
                      </div>                        

                      <div align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
                            Nombre :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_nombre_add" id="f_nombre_add"  >
                      </div>    

                      <div align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
                            Direccion :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_direccion_add" id="f_direccion_add"  >
                        <span class="input-group-addon">
                            Estado Civil :  
                        </span>
                        <select class="input-sm form-control" name="f_estadocivil_add" id="f_estadocivil_add">
<%
                        COMANDO = " SELECT    CODIGO, NOMBRE "+
                                    "  FROM    T_Estado_Civil "+
                                    "  ORDER BY NOMBRE ";
                            rset = stmt.executeQuery(COMANDO);
                        while(rset.next())
                        {
%>                          
                          <option value="<%=rset.getString("CODIGO")%>" > <%=rset.getString("NOMBRE")%> </option>
<%
                        }
%>                          
                        </select> 
                      </div>    

                      <div align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
                            Cargo Pres :  
                        </span>
                        <select class="input-sm form-control" name="f_cargo_presupuestal_add" id="f_cargo_presupuestal_add">
<%
                        COMANDO = " SELECT    CODIGO, NOMBRE "+
                                    "  FROM    T_CargoPresupuestal "+
                                    "  ORDER BY NOMBRE ";
                            rset = stmt.executeQuery(COMANDO);
                        while(rset.next())
                        {
%>                          
                          <option value="<%=rset.getString("CODIGO")%>" > <%=rset.getString("NOMBRE")%> </option>
<%
                        }
%>                          
                        </select>    
                        <span class="input-group-addon">
                            Nivel :  
                        </span>
                        <input class="input-sm form-control" type="number" name="f_nivel_add" id="f_nivel_add" >

                      </div>                  

                      <div align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
                            Remuneracion Basica :  
                        </span>
                        <input class="input-sm form-control" type="number" name="f_remuneracion_add" id="f_remuneracion_add" >
                        <span class="input-group-addon">
                            Cod. Horario :  
                        </span>
                        <select class="input-sm form-control" name="f_horario_add" id="f_horario_add">
<%
                        COMANDO = " SELECT    CODHOR, CODHOR + ' / ' + HORING + '-' + HORSAL AS NOMBRE "+
                                    "  FROM    T_Horarios "+
                                    "  ORDER BY CODHOR ";
                            rset = stmt.executeQuery(COMANDO);
                        while(rset.next())
                        {
%>                          
                          <option value="<%=rset.getString("CODHOR")%>" > <%=rset.getString("NOMBRE")%> </option>
<%
                        }
%>                          
                        </select>                          
                        <span class="input-group-addon">
                            Horas Trab. :  
                        </span>
                        <input class="input-sm form-control" type="number" name="f_horas_add" id="f_horas_add"  >                                                                        
                      </div>

                      <div align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
                            Cargo Func. :  
                        </span>
                        <select class="input-sm form-control" name="f_cargo_funcional_add" id="f_cargo_funcional_add">
<%
                        COMANDO = " SELECT    CODIGO, NOMBRE "+
                                    "  FROM    T_CargoFuncional "+
                                    "  ORDER BY NOMBRE ";
                            rset = stmt.executeQuery(COMANDO);
                        while(rset.next())
                        {
%>                          
                          <option value="<%=rset.getString("CODIGO")%>" > <%=rset.getString("NOMBRE")%> </option>
<%
                        }
%>                          
                        </select>  
                        <span class="input-group-addon">
                            Unidad Org. :  
                        </span>
                        <select class="input-sm form-control" name="f_unidad_organica_add" id="f_unidad_organica_add">
<%
                        COMANDO = " SELECT    CODIGO, NOMBRE "+
                                    "  FROM    T_UnidadOrganica "+
                                    "  ORDER BY NOMBRE ";
                            rset = stmt.executeQuery(COMANDO);
                        while(rset.next())
                        {
%>                          
                          <option value="<%=rset.getString("CODIGO")%>" > <%=rset.getString("NOMBRE")%> </option>
<%
                        }
%>                          
                        </select>                                                   
                      </div>

                      <div align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
                            Nivel Pago :  
                        </span>
                        <select class="input-sm form-control" name="f_nivel_pago_add" id="f_nivel_pago_add">
<%
                        COMANDO = " SELECT    CODIGO, NOMBRE "+
                                    "  FROM    T_GuardiaNiv "+
                                    "  ORDER BY NOMBRE ";
                            rset = stmt.executeQuery(COMANDO);
                        while(rset.next())
                        {
%>                          
                          <option value="<%=rset.getString("CODIGO")%>" > <%=rset.getString("NOMBRE")%> </option>
<%
                        }
%>                          
                        </select>
                        <span class="input-group-addon">
                            Grupo Trab. :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_grupo_trabajador_add" id="f_grupo_trabajador_add" >
                      </div>

                      <div align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
                            Cod. Reloj :  
                        </span>
                        <input class="input-sm form-control" type="number" name="f_dni_reloj_add" id="f_dni_reloj_add" value="0" >
                        <span class="input-group-addon">
                            Essalud :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_essalud_add" id="f_essalud_add" >
                        <span class="input-group-addon">
                            CodSiaf :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_codsiaf_add" id="f_codsiaf_add" >                                                
                      </div>

                      <div align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
                            Unidad Roles :  
                        </span>
                        <select class="input-sm form-control" name="f_unidadrol_add" id="f_unidadrol_add">
<%
                        COMANDO = " SELECT    iddepartunid, NOMBRE "+
                                    "  FROM    DepartamentoUnidad "+
                                    "  ORDER BY NOMBRE ";
                            rset = stmt.executeQuery(COMANDO);
                        while(rset.next())
                        {
%>                          
                          <option value="<%=rset.getString("iddepartunid")%>" > <%=rset.getString("NOMBRE")%> </option>
<%
                        }
%>                          
                        </select> 
                        <span class="input-group-addon">
                            Servicio Roles :  
                        </span>
                        <select class="input-sm form-control" name="f_serviciorol_add" id="f_serviciorol_add">
                        </select>
                      </div> 

                      <div align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
                            Cadena Funcional :  
                        </span>
                        <textarea class="input-sm form-control" type="text" name="f_cadena_funcional_add" id="f_cadena_funcional_add" ></textarea> 
                      </div>

                      <div></div>

                      <div class="form-group">
                          <div align="center" class="col-sm-offset-1 col-sm-9">

                              <button type="button" id="editar_add" class="btn btn-primary" >Guardar</button>&nbsp;&nbsp;
                              <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>

                          </div>
                      </div>

                            </div>

                </div>
                <input type="hidden" id="f_id_add" name="f_id_add" value="<%=codigo%>" >
      </form>
    </div>