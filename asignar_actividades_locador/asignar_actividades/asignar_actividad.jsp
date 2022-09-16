<%@ include file="../conectadb.jsp" %>

<%

	String s_codigo 	= 	request.getParameter("f_codigo");
	String s_anio 		= 	request.getParameter("f_anio");
	String s_mes 		= 	request.getParameter("f_mes");
	String s_dia		=	request.getParameter("f_dia");
	String s_servicio	= 	request.getParameter("f_unidad");
	String anio 		= new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
	String datos_dia = 	"";
	String diaa 	=	"";
	String nombre   =	"";
    String xhora     =       "";
    String nivel     =       "";
    String conlab     =       "";
   	int  cant_dd		=	0;
	int  cant_prog		=	0;
	int actividad = 0;
	int activo = 1;
	int mes = Integer.parseInt(s_mes);
	//out.print(mes);

	COMANDO = "SELECT  "+
				"		DATENAME(weekday, (right( '00' + cast( "+s_dia+" AS varchar(2)), 2 ) + '/' + CONVERT(varchar(2), '"+s_mes+"') + '/' + CONVERT(varchar(4), '"+s_anio+"')))   "+
				"		+ ', ' + '"+s_dia+"' + ' de ' + b.NOMBRE + ' del ' + '"+s_anio+"' as datos_dia, "+
				"		SUBSTRING( DATENAME(weekday, (right( '00' + cast( "+s_dia+" AS varchar(2)), 2 ) + '/' + CONVERT(varchar(2), '"+s_mes+"') + '/' + CONVERT(varchar(4), '"+s_anio+"'))) + ', ' + '"+s_dia+"' + ' de ' + b.NOMBRE + ' del ' + '"+s_anio+"',1,2) as DIA, "+
				"		a.NOMBRE as NOMBRE "+
				"  from	MAESTRO a, [SIGSALUD].dbo.MES b  "+
				" where	a.CODIGO = right('000000' + '"+s_codigo+"',6)  "+
				"   and	b.MES = '"+s_mes+"' ";
				//out.print(COMANDO);
		rset 	=	stmt.executeQuery(COMANDO);
		if(rset.next())
		{
			datos_dia = rset.getString("datos_dia");
			nombre 	  =	rset.getString("NOMBRE");
			diaa      = rset.getString("DIA");
		}


%>
    <div align="left" class="form-group">
    	<div class="input-group">
            <span class="input-group-addon">Persona:</span>
    		<input type="text" disabled class="form-control" value ="<%=nombre%>">
    	</div>
    </div>

    <div align="left" class="form-group">
    	<div class="input-group">
            <span class="input-group-addon">Fecha:</span>
    		<input type="text" disabled class="form-control" value ="<%=datos_dia%>">
    	</div>
    </div>

    <form name="aceptar_actividad2" id="aceptar_actividad2" onclick="valida()">

       <table border="0" align="center">
       	

<%
	//	COMANDO = "EXEC SP_GET_ASISTENCIA_MAESTRO_10 '"+s_codigo+"', "+s_dia+", "+mes+", '"+s_anio+"', "+s_servicio+" ";

	/*if (s_servicio == 47) {
		activo = 4;
	}else if(s_servicio == 129 ){
		activo = 7;
	}*/

	COMANDO = "  SELECT		SUM(HORAS) AS SUM_HORA "+
				"  FROM  	ACTIVIDAD_DETALLE "+
				" WHERE		ANIO = '"+s_anio+"' "+
				"   AND		MES = '"+s_mes+"' "+
				"   AND		CODIGO = '"+s_codigo+"' ";
			//out.print(COMANDO);
		rset = stmt.executeQuery(COMANDO);
		while(rset.next())
					{
	if(rset.getString("SUM_HORA")!= null)
	{
		cant_dd = Integer.parseInt(rset.getString("SUM_HORA"));

	}}
	
	
	COMANDO = "  SELECT	   CAST((SUM(B.HORA)) AS int) AS SUM_HORA "+
						"  FROM		ASISTENCIA A "+
						"  JOIN		T_Horarios B "+
						"    ON		B.CODHOR = A.CODACT "+
						" WHERE		A."+anio+" = '"+s_anio+"' "+
						"   AND		A.MES = '"+s_mes+"' "+
						"   AND		A.CODIGO = '"+s_codigo+"' ";
		//out.print(COMANDO);
		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
		cant_prog = Integer.parseInt(rset.getString("SUM_HORA"));
	}

	
		COMANDO = "SELECT	RA.ID_ACTIVIDAD, "+
					"		AC.NOMBRE, 	"+
					"		case dbo.FN_SELECTED_ACTIVIDAD ('"+s_codigo+"', "+s_dia+", "+mes+", '"+s_anio+"', RA.ID_ACTIVIDAD)  "+
					"			when 'sele' then 'checked' "+
					"			else ' ' "+
					"		end sel, "+
					"		dbo.FN_ACTIVIDAD_DETALLE2 ('"+s_codigo+"', "+s_dia+", "+mes+", '"+s_anio+"', RA.ID_ACTIVIDAD)  AS TURNO, "+
                                        "		dbo.FN_ACTIVIDAD_DETALLE3 ('"+s_codigo+"', "+s_dia+", "+mes+", '"+s_anio+"', RA.ID_ACTIVIDAD)  AS HORAS, "+
					"		case dbo.FN_SELECTED_ACTIVIDAD ('"+s_codigo+"', "+s_dia+", "+mes+", '"+s_anio+"', RA.ID_ACTIVIDAD) when 'sele' then ' ' else 'display:none' end ver, "+
					"		CASE dbo.FN_ACTIVIDAD_DETALLE2 ('"+s_codigo+"', "+s_dia+", "+mes+", '"+s_anio+"', RA.ID_ACTIVIDAD) WHEN 'M' then 1 when 'T' then 2 when 'MT' then 3 when 'N' then 4 when 'TN' then 5 when 'TD' then 6 when 'MN' then 7 when 'DN' then 8 else 0 end turno, "+
					"		AC.ABREVIATURA "+
					" FROM  REL_ACTIVIDADES AS RA	"+
					" INNER JOIN ACTIVIDADES AS AC	"+
					" ON RA.ID_ACTIVIDAD = AC.ID_ACTIVIDAD	"+
					" WHERE 	RA.IdServDepartUnid = '"+s_servicio+"'";

					//out.print(COMANDO);
					rset = stmt.executeQuery(COMANDO);
					while(rset.next())
					{
	//out.print(COMANDO);
%>
<tr>
	<td>
		<label class="checkbox-inline">
			<input size="8" type="checkbox" <%=rset.getString("sel")%>  name="f_<%=rset.getString("ABREVIATURA")%>" id="f_<%=rset.getString("ABREVIATURA")%>" value="<%=rset.getString("ID_ACTIVIDAD")%>" class="px">
			<span class="lbl"> <font size="4"><b><%=rset.getString("NOMBRE")%></b> </font> </span>
                 </label>
	</td>
	<td>&nbsp;&nbsp;</td>
	<td>
            <label  align="center">
                               <%
                                   if(rset.getString("HORAS")!= null ){
                                    xhora = rset.getString("HORAS");
                                   }else{
                                    xhora = "0"; 
                                   }

                               %>
                        <input type="number" max="24" name="h_<%=rset.getString("ABREVIATURA")%>"  id="h_<%=rset.getString("ABREVIATURA")%>" value="<%=xhora%>" >
                       
            </label>
        </td>
	<td>&nbsp;&nbsp;</td>
	<td>

		<label id="<%=rset.getString("ABREVIATURA")%>" name="<%=rset.getString("ABREVIATURA")%>" style="<%=rset.getString("ver")%>">
		 	<select id="<%=rset.getString("ABREVIATURA")%>" name="<%=rset.getString("ABREVIATURA")%>">
		 		<option <%if( 1 == rset.getInt("turno") ) {%> selected <%}%> value="M">Ma&ntilde;ana</option>
		 		<option <%if( 2 == rset.getInt("turno") ) {%> selected <%}%> value="T">Tarde</option>
		 		<option <%if( 3 == rset.getInt("turno") ) {%> selected <%}%> value="MT">Ma/Tar</option>
		 		<option <%if( 4 == rset.getInt("turno") ) {%> selected <%}%> value="N">Noche</option>
		 		<option <%if( 5 == rset.getInt("turno") ) {%> selected <%}%> value="TN">Tar/Noc</option>
		 		<option <%if( 7 == rset.getInt("turno") ) {%> selected <%}%> value="MN">Man/Noc</option>
		 		<option <%if( 8 == rset.getInt("turno") ) {%> selected <%}%> value="DN">Dia/Noc</option>
		 		<option <%if( 6 == rset.getInt("turno") ) {%> selected <%}%> value="TD">Todo el dia</option>
		 	</select>
		 </label>

	</td>
        <td>           
        </td>
 
 </tr>
<%
		}
%>

		</table>

<%
		 if(cant_dd<cant_prog){
				
%>
					<script>alert('Faltan asignar '+<%=cant_prog-cant_dd%>+' horas');</script>
					<div align="right"  class="form-group">
						HORAS X ASIGNAR :<font size="4" color="#0000FF"> <label><%=cant_prog-cant_dd%></label></font>	
					</div>
<%					
				}
				
%>

        <div align="left"  class="form-group">
                <div align="center" class="modal-header">

                    <button type="button" id="acpt_actividad" class="btn btn-primary" >Guardar</button>&nbsp;&nbsp;
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    
                </div>
        </div>

		<input type="hidden" id="f_codigox" name="f_codigox" value="<%=s_codigo%>" >
		<input type="hidden" id="f_aniox" name="f_aniox" value="<%=s_anio%>" >
		<input type="hidden" id="f_mesx" name="f_mesx" value="<%=s_mes%>" >
		<input type="hidden" id="f_diax" name="f_diax" value="<%=s_dia%>" >
    </form>

    <script>
function valida()  {
	suma=0;
    <%	
		COMANDO = "SELECT	RA.ID_ACTIVIDAD, "+
					"		AC.NOMBRE, 	"+
					"		case dbo.FN_SELECTED_ACTIVIDAD ('"+s_codigo+"', "+s_dia+", "+mes+", '"+s_anio+"', RA.ID_ACTIVIDAD)  "+
					"			when 'sele' then 'checked' "+
					"			else ' ' "+
					"		end sel, "+
					"		dbo.FN_ACTIVIDAD_DETALLE2 ('"+s_codigo+"', "+s_dia+", "+mes+", '"+s_anio+"', RA.ID_ACTIVIDAD)  AS TURNO, "+
                                        "		dbo.FN_ACTIVIDAD_DETALLE3 ('"+s_codigo+"', "+s_dia+", "+mes+", '"+s_anio+"', RA.ID_ACTIVIDAD)  AS HORAS, "+
					"		case dbo.FN_SELECTED_ACTIVIDAD ('"+s_codigo+"', "+s_dia+", "+mes+", '"+s_anio+"', RA.ID_ACTIVIDAD) when 'sele' then ' ' else 'display:none' end ver, "+
					"		CASE dbo.FN_ACTIVIDAD_DETALLE2 ('"+s_codigo+"', "+s_dia+", "+mes+", '"+s_anio+"', RA.ID_ACTIVIDAD) WHEN 'M' then 1 when 'T' then 2 when 'MT' then 3 when 'N' then 4 when 'TN' then 5 when 'TD' then 6 when 'MN' then 7 when 'DN' then 8 else 0 end turno, "+
					"		AC.ABREVIATURA "+
					" FROM  REL_ACTIVIDADES AS RA	"+
					" INNER JOIN ACTIVIDADES AS AC	"+
					" ON RA.ID_ACTIVIDAD = AC.ID_ACTIVIDAD	"+
					" WHERE 	RA.IdServDepartUnid = '"+s_servicio+"'";

					//out.print(COMANDO);
					rset = stmt.executeQuery(COMANDO);
					while(rset.next())
					{
%>
			h_<%=rset.getString("ABREVIATURA")%>=0
		  	h_<%=rset.getString("ABREVIATURA")%>=parseInt(document.getElementById("h_<%=rset.getString("ABREVIATURA")%>").value);

		  	suma=suma+h_<%=rset.getString("ABREVIATURA")%>;

		    if (h_<%=rset.getString("ABREVIATURA")%>>24){
		      	alert("El numero de horas " + h_<%=rset.getString("ABREVIATURA")%> + " es invalido");
		      	document.getElementById("h_<%=rset.getString("ABREVIATURA")%>").value = "";
		 	}

<%	
		 	if(rset.getString("HORAS")!= null ){
                                    xhora = rset.getString("HORAS");
                                   }else{
                                    xhora = "0"; 
                                   }
%>
		 	 	if (((<%=cant_prog-cant_dd%>)-(h_<%=rset.getString("ABREVIATURA")%>-<%=xhora%>)<0 && 
		 	 		(<%=cant_dd%>-<%=xhora%>)+suma+<%=cant_prog-cant_dd%>><%=cant_prog%>)){

			      	alert("Sobrepaso el numero de horas programadas");
			      	document.getElementById("h_<%=rset.getString("ABREVIATURA")%>").value = "";
			 	 }
<%					
				}
				
%>
	
}
</script>
