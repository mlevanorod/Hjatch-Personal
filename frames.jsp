<%@ include file="conectadb3.jsp"%>
<%@ include file="conectadb2.jsp"%>

<%          //String s_ip = "";
            String accesos = "---";
            String s_id_session = "";
            HttpSession xsession = request.getSession(true);
            s_id_session = xsession.getId();
            String s_ip = request.getHeader("X-FORWARDED-FOR");
            if(s_ip == null){
                s_ip = request.getRemoteAddr();
            }
            //InetAddress thisIp = InetAddress.getLocalHost();
            //s_ip = thisIp.get getHostAddress();
            xsession.setMaxInactiveInterval(-1); // cambiar a 60 seg.
            String s_id_jsp = "";
            Date DtActual = new Date();
            String s_login = request.getParameter("f_login").trim();
            String s_passwd = request.getParameter("f_passwd");
            String s_id_personal = "";
            String id_modulo = "";
            String nomb_modulo = "CONTROL DE ASISTENCIA";
            String s_id_tienda = "";
            String s_id_punto = "---";
            int ctem = 0;

            if ((s_login == null) || (s_passwd == null)) {%>    
                <jsp:forward page="index.html"/>
<%          } else {%>

<%          }

            COMANDO3 = " select      u.dni as id_personal, "+
                        "            a.ID_AM as id_modulo "+
                        "  from      usuario_web u "+
                        "  join      ACCESO_MODULO a "+
                        "    on       u.DNI = a.DNI "+
                        " where      u.dni = '"+s_login+"'  "+
                        "   and      u.CLAVE = '"+s_passwd+"' "+
                        "   and      u.estado = '1'  "+
                        "   and      a.NOMBRE = '"+nomb_modulo+"' ";
            rset3 = stmt3.executeQuery(COMANDO3);
            if (rset3.next()) {
                s_id_personal = rset3.getString("id_personal").trim();
                id_modulo = rset3.getString("id_modulo");
                s_id_tienda = "1234";

                xsession.setAttribute("id_punto", s_id_punto);
                xsession.setAttribute("id_modulo", id_modulo);
                xsession.setAttribute("accesos", accesos);
                xsession.setAttribute("id_session", s_id_session);
                xsession.setAttribute("login", s_login);
                xsession.setAttribute("ip", s_ip);
                xsession.setAttribute("id_personal", s_id_personal);
                xsession.setAttribute("id_sede", s_id_tienda);
                out.print("1");


            } else {
                out.print("2");
            }
%>

<%@ include file="cierradb3.jsp"%>