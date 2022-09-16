<%@ include file="../conectadb.jsp" %>
<%@ include file= "id.jsp" %>
<%@ include file= "../seguro.jsp" %>

<%
            String s_estado = request.getParameter("f_estado").trim();
            String s_id_personal = request.getParameter("f_id_personal").trim();
            int rsets = 0;

            COMANDO = " update datos_personales set " +
                    " estado = '" + s_estado.trim() + "', " +
                    " user_upd = '" + id_personal.trim() + "', " +
                    " fecha_upd = CONVERT(VARCHAR(8), SYSDATETIME(), 3)  " +
                    " where id_personal = '" + s_id_personal.trim() + "' ";
            rsets = stmt.executeUpdate(COMANDO);
            out.print("1");

%>