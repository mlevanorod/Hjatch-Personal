<%@ include file="../conectadb.jsp" %>

<%@ page contentType="text/html; charset=iso-8859-1" language="java"%>
<%@ page import="net.sf.json.JSONObject,net.sf.json.JSONArray"%>

<%
		String name = request.getParameter("name");
		String s_codunid = request.getParameter("f_codunid");
		JSONArray jsonArr = new JSONArray();
		
		JSONObject json=new JSONObject();

	COMANDO = " SELECT	A.CODIGO as ID, "+
				" 		A.CODIGO + '-' + UPPER(A.NOMBRE) as NOMBRE "+
				"  FROM MAESTRO A "+
				"  JOIN dbo.ServicioMaestro B "+
				"    ON	A.CODIGO = B.CODIGO "+
				" WHERE B.idservdepartunid = '"+s_codunid+"' "+
				"   AND A.CODHORA IN ('R','M3','T3') "+
				"   AND A.CODIGO LIKE '%"+name.trim()+"%' "+
				" ORDER BY A.NOMBRE ";
	rset = stmt.executeQuery(COMANDO);
	while(rset.next()){
		json.put("name",""+rset.getString("NOMBRE")+"");
        json.put("value",""+rset.getString("id")+"");
        jsonArr.add(json);
	}
		out.println(jsonArr);
%>