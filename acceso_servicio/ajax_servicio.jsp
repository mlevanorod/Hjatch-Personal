<%@ include file="../conectadb.jsp" %>

<%@ page contentType="text/html; charset=iso-8859-1" language="java"%>
<%@ page import="net.sf.json.JSONObject,net.sf.json.JSONArray"%>

<%
		int id = Integer.parseInt(request.getParameter("id"));
		JSONArray jsonArr = new JSONArray();
		
		JSONObject json=new JSONObject();

	COMANDO = "    SELECT   IdServDepartUnid as id, "+
	              "         Nombre, "+
	              "         codigo "+
	              "  FROM   dbo.ServicioDepartUnidad "+
	              " WHERE   ACTIVO = 1 "+
	              "   and   IdDepartUnid = "+id+" "+
	              " ORDER  BY  CODIGO ASC ";
	        rset  = stmt.executeQuery(COMANDO);
	      while(rset.next()){
		//json.put("name",""+rset.getString("NOMBRE")+"");
        //json.put("value",""+rset.getString("id")+"");        
        //jsonArr.add(json);
         out.println('<option value="'+rset.getString("id")+'">'+rset.getString("NOMBRE")+'</option>');
	}
		//out.println(jsonArr);
%>
