<%@ include file="../conectadb.jsp" %>

<%
    String	s_id 			   =	request.getParameter("f_id");
    String  nombre			   =	"";
    String  dni		           =	"";
    String  plaza			   =	"";
    String  t_plaza            = "";
    String  codigo			   =	"";
    String  condicion          = "";
    String  cargo_presupuestal = "";
    String  nivel             = "";
    String  remuneracion      = "";
    String  horario           = "";
    String  horas             = "";
    String  cargo_funcion     = "";
    String  unidad_organica   = "";
    String  nivel_pago        = "";
    String  cadena_funcional  = "";
    String  grupo_trabajador  = "";
    String  dni_reloj         = "";
    String  essalud           = "";
    String  codsiaf           = "";
    String  direccion         = "";
    String  estadocivil       = "";
    String  id_unidadrol      = "0";
    String  id_serviciorol    = "0";
    String  fecha_ing         = "";
    String  fecha_nac         = "";
    String  grupo_trabajo     = "";

	COMANDO = "      SELECT	  [CODIGO] "+
                "              ,[PLAZA] "+
                "              ,[T_PLAZA] "+
                "              ,[NOMBRE] "+
                "              ,[SITUACION] "+
                "              ,[CODCARGO] "+
                "              ,[CODNIVEL] "+
                "              ,[ESTABLEORG] "+
                "              ,[CODFUNCION] "+
                "              ,[CODUNIDADORG] "+
                "              ,[REGIMENPEN] "+
                "              ,[REGIMENLAB] "+
                "              ,[FECHAINGPUB] "+
                "              ,[DOCINGPUB] "+
                "              ,[FECHAINGSLD] "+
                "              ,[DOCINGSLG] "+
                "              ,isnull(CONVERT(VARCHAR(10), FECNAC, 103),'') as FECNAC "+
                "              ,[DISTRITO] "+
                "              ,[PAIS] "+
                "              ,[SEXO] "+
                "              ,[ESTADOCIVIL] "+
                "              ,[NIVELEDU] "+
                "              ,[GRPSANG] "+
                "              ,[DNI] "+
                "              ,[ESSALUD] "+
                "              ,[RUC] "+
                "              ,[NCOLE] "+
                "              ,[TELFIJO] "+
                "              ,[TELMOVIL] "+
                "              ,[EMAIL] "+
                "              ,[DIRECCION] "+
                "              ,[REFERENCIA] "+
                "              ,[AFP] "+
                "              ,[NCARNET] "+
                "              ,[FECAFILIA] "+
                "              ,[ESTABLEDES] "+
                "              ,[CODSIAF] "+
                "              ,[CODGRUPO] "+
                "              ,[CODCATEG] "+
                "              ,[CODHORA] "+
                "              ,[CODTAR] "+
                "              ,[HABER] "+
                "              ,[NIVELGRD] "+
                "              ,[HORAS] "+
                "              ,[CADENA] "+
                "              ,isnull([DNI_RELOG],0) as dni_relog "+
                "              ,[CTA] "+
                "              ,[DNI_ACTUAL] "+
                "              ,[XFLAT] "+
                "              ,[TIENE_LEGAJO] "+
                "              ,[ID_CARGO] "+
                "              ,[MOTIVO_BAJA] "+
                "              ,isnull(CONVERT(VARCHAR(10), fecha_ing, 103),'') as fecha_ing "+
                "              ,[grupo_trabajo] "+
                "              ,isnull(CONVERT(VARCHAR(10), FECHA_BAJA, 103),'') as FECHA_BAJA "+
				"      FROM	  MAESTRO  "+
				"     WHERE	  codigo  = '"+s_id+"' ";

		rset 	=	stmt.executeQuery(COMANDO);
		if(rset.next())
		{
			  nombre		=	rset.getString("nombre");			
			  dni 			=	rset.getString("dni_actual");
              plaza         =   rset.getString("plaza");
              t_plaza       =   rset.getString("t_plaza");
              condicion     =   rset.getString("situacion");
              codigo        =   rset.getString("codigo");
              cargo_presupuestal  = rset.getString("codcargo");
              nivel         =   rset.getString("codnivel");
              remuneracion  =   rset.getString("haber");
              horario       =   rset.getString("codhora");
              horas         =   rset.getString("horas");
              cargo_funcion   = rset.getString("codfuncion");
              unidad_organica = rset.getString("codunidadorg");
              nivel_pago      = rset.getString("nivelgrd");
              cadena_funcional = rset.getString("cadena");
              //grupo_trabajador = rset.getString("nivelgrd");
              dni_reloj       = rset.getString("dni_relog");
              essalud         = rset.getString("essalud");
              codsiaf         = rset.getString("codsiaf");
              direccion         = rset.getString("direccion");
              estadocivil        = rset.getString("estadocivil");
              fecha_ing         = rset.getString("fecha_ing");
              fecha_nac         = rset.getString("FECNAC");
              grupo_trabajo     = rset.getString("grupo_trabajo");
		}

    COMANDO = "SELECT     * "+
                "      FROM   ServicioMaestro  "+
                "     WHERE   codigo  = '"+s_id+"' ";

        rset    =   stmt.executeQuery(COMANDO);
        if(rset.next())
        {
              id_unidadrol        =   rset.getString("iddepartunid");           
              id_serviciorol      =   rset.getString("idservdepartunid");
        }

   // out.print(nivel_pago);
%>

    <div class="row">
      <form id="edit_unidad" name="edit_unidad">
                <div class="table-primary">

                    <div class="panel-body">
    
          						<div align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
           								  DNI :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_dni_upd" id="f_dni_upd" value="<%=dni%>" >
                        <span class="input-group-addon">
                            ID Codigo :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_codigo_upd" id="f_codigo_upd" value="<%=codigo%>"  >
          						</div>

                      <div align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
                            Cod Plaza :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_plaza_upd" id="f_plaza_upd" value="<%=plaza%>" >
<!--                        
                        <span class="input-group-addon">
                            Condicion :  
                        </span>
                        <select class="input-sm form-control" name="f_condicion_upd" id="f_condicion_upd">
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
-->
                        <span class="input-group-addon">
                            Essalud :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_essalud_upd" id="f_essalud_upd" value="<%=essalud%>" >
                      </div>

                      <div align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
                            Fecha Ingreso :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_fecing_upd" id="f_fecing_upd" value="<%=fecha_ing%>" >

                        <span class="input-group-addon">
                            Fecha Nacimiento :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_fecnac_upd" id="f_fecnac_upd" value="<%=fecha_nac%>" >                        
                      </div>                                              

                      <div align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
                            Nombre :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_nombre_upd" id="f_nombre_upd" value="<%=nombre%>" >
                      </div>   

                      <div align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
                            Direccion :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_direccion_upd" id="f_direccion_upd" value="<%=direccion%>" >
                        <span class="input-group-addon">
                            Estado Civil :  
                        </span>
                        <select class="input-sm form-control" name="f_estadocivil_upd" id="f_estadocivil_upd">
<%
                        COMANDO = " SELECT    CODIGO, NOMBRE, "+
                                  "           CASE rtrim(CODIGO)   "+
                                  "                WHEN rtrim('"+estadocivil+"') THEN 'selected' "+
                                  "                else ' '    "+
                                  "            end dato  "+
                                    "  FROM    T_Estado_Civil "+
                                    "  ORDER BY NOMBRE ";
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
                            Cargo Pres :  
                        </span>
                        <select class="input-sm form-control" name="f_cargo_presupuestal_upd" id="f_cargo_presupuestal_upd">
<%
                        COMANDO = " SELECT    CODIGO, NOMBRE, "+
                                  "           CASE rtrim(CODIGO)   "+
                                  "                WHEN rtrim('"+cargo_presupuestal+"') THEN 'selected' "+
                                  "                else ' '    "+
                                  "            end dato  "+
                                    "  FROM    T_CargoPresupuestal "+
                                    "  ORDER BY NOMBRE ";
                            rset = stmt.executeQuery(COMANDO);
                        while(rset.next())
                        {
%>                          
                          <option <%=rset.getString("dato")%> value="<%=rset.getString("CODIGO")%>" > <%=rset.getString("NOMBRE")%> </option>
<%
                        }
%>                          
                        </select>    
                        <span class="input-group-addon">
                            Nivel :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_nivel_upd" id="f_nivel_upd" value="<%=nivel%>" >

                      </div>                  

                      <div align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
                            Remuneracion Basica :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_remuneracion_upd" id="f_remuneracion_upd" value="<%=remuneracion%>" >
                        <span class="input-group-addon">
                            Cod. Horario :  
                        </span>
                        <select class="input-sm form-control" name="f_horario_upd" id="f_horario_upd">
<%
                        COMANDO = " SELECT    CODHOR, CODHOR + ' / ' + HORING + '-' + HORSAL AS NOMBRE, "+
                                  "           CASE rtrim(CODHOR)   "+
                                  "                WHEN rtrim('"+horario+"') THEN 'selected' "+
                                  "                else ' '    "+
                                  "            end dato  "+
                                    "  FROM    T_Horarios "+
                                    "  ORDER BY CODHOR ";
                            rset = stmt.executeQuery(COMANDO);
                        while(rset.next())
                        {
%>                          
                          <option <%=rset.getString("dato")%> value="<%=rset.getString("CODHOR")%>" > <%=rset.getString("NOMBRE")%> </option>
<%
                        }
%>                          
                        </select>                          
                        <span class="input-group-addon">
                            Horas Trab. :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_horas_upd" id="f_horas_upd" value="<%=horas%>" >                                                                        
                      </div>

                      <div align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
                            Cargo Func. :  
                        </span>
                        <select class="input-sm form-control" name="f_cargo_funcional_upd" id="f_cargo_funcional_upd">
<%
                        COMANDO = " SELECT    CODIGO, NOMBRE, "+
                                  "           CASE rtrim(CODIGO)   "+
                                  "                WHEN rtrim('"+cargo_funcion+"') THEN 'selected' "+
                                  "                else ' '    "+
                                  "            end dato  "+
                                    "  FROM    T_CargoFuncional "+
                                    "  ORDER BY NOMBRE ";
                            rset = stmt.executeQuery(COMANDO);
                        while(rset.next())
                        {
%>                          
                          <option <%=rset.getString("dato")%> value="<%=rset.getString("CODIGO")%>" > <%=rset.getString("NOMBRE")%> </option>
<%
                        }
%>                          
                        </select>  
                        <span class="input-group-addon">
                            Unidad Org. :  
                        </span>
                        <select class="input-sm form-control" name="f_unidad_organica_upd" id="f_unidad_organica_upd">
<%
                        COMANDO = " SELECT    CODIGO, NOMBRE, "+
                                  "           CASE rtrim(CODIGO)   "+
                                  "                WHEN rtrim('"+unidad_organica+"') THEN 'selected' "+
                                  "                else ' '    "+
                                  "            end dato  "+
                                    "  FROM    T_UnidadOrganica "+
                                    "  ORDER BY NOMBRE ";
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
                            Nivel Pago :  
                        </span>
                        <select class="input-sm form-control" name="f_nivel_pago_upd" id="f_nivel_pago_upd">
<%
                        COMANDO = " SELECT    CODIGO, NOMBRE, "+
                                  "           CASE rtrim(CODIGO) + '.0'    "+
                                  "                WHEN rtrim("+nivel_pago+") THEN 'selected' "+
                                  "                else ' '    "+
                                  "            end dato  "+
                                    "  FROM    T_GuardiaNiv "+
                                    "  ORDER BY NOMBRE ";
                            rset = stmt.executeQuery(COMANDO);
                        while(rset.next())
                        {
%>                          
                          <option <%=rset.getString("dato")%> value="<%=rset.getString("CODIGO")%>" > <%=rset.getString("NOMBRE")%> </option>
<%
                        }
%>                          
                        </select>
                        <span class="input-group-addon">
                            Grupo Trab. :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_grupo_trabajador_upd" id="f_grupo_trabajador_upd" value="<%=grupo_trabajo%>" >
                      </div>

                      <div align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
                            Cod. Reloj :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_dni_reloj_upd" id="f_dni_reloj_upd" value="<%=dni_reloj%>" >

                        <span class="input-group-addon">
                            CodSiaf :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_codsiaf_upd" id="f_codsiaf_upd" value="<%=codsiaf%>" >                                                
                      </div>

                      <div align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
                            Unidad Roles :  
                        </span>
                        <select class="input-sm form-control" name="f_unidadrol_upd" id="f_unidadrol_upd">
<%
                        COMANDO = " SELECT    iddepartunid, NOMBRE, "+
                                  "           CASE iddepartunid   "+
                                  "                WHEN "+id_unidadrol+" THEN 'selected' "+
                                  "                else ' '    "+
                                  "            end dato  "+
                                    "  FROM    DepartamentoUnidad "+
                                    "  ORDER BY NOMBRE ";
                            rset = stmt.executeQuery(COMANDO);
                        while(rset.next())
                        {
%>                          
                          <option <%=rset.getString("dato")%> value="<%=rset.getString("iddepartunid")%>" > <%=rset.getString("NOMBRE")%> </option>
<%
                        }
%>                          
                        </select> 
                        <span class="input-group-addon">
                            Servicio Roles :  
                        </span>
                        <select class="input-sm form-control" name="f_serviciorol_upd" id="f_serviciorol_upd">
<%
                        COMANDO = " SELECT    idservDepartUnid, NOMBRE, "+
                                  "           CASE idservDepartUnid   "+
                                  "                WHEN "+id_serviciorol+" THEN 'selected' "+
                                  "                else ' '    "+
                                  "            end dato  "+
                                    "  FROM    ServicioDepartUnidad "+
                                    "  ORDER BY NOMBRE ";
                            rset = stmt.executeQuery(COMANDO);
                        while(rset.next())
                        {
%>                          
                          <option <%=rset.getString("dato")%> value="<%=rset.getString("idservDepartUnid")%>" > <%=rset.getString("NOMBRE")%> </option>
<%
                        }
%>                                               
                        </select>
                      </div> 

                      <div align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
                            Cadena Funcional :  
                        </span>
                        <textarea class="input-sm form-control" type="text" name="f_cadena_funcional_upd" id="f_cadena_funcional_upd" ><%=cadena_funcional%></textarea> 
                      </div>

                      <div></div>

                      <div class="form-group">
                          <div align="center" class="col-sm-offset-1 col-sm-9">

                              <button type="button" id="editar_upd" class="btn btn-primary" >Guardar</button>&nbsp;&nbsp;
                              <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>

                          </div>
                      </div>

          					</div>

                </div>
                <input type="hidden" id="f_id_upd" name="f_id_upd" value="<%=s_id%>" >
      </form>
    </div>