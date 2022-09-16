<%@ include file="../conectadb.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>

<%

	String	s_mes  		= request.getParameter("f_mesx");
	String	s_anio 		= request.getParameter("f_aniox");
	String	s_codigo 	= request.getParameter("f_codigo");
	String  s_servicio 	= "";
	String  s_situacion = "";
	String  tipo 		= "2";
	String  anio   		= new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
	   int  mes    		= Integer.parseInt(s_mes);
	   		mes    		= mes - 1;


	COMANDO = "SELECT	S.IdServDepartUnid AS IdServDepartUnid, "+
				"		M.SITUACION as SITUACION"+
				"  FROM	ServicioMaestro S "+
				"  JOIN	MAESTRO M "+
				"    ON	S.Codigo = M.CODIGO "+
				" WHERE	S.Codigo = '"+s_codigo+"' ";

		rset = stmt.executeQuery(COMANDO);

	if(rset.next())
	{
		s_servicio  = rset.getString("IdServDepartUnid");
		s_situacion = rset.getString("SITUACION");
	}

	//out.print(tipo);

	COMANDO = " SELECT 	* "+
				" FROM	ASISTENCIA	"+
				"WHERE  CODIGO =  '"+s_codigo+"'  "+
				"  AND  "+anio+" = '"+s_anio+"'	"+
				"  AND  MES  = '"+s_mes+"'  ";
		//out.print(COMANDO);
		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
	
		out.print("2");
	}else{
	
	COMANDO = "INSERT INTO ASISTENCIA "+
					"	( "+
					"		CODIGO, "+
					"		CODACT, "+
					"		DIA, "+
					"		MES, "+
					"		"+anio+", "+
					"		TIPO, "+
					"		MIN_ADIC,	"+
					"		HORAI, "+
					"		HORAS, "+
					"		HORA_PRG, "+
					"		FALTA, "+
					"		TARDANZA, "+
					"		PERMISO, "+
					"		INDICADOR, "+
					"		SITUACION,	"+
					"		IdServDepartUnid,  "+
					"		PRODUCTIVA "+
					"	) "+
					"SELECT	 "+
					"		'"+s_codigo+"', "+
					"		'D' AS CODACT, "+
					"		DIA, "+
					"		MES, "+
					"		"+s_anio+", "+
					"		'V', "+
					"		MIN_ADIC, "+
					"		'00:00' AS HORAI, "+
					"		'00:00' AS HORAS, "+
					"		HORA_PRG, "+
					"		0 AS FALTA, "+
					"		0 AS TARDANZA, "+
					"		0 AS PERMISO, "+
					"		1 AS INDICADOR, "+
					"		'"+s_situacion+"',	"+
					"		"+s_servicio+" as Servicio,	"+
					"		0 AS PRODUCTIVA "+
					"  FROM	ASISTENCIA "+
					" WHERE	"+anio+" = '2017' "+
					"   AND	MES = '"+s_mes+"' "+
					"   AND	CODIGO = '084005' "; 
		//out.print(COMANDO);
		int y = stmt.executeUpdate(COMANDO);
		out.print("1");
	}
%>