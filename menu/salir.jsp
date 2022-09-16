<%
            HttpSession xsession = request.getSession(true);

            xsession.setAttribute("id_punto", "");
            xsession.setAttribute("id_modulo", "");
            xsession.setAttribute("accesos", "");
            xsession.setAttribute("id_session", "");
            xsession.setAttribute("login", "");
            xsession.setAttribute("ip", "");
            xsession.setAttribute("id_personal", "");
            xsession.setAttribute("id_tienda", "");
%>
<html> <body onload="parent.location.href='../index.jsp';"></body> </html>

