<%@ include file="../conectadb.jsp" %>
<%@ include file= "id.jsp" %>
<%@ include file= "../seguro.jsp" %>

<%
            String s_id_valor = request.getParameter("id_valor").trim();
            String s_valor = request.getParameter("valor").trim();
            int rsets = 0;

            COMANDO = " update valores set " +
                    " valor = upper('" + s_valor.trim() + "'), " +
                    " user_upd = '" + id_personal.trim() + "', " +
                    " fecha_upd = CONVERT (date, SYSDATETIME()) " +
                    " where id_valor = '" + s_id_valor.trim() + "' ";
            rsets = stmt.executeUpdate(COMANDO);
%>