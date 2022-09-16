<%@ include file="../conectadb.jsp" %>

<%
	String	s_id 					=	request.getParameter("f_id");
	String  nombre					=	"";
	String  idServDepartUnid		=	"";
	String  idDepartUnid			=	"";
	String  codigo					=	"";

	COMANDO = "SELECT	a.IdServMaestro, "+
				"		a.IdServDepartUnid as idServDepartUnid, "+
				"		a.IdDepartUnid as idDepartUnid, "+
				"	    b.nombre as persona, "+
				"		a.Codigo as codigo "+
				"  FROM	dbo.ServicioMaestro a "+
				"  JOIN MAESTRO b "+
				"    on a.codigo = b.codigo "+
				" WHERE	a.IdServMaestro = "+s_id+" "+
				"   and	a.activo = 1	";

		rset 	=	stmt.executeQuery(COMANDO);
		if(rset.next())
		{
			nombre				=	rset.getString("persona");
			idServDepartUnid 	=	rset.getString("idServDepartUnid");
			idDepartUnid 		=	rset.getString("idDepartUnid");
			codigo 				=	rset.getString("codigo");
		}
%>

    <div class="row">
      <form id="edit_unidad" name="edit_unidad">
                <div class="table-primary">

                    <div class="panel-body">
    
          						<div align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
           								  PERSONAL :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_personal" id="f_personal" value="<%=nombre%>" disabled >
                        <span class="input-group-addon">
                             COD :  
                        </span>
                        <input class="input-sm form-control" size="1" type="text" name="f_codigo_upd" id="f_codigo_upd" value="<%=codigo%>"  >
          						</div>

          						<div class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
          								DEPART. / UNIDAD : 
                        </span> 
                          <select class="input-sm form-control" name="f_unidad_upd" id="f_unidad_upd">
<%
                    COMANDO = "    SELECT   IdDepartUnid, "+
                                  "         Nombre, codigo "+
                                  "  FROM   dbo.DepartamentoUnidad "+
                                  " WHERE   ACTIVO = 1 "+
                                 // "   and   codigo <> '0000' "+
                                  " ORDER  BY  CODIGO ASC ";
                            rset  = stmt.executeQuery(COMANDO);
                          while(rset.next())
                          {
%>
                            <option value="<%=rset.getString("IdDepartUnid")%>"><%=rset.getString("Nombre")%></option>
<%
                          }
%>
                          </select>
          						</div>

          						<div id="serv_upd" align="left" class="input-daterange input-group" id="bs-datepicker-range">
                        <span class="input-group-addon">
                            SERVICIO  : 
                        </span>
                          <select class="input-sm form-control" name="f_servicio_upd" id="f_servicio_upd">

                          </select>
          						</div>                      
                     <div class="form-group">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                      </div>

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