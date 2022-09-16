<%@ include file="../conectadb.jsp" %>

<%
	String s_unidad		= request.getParameter("f_unidad_upd");



        COMANDO = "    SELECT   IdServDepartUnid, "+
                      "         Nombre "+
                      "  FROM   dbo.ServicioDepartUnidad "+
                      " WHERE   ACTIVO = 1 "+
                      "   and	IdDepartUnid = "+s_unidad+" "+
                      " ORDER  BY  CODIGO ASC ";
            rset = stmt.executeQuery(COMANDO);
	while(rset.next())
	{
		out.print("<option value="+rset.getString("IdServDepartUnid")+" > "+rset.getString("nombre")+" </option> ");
	}


%>