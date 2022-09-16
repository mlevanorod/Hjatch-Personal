<%@ include file="../conectadb.jsp" %>

<%
    String  s_anio  =   request.getParameter("f_anio");
    String  s_mes   =   request.getParameter("f_mes");
%>

<div id="cont">
    <form name="datos_personal" id="datos_personal">

        <div align="left" class="form-group">
        	<div class="input-group">
                <span class="input-group-addon">Nombre:</span>
	    		<input type="text" class="form-control" id="f_personal" name="f_personal" >
        	</div>
            <div class="input-group">
                <span class="input-group-addon">Codigo:</span>                
                <input type="text" class="form-control" id="f_codigo" name="f_codigo"  >
            </div>
        </div>

        <div align="left"  class="form-group">
                <div align="center" class="modal-header">
                    <input type="hidden" name="f_aniox" id="f_aniox" value="<%=s_anio%>"> 
                    <input type="hidden" name="f_mesx"  id="f_mesx"  value="<%=s_mes%>"> 
                    <button type="button" id="crear_programacion" class="btn btn-primary" >Crear Programacion</button>
                    
                </div>
        </div>

    </form>
</div>