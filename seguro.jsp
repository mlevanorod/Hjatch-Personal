<%
            request.setCharacterEncoding("UTF-8");
            HttpSession xsession = request.getSession(true);
            String id_tienda = "";
            String id_personal = "";
            String s_ip = "";
            String lista_ip_user = "";
            String s_id_sesion = "";
            String accesos = "";
            String fecha = "";
            String id_session = "";
            String igv = "";
            String dolar = "";
            String id_punto = "";
            String id_modulo = "";
            String iprint = "";
            String u_estado = "";
            String a_act = "";
            String stock_min = "";
			String puntox	= "";
            String usu_nombre = "";
            int ano_act = 0;

            Date DtActual01 = new Date();
            id_punto = (String) xsession.getValue("id_punto");
            id_modulo = (String) xsession.getValue("id_modulo");
            id_tienda = (String) xsession.getValue("id_sede");
            if ((id_tienda == null) || (id_tienda.equals(""))) {
                id_tienda = "123";
            }

            id_personal = (String) xsession.getValue("id_personal");
            if ((id_personal == null) || (id_personal.equals(""))) 
            {
%>
                <%=id_personal%>
			    <meta http-equiv='REFRESH' target="_top" content='0; url=../menu/salir.jsp'>
<%          }

            s_id_sesion = (String) xsession.getValue("id_session");
            s_ip = (String) xsession.getValue("ip");
            accesos = (String) xsession.getValue("accesos") + " --- GEN"; //PAL PPR

            if (s_ip == null) {
                s_ip = request.getRemoteAddr();
            }

            COMANDO3 = " select isnull(estado,'0') as estado from usuario_web where dni = '" + id_personal + "' ";
            rset3 = stmt3.executeQuery(COMANDO3);
            if (rset3.next()) {
                u_estado = rset3.getString("estado");
                if (!u_estado.equals("1")) {
%>
			    <meta http-equiv='REFRESH' target="_top" content='0; url=../menu/salir.jsp'>
<%              }
            }

            id_session = xsession.getId();
            if (id_session == null) 
            {
%>
                <meta http-equiv='REFRESH' target="_top" content='0; url=../menu/salir.jsp'>
<%          }
%>

<%
         /*   COMANDO = " select '22/08/2014' fecha from void ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) { */
                fecha = "22/08/2014";
            //}

            if (accesos.indexOf(id_jsp) == -1)
            {
%>
                <meta http-equiv='REFRESH' target="_top" content='0; url=../menu/salir.jsp'>
<%          }

            String s_login = (String) xsession.getValue("login");

            COMANDO3 = " select " +
                    " usu_nombre " +
                    " from usuario_web " +
                    " where dni = '" + id_personal + "' ";
            rset3 = stmt3.executeQuery(COMANDO3);
            rset3.next();
                usu_nombre = rset3.getString("usu_nombre");


            //COMANDO = " select '2014' ano from void ";
            //rset = stmt.executeQuery(COMANDO);
            //if (rset.next()) {
                a_act = "2014";
            //}

            ano_act = Integer.parseInt(a_act);
%>