
<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb2.jsp" %>
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
			String s_area		= request.getParameter("f_area");
            int exct = 0;
            int exct2 = 0;

            COMANDO = " select * " +
                    " from datos_personales " +
                    " where upper(login) = upper('" + x_login.trim() + "') " +
                    " and id_personal <> '" + s_id_personal.trim() + "' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                out.print("2"); //login ya existe
            } else {
                /*COMANDO = " select * " +º
                " from usuarios " +
                " where id_personal = '" + s_id_personal + "' " +
                " and id_tienda = '" + s_tienda + "' ";
                rset = stmt.executeQuery(COMANDO);
                if (rset.next()) {*/
                //out.print("3"); //persona ya pertenece a la tienda
/*COMANDO = " update datos_personales set " +
                " login = upper('" + x_login.trim() + "'), " +
                " passwd = '" + s_passwd + "', " +
                " user_upd = '" + id_personal.trim() + "', " +
                " fecha_upd = sysdate() " +
                " where id_personal = '" + s_id_personal.trim() + "' ";
                exct = stmt.executeUpdate(COMANDO);
                out.print("1");*/
                /*} else {*/

                /*COMANDO = " insert into usuarios(id_personal, id_tienda, user_upd, fecha_upd) values ('" + s_id_personal + "', '" + s_tienda + "', '" + id_personal + "', sysdate()) ";
                exct = stmt.executeUpdate(COMANDO);*/

                COMANDO = " update datos_personales set " +
						"		codigo = '"+s_codigo+"', "+
						"		nombre = upper('"+s_nombre+"'), "+
						"		apellido = upper('"+s_apellido+"'), "+
					//	"		login = '"+x_login+"',  "+
					//	"		passwd = '"+s_passwd+"',  "+
						"		dni = '"+s_dni+"', "+
						"		obs = '"+s_obs+"', "+
						"		sexo = '"+sexo+"', "+
						"		celular = '"+s_celular+"', "+
                        " user_upd = '" + id_personal + "', " +
                        " fecha_upd = CONVERT(VARCHAR(10), SYSDATETIME(), 103) " +
                        " where id_personal = '" + s_id_personal + "' ";
               exct = stmt.executeUpdate(COMANDO);
			  //  out.print(COMANDO);


                out.print("1");
//}
            }
%>

<%@ include file= "../cierradb2.jsp" %>
<%@ include file= "../cierradb.jsp" %>