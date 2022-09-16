<%@ include file="../conectadb.jsp" %>

<%@ page contentType="text/html; charset=iso-8859-1" language="java"%>
<%@ page import="net.sf.json.JSONObject,net.sf.json.JSONArray"%>

<%
		JSONArray jsonArr = new JSONArray();
		
		JSONObject json=new JSONObject();

	COMANDO =  " SELECT       NOMBRE   FROM        MAESTRO ";


	rset = stmt.executeQuery(COMANDO);
	while(rset.next()){
		json.put("NOMBRE",""+rset.getString("NOMBRE")+"");
        jsonArr.add(json);
	}
		out.println(jsonArr);
%>