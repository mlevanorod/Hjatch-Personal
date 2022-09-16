<%@ include file="../conectadb.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>

<%

	String	s_mes  		= request.getParameter("f_mesx");
	String	s_anio 		= request.getParameter("f_aniox");
	String  s_servicio	= request.getParameter("f_serviciox");
	String	s_codigo = request.getParameter("f_codigo");
	String  tipo = "V";
	String  situacion = "";
	String  anio   = new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
	   int  mes    = Integer.parseInt(s_mes);
	   		mes    = mes - 1;


	COMANDO = " SELECT 	SITUACION "+
				" FROM	MAESTRO	"+
				"WHERE  CODIGO =  '"+s_codigo+"'  ";
		//out.print(COMANDO);
		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
	
		situacion = rset.getString("SITUACION");
	}

	COMANDO = " SELECT 	* "+
				" FROM	ASISTENCIA_DEVOLUCION	"+
				"WHERE  CODIGO =  '"+s_codigo+"'  "+
				"  AND  "+anio+" = '"+s_anio+"'	"+
				"  AND  MES  = '"+s_mes+"'  ";
		//out.print(COMANDO);
		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
	
		out.print("2");
	}else{
	

	COMANDO = "INSERT INTO ASISTENCIA_DEVOLUCION "+
					"	( "+
					"		CODIGO, "+
					"		CODACT, "+
					"		DIA, "+
					"		MES, "+
					"		"+anio+", "+
					"		TIPO, "+
					"		HORAI, "+
					"		HORAS, "+
					"		HORA_PRG, "+
					"		FALTA, "+
					"		TARDANZA, "+
					"		PERMISO, "+
					"		INDICADOR, "+
					"		IdServDepartUnid,	"+
					"		SITUACION,		"+
					"		PRODUCTIVA "+
					"	) "+
					"SELECT	 "+
					"		'"+s_codigo+"', "+
					"		'D' AS CODACT, "+
					"		DIA, "+
					"		MES, "+
					"		"+s_anio+", "+
					"		'"+tipo+"', "+
					"		'00:00' AS HORAI, "+
					"		'00:00' AS HORAS, "+
					"		HORA_PRG, "+
					"		0 AS FALTA, "+
					"		0 AS TARDANZA, "+
					"		0 AS PERMISO, "+
					"		1 AS INDICADOR, "+
					"		"+s_servicio+" as SERVICIO,	"+
					"		'"+situacion+"',	"+
					"		0 AS PRODUCTIVA "+
					"  FROM	ASISTENCIA "+
					" WHERE	"+anio+" = '"+s_anio+"' "+
					"   AND	MES = '"+s_mes+"' "+
					"   AND	CODIGO = '"+s_codigo+"' "; 
		//out.print(COMANDO);
		int y = stmt.executeUpdate(COMANDO);
		out.print("1");
	}
%>