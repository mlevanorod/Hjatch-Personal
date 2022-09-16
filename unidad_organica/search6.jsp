<%@ include file="../conectadb.jsp" %>

<%@ page contentType="text/html; charset=iso-8859-1" language="java"%>
<%@ page import="net.sf.json.JSONObject,net.sf.json.JSONArray"%>

<%
		String name = request.getParameter("name");
		JSONArray jsonArr = new JSONArray();
		
		JSONObject json=new JSONObject();

	COMANDO = " SELECT	CODIGO as ID, "+
				" 		CODIGO + '-' + UPPER(NOMBRE) as NOMBRE "+
				"  FROM MAESTRO "+
				" WHERE CODIGO LIKE '%"+name.trim()+"%' "+
				"	AND CODIGO not in (SELECT CODIGO from dbo.ServicioMaestro ) "+
				" ORDER BY NOMBRE ";
	rset = stmt.executeQuery(COMANDO);
	while(rset.next()){
		json.put("name",""+rset.getString("NOMBRE")+"");
        json.put("value",""+rset.getString("id")+"");
        jsonArr.add(json);
	}
		out.println(jsonArr);
%>