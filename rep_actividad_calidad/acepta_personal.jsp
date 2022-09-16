<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%
	String	s_id_personal	=	request.getParameter("f_id_personal");
	String	s_mes			=	request.getParameter("f_mes");
	String  s_anio			=	request.getParameter("f_anio");
	String  s_unidad		=	request.getParameter("f_unidad");
	String  nom_unidad		=	"";

	COMANDO = " SELECT	NOMBRE "+
			  "   FROM	T_UnidadOrganica "+
			  "  WHERE	CODIGO = '"+s_unidad+"' ";

		rset 	=	stmt.executeQuery(COMANDO);
		if(rset.next())
		{
			nom_unidad	=	rset.getString("NOMBRE");
		}


%>

<div id="cont">
    <form name="aceptar_roles" id="aceptar_roles">

        <div align="left" class="form-group">
        	<div class="input-group">
                <span class="input-group-addon">Usuario:</span>
	    		<input type="text" class="form-control" disabled value="<%=nom_unidad%>" >
        	</div>

        	<div class="input-group">
                <span class="input-group-addon">Usuario:</span>
	    		<input type="text" class="form-control" id="f_id_personal" name="f_id_personal" value="<%=s_id_personal%>" >
        	</div>
            <div class="input-group">
                <span class="input-group-addon">Passwd:</span>                
                <input type="password" class="form-control" id="f_passwd" name="f_passwd"  >
            </div>
        </div>

        <div align="left"  class="form-group">
                <div align="center" class="modal-header">
                    <input type="hidden" name="f_anio" id="f_anio" value="<%=s_anio%>"> 
                    <input type="hidden" name="f_mes"  id="f_mes"  value="<%=s_mes%>"> 
                    <input type="hidden" name="f_unidad" id="f_unidad" value="<%=s_unidad%>">
                    <button type="button" id="aceptar_rol" class="btn btn-primary" >Aceptar Programacion</button>
                    
                </div>
        </div>

    </form>
</div>