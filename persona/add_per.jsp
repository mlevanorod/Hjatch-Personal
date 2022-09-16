<%@ include file="../conectadb.jsp" %>
<%@ include file= "id.jsp" %>
<%@ include file="../seguro.jsp" %>

<%
            String s_nombre 	= request.getParameter("f_nombre");
			String s_id_personal 	= request.getParameter("f_id_personal");
			String s_apellido 	= request.getParameter("f_apellido");
			String s_dni		= request.getParameter("f_dni");
			String s_codigo		= request.getParameter("f_codigo");
			String sexo			= request.getParameter("f_sexo");
			String x_login		= request.getParameter("f_login");
			String s_passwd		= request.getParameter("f_passwd");
			String s_celular	= request.getParameter("f_celular");
			String s_obs		= request.getParameter("f_obs");
            int exct = 0;
            int exct2 = 0;

            COMANDO = " select * " +
                    " from datos_personales " +
                    " where upper(login) = upper('" + x_login.trim() + "') " +
                    " and id_personal <> '" + s_id_personal.trim() + "' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                out.print("3");
            } else {
                COMANDO = " insert into datos_personales "+ 
								"(id_personal, "+
								" codigo, "+ 
								" nombre, "+ 
								" apellido, "+ 
								//" login, "+ 
								//" passwd, "+ 
								" dni, "+ 
								" obs, "+ 
								" sexo, "+ 
								" celular, "+ 
								" user_crea, "+ 
								" estado,  "+
								" tipo, "+
								" fecha_crea ) "+ 
								" values ( dbo.CREA_ID(20,'N'), "+
								" '"+s_codigo+"', "+
								" upper('"+s_nombre+"'), "+
								" upper('"+s_apellido+"'), "+
								//" '"+x_login+"',  "+
							//	" '"+s_passwd+"',  "+
								" '"+s_dni+"', "+
								" '"+s_obs+"', "+
								" '"+sexo+"', "+
								" '"+s_celular+"', "+
								" '" + id_personal + "', " +
								" '1', "+
								" 'P', "+
								" CONVERT(VARCHAR(10), SYSDATETIME(), 103) ) ";
								
//               out.print(COMANDO);
			    exct = stmt.executeUpdate(COMANDO);

                out.print("1");
            }   
%>

<%@ include file= "../cierradb.jsp" %>