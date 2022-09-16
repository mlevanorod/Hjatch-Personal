<%@ include file="../conectadb.jsp" %>

<%

	String s_codigo = 	request.getParameter("f_codigo");
	String s_anio 	= 	request.getParameter("f_anio");
	String s_mes 	= 	request.getParameter("f_mes");
	String s_dia	=	request.getParameter("f_dia");
	String datos_dia = 	"";
	String diaa 	=	"";
	String nombre   =	"";
	int actividad = 0;
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

    <form name="aceptar_actividad2" id="aceptar_actividad2">

       <table border="0" align="center">
       	

<%
		COMANDO = "SELECT	ID_ACTIVIDAD, "+
					"		NOMBRE, 	"+
					"		case dbo.FN_SELECTED_ACTIVIDAD ('"+s_codigo+"', "+s_dia+", "+mes+", '"+s_anio+"', ID_ACTIVIDAD)  "+
					"			when 'sele' then 'checked' "+
					"			else ' ' "+
					"		end sel, "+
					"		dbo.FN_ACTIVIDAD_DETALLE2 ('"+s_codigo+"', "+s_dia+", "+mes+", '"+s_anio+"', ID_ACTIVIDAD)  AS TURNO, "+
					"		case dbo.FN_SELECTED_ACTIVIDAD ('"+s_codigo+"', "+s_dia+", "+mes+", '"+s_anio+"', ID_ACTIVIDAD) when 'sele' then ' ' else 'display:none' end ver, "+
					"		CASE dbo.FN_ACTIVIDAD_DETALLE2 ('"+s_codigo+"', "+s_dia+", "+mes+", '"+s_anio+"', ID_ACTIVIDAD) WHEN 'M' then 1 when 'T' then 2 when 'MT' then 3 when 'N' then 4 when 'TN' then 5 when 'TD' then 6 when 'MN' then 7 when 'DN' then 8 else 0 end turno, "+
					"		ABREVIATURA "+
					" FROM  ACTIVIDADES	"+
					"WHERE 	ACTIVO = '1'	";
					//out.print(COMANDO);
			rset = stmt.executeQuery(COMANDO);
		while(rset.next())
		{
	//out.print(COMANDO);
%>
<tr>


	<td>
		<label class="checkbox-inline">
			<input size="8" disabled type="checkbox" <%=rset.getString("sel")%>  name="f_<%=rset.getString("ABREVIATURA")%>" id="f_<%=rset.getString("ABREVIATURA")%>" value="<%=rset.getString("ID_ACTIVIDAD")%>" class="px"> 
			<span class="lbl"> <font size="4"><b><%=rset.getString("NOMBRE")%></b> </font> </span>
		</label>
	</td>
	<td>&nbsp;&nbsp;</td>
	<td>&nbsp;&nbsp;</td>
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
 
 </tr>
<%
		}
%>

		</table>

    </form>