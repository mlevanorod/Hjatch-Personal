<%@ include file="../conectadb.jsp" %>

<%@ page contentType="text/html; charset=iso-8859-1" language="java"%>
<%@ page import="net.sf.json.JSONObject,net.sf.json.JSONArray"%>

<%
		String name = request.getParameter("name");
		JSONArray jsonArr = new JSONArray();
		
		JSONObject json=new JSONObject();

	COMANDO = " SELECT	CODIGO as ID, "+
				" 		UPPER(NOMBRE) as NOMBRE "+
				"  FROM MAESTRO "+
				" WHERE NOMBRE LIKE '%"+name.trim()+"%' "+
				"   AND CODHORA IN ('R','M3','T3','M1','M4')"+
				"	AND A.SITUACION NOT IN ('20')	"+
				" ORDER BY NOMBRE ";
	rset = stmt.executeQuery(COMANDO);
	while(rset.next()){
		json.put("name",""+rset.getString("NOMBRE")+"");
        json.put("value",""+rset.getString("id")+"");
        jsonArr.add(json);
	}
		out.println(jsonArr);
%>