<%@ include file="../conectadb3.jsp" %>
<%@ include file= "id.jsp" %> 

<%	String s_q	= request.getParameter("q");
	
	COMANDO3 = " SELECT especialidad as id, "+
			" UPPER(nombre) as NOMBRE  "+
			" FROM especialidad "+
			" WHERE "+
			" 		UPPER(NOMBRE) LIKE UPPER('%"+s_q.trim()+"%') "+
			" ORDER BY nombre ASC ";
	//out.print(COMANDO);
	rset3 = stmt3.executeQuery(COMANDO3);
	while(rset3.next()){
		out.print(rset3.getString("NOMBRE")+"|"+rset3.getString("id")+"\n");
	}
%>