<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb2.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>

<%

	String	s_mes  		= request.getParameter("f_mesx");
	String	s_anio 		= request.getParameter("f_aniox");
	String  s_servicio	= request.getParameter("f_serviciox");
	String	s_codigo 	= request.getParameter("f_codigo");
	String  tipo 		= "V";
	String  situacion 	= "";
	String  anio   		= new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
	   int  mes    		= Integer.parseInt(s_mes);
	   		mes    		= mes - 1;
	String  cod_hora 	= "";
	String  cod_tur 	= "";
	String  hora_ing 	= "";
	String  hora_sal 	= "";
	String  hora 		= "";
	int 	dias 		= 0;
	String  fecha_val	= "";
	String  dia_val		= "";
	String  dato        = "";

	COMANDO = " SELECT		M.SITUACION, "+
				"			M.CODHORA, "+
				"			H.CODTUR, "+
				"			H.HORING, "+
				"			H.HORSAL, "+
				"			H.HORA, "+
				"			H.Tipo, "+
				"			dbo.DiasEnMes(CONVERT(varchar(10), GETDATE(), 120)) as dias "+
				"  FROM		MAESTRO M "+
				"  JOIN		T_Horarios H "+
				"    ON		M.CODHORA = H.CODHOR	"+
				"WHERE  CODIGO =  '"+s_codigo+"'  ";
		//out.print(COMANDO);
		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
	
		situacion 	= rset.getString("SITUACION");
		cod_hora	= rset.getString("CODHORA");	
		cod_tur		= rset.getString("CODTUR");
		hora_ing	= rset.getString("HORING");
		hora_sal	= rset.getString("HORSAL");
		hora		= rset.getString("HORA");
		dias		= rset.getInt("dias");
	}

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
	
	for(int i=1; i<=dias; i++)
	{
		fecha_val = String.valueOf(i) + '/' + s_mes + '/' + s_anio;
		COMANDO2 = "SELECT		DATENAME(DW, '"+fecha_val+"' ) as DIA ";
		rset2 = stmt2.executeQuery(COMANDO2);
		if(rset2.next())
		{
			dia_val = rset2.getString("DIA");
		}

		COMANDO = "  SELECT		"+dia_val+" AS DATO "+
					"  FROM		T_Horarios "+
					" WHERE		CODHOR = '"+cod_hora+"' ";
		rset = stmt.executeQuery(COMANDO);
		if(rset.next())
		{
			dato = rset.getString("DATO");
		}
		//out.println(fecha_val);
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
						"		IdServDepartUnid,	"+
						"		SITUACION,		"+
						"		PRODUCTIVA "+
						"	) "+
						"VALUES(	 "+
						"		'"+s_codigo+"', "+
						"		CASE '"+dato+"' WHEN '1' THEN '"+cod_hora+"' ELSE 'D' END, "+ // AS CODACT
						"		'"+i+"', "+
						"		'"+s_mes+"', "+
						"		"+s_anio+", "+
						"		'"+tipo+"', "+
						"		0, "+ 
						"		CASE '"+dato+"' WHEN '1' THEN '"+hora_ing+"' ELSE '00:00' END, "+ // AS HORAI
						"		CASE '"+dato+"' WHEN '1' THEN '"+hora_sal+"' ELSE '00:00' END, "+ // AS HORAS
						"		CASE '"+dato+"' WHEN '1' THEN '"+hora+"' ELSE '0' END, "+
						"		0 , "+//AS FALTA
						"		0 , "+//AS TARDANZA
						"		0 , "+//AS PERMISO
						"		1 , "+//AS INDICADOR
						"		"+s_servicio+",	"+ // as SERVICIO
						"		'"+situacion+"',	"+// situacion
						"		0 "+//AS PRODUCTIVA 
						"  ) "; 
			int y = stmt.executeUpdate(COMANDO);
			//out.println(COMANDO);
			fecha_val = "";
	}
		out.print("1");
	}
%>