<%@ include file="../conectadb.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>

<%

	String	s_codigo	=	request.getParameter("f_id_licencia");
	String	s_anio		=	request.getParameter("f_anio");
	String	s_mes		=	request.getParameter("f_mes");
	String  s_fecha_ini =  	request.getParameter("f_fecha_ini");
	String  s_fecha_fin =  	request.getParameter("f_fecha_fin");
	String  s_obs 		=   request.getParameter("f_observacion");
	String  s_licencia  =  	request.getParameter("f_detalle_licencia");

	COMANDO = "INSERT INTO LICENCIA "+
					"	SELECT		'"+s_codigo+"', "+
						"			L.CODINI, "+
						"			L.NOMBRE, "+
						"			LJ.CODIGO, "+
						"			LJ.NOMBRE, "+
						"			'"+s_fecha_ini+"', "+
						"			'"+s_fecha_fin+"', "+
						"			DATEDIFF(DAY,'"+s_fecha_ini+"','"+s_fecha_fin+"') +1, "+
						"			'', "+
						"			'"+s_obs+"', "+
						"			null, "+
						"			null, "+
						"			'X' "+
						"  FROM		T_LicenciaJustifica LJ "+
						"  JOIN		T_Licencia L "+
						"    ON		LJ.TIPJUS = L.CODIGO "+
						" WHERE		VALOR = 'L' "+
						"   AND		LJ.CODIGO = '"+s_licencia+"' "; 
		//out.print(COMANDO);
		int y = stmt.executeUpdate(COMANDO);
		out.print("1");
%>
