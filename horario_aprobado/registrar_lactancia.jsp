<%@ include file="../conectadb.jsp" %>
<%
	String	s_codigo	=	request.getParameter("f_codigo");
	String  s_nombre	=	"";
	String  s_unidad	=	"";
	String  s_condicion	=	"";
	String  s_fecha_ini	=	"";
	String  s_fecha_fin	=	"";
	String  disb 		=	" ";
	String  tipo 		=	"";
	String  dia  		=	"";
	String  mes         =	"";
	String  check       =	" ";

	COMANDO = " SELECT	CODIGO, "+
				"		NOMBRE, "+
				"		CODCARGO, "+
				"		CONVERT(VARCHAR(10), SYSDATETIME(), 103) as fecha, "+
				"		DBO.COD_UNIDAD(CODUNIDADORG) AS UNIDAD, "+
				"		UPPER(DBO.S_LABORAL(SITUACION)) AS CONDICION, "+
				"		CODUNIDADORG "+
				"  FROM	MAESTRO "+
				" WHERE	CODIGO = '"+s_codigo+"' "+
				"   AND	SEXO = 'F' ";
		rset	=	stmt.executeQuery(COMANDO);

		if(rset.next())
		{
			s_nombre 	= rset.getString("NOMBRE");
			s_unidad 	= rset.getString("UNIDAD");
			s_condicion = rset.getString("CONDICION");
			s_fecha_ini	= rset.getString("fecha");
			s_fecha_fin	= rset.getString("fecha");
		}

	COMANDO = "  SELECT	CASE TIPO "+
					"			WHEN 'S' THEN 'SALDRA 1 HORA ANTES DE LO PROGRAMO' "+
					"			WHEN 'E' THEN 'ENTRARA 1 HORA DESPUES DE LO PROGRAMO' "+
					"			ELSE ' ' "+
					"		END TIPO, "+
					" 		'disabled' AS DISB, "+
					"		CASE TIPO "+
					"			WHEN 'S' THEN 'checked' "+
					"			WHEN 'E' THEN ' ' "+
					"			ELSE ' ' "+
					"		END CHEK, "+
					"		CONVERT(VARCHAR(10), FECHA_INI, 103) AS FEC_INI, "+
					"		CONVERT(VARCHAR(10), FECHA_FIN, 103) AS FEC_FIN, "+
					"		DATEDIFF(dd, SYSDATETIME() , FECHA_FIN) AS Dias, "+
					"		DATEDIFF(mm, SYSDATETIME() , FECHA_FIN) AS MES "+
					"   FROM	LACTANCIA "+
					"  where	codigo = '"+s_codigo+"' "+
					"    and	CONVERT(VARCHAR(8),FECHA_FIN, 112) > CONVERT(VARCHAR(8), SYSDATETIME(), 112) ";
		//	out.print(COMANDO);
/*			
			rset =	stmt.executeQuery(COMANDO);
		if(rset.next())
		{
			s_fecha_ini	=	rset.getString("FEC_INI");
			s_fecha_fin	=	rset.getString("FEC_FIN");
			tipo		=	rset.getString("TIPO");
			dia 		= 	rset.getString("Dias");
			mes 		= 	rset.getString("MES");
			disb 		= 	rset.getString("DISB");
			check 		= 	rset.getString("CHEK");	
		}
*/
%>

<div id="cont">
    <form name="guardar_persona" id="guardar_persona">

        <div align="left" class="form-group">
        	<div class="input-group">
                <span class="input-group-addon">Trabajador:</span>
	    		<input type="text" disabled class="form-control" value ="<%=s_nombre%>">
        	</div>
        </div>

        <div align="left" class="form-group">
        	<div class="input-group">
                <span class="input-group-addon">Unidad Organica:</span>
	    		<input type="text" disabled class="form-control" value ="<%=s_unidad%>">    	
        	</div>
        </div>

        <div align="left" class="form-group">
        	<div class="input-group">
                <span class="input-group-addon">Condicion:</span>
	    		<input type="text" disabled class="form-control" value ="<%=s_condicion%>">    	
        	</div>
        </div>

		<div align="left" class="form-group">
			<div class="input-group">
                <span class="input-group-addon">Fec Ini:</span>
	    		<input type="text"  class="form-control" id="f_fecha_ini" <%=disb%> name="f_fecha_ini" value ="<%=s_fecha_ini%>">   
                <span class="input-group-addon">Fec Fin:</span>
	    		<input type="text"  class="form-control" id="f_fecha_fin" <%=disb%> name="f_fecha_fin"  value ="<%=s_fecha_fin%>">
			</div>
		</div>

<%
		if("disabled".equals(disb))
		{
%>
		<div align="left" class="form-group">
			<div class="input-group">
	            <span class="input-group-addon"> Quedan:</span>
	            <input type="text" disabled class="form-control" value="<%=dia%> Dias" >
			</div>
		</div>
<%
		}
%>

		<div align="left" class="form-group">
			<div class="input-group">
                <span class="input-group-addon">Permiso:</span>
					<div class="radio" style="margin-top: 0;">
						<label>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="f_tipo" id="tipo1" <%=disb%> value="E" checked class="px">
							<span class="lbl">Entrada</span>
						</label>
					</div> <!-- / .radio -->
					<div class="radio" style="margin-bottom: 0;">
						<label>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="f_tipo" id="tipo2" <%=disb%> value="S" <%=check%> class="px">
							<span class="lbl">Salida</span>
						</label>
					</div> <!-- / .radio -->
			</div>
		</div>

<%
		if("disabled".equals(disb))
		{
%>
		<div align="left" class="form-group">
			<div class="input-group">
	            <span class="input-group-addon"> Nota:</span>
	            <input type="text" disabled class="form-control" value="<%=tipo%>" >
			</div>
		</div>
<%
		}else {
%>

        <div align="left"  class="form-group">
                <div align="center" class="modal-header">
                	<input type="hidden" id="f_cod" name="f_cod" value="<%=s_codigo%>">
                    <button type="button" id="upd_per" class="btn btn-primary" >Guardar</button>&nbsp;&nbsp;
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    
                </div>
        </div>
<%
		}
%>
    </form>
</div>