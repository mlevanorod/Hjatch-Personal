<%@ include file="../conectadb.jsp" %>
<%@ include file= "id.jsp" %>
<%@ include file= "../seguro.jsp" %>

<script language="Javascript">  document.oncontextmenu = function(){return false}</script>
<script language="Javascript">document.onselectstart = function(){ return false; }</script>

<%
            String z_id_tienda = "";
            String z_punto = "---";
            String h_tienda = "";
            String z_login = "";
            String z_nombre = "-";
            String z_apellido = "-";
            String z_dolar = "";
            int ctem = 0;
/*
//LIMPIO LOS TEMPORALES CREADOS ANTES DE LA FECHA DE HOY
            COMANDO = " delete from compras_det where estado = '0' and date_format(fecha_crea,'%Y%m%d') < date_format(sysdate(),'%Y%m%d') ";
            ctem = stmt.executeUpdate(COMANDO);

            COMANDO = " delete from compras where estado = '0' and date_format(fecha_reg,'%Y%m%d') < date_format(sysdate(),'%Y%m%d') ";
            ctem = stmt.executeUpdate(COMANDO);

            COMANDO = " delete from ventas_det where estado = '0' and date_format(fecha_crea,'%Y%m%d') < date_format(sysdate(),'%Y%m%d') ";
            ctem = stmt.executeUpdate(COMANDO);

            COMANDO = " delete from ventas where estado = '0' and date_format(fecha_reg,'%Y%m%d') < date_format(sysdate(),'%Y%m%d') ";
            ctem = stmt.executeUpdate(COMANDO);

            COMANDO = " delete from trasps_det where estado = '0' and date_format(fecha_reg,'%Y%m%d') < date_format(sysdate(),'%Y%m%d') ";
            ctem = stmt.executeUpdate(COMANDO);

            COMANDO = " delete from trasps where estado = '0' and date_format(fecha_reg,'%Y%m%d') < date_format(sysdate(),'%Y%m%d') ";
            ctem = stmt.executeUpdate(COMANDO);

            COMANDO = " delete from ordefab_mat where estado = '0' and date_format(fecha_reg,'%Y%m%d') < date_format(sysdate(),'%Y%m%d') ";
            ctem = stmt.executeUpdate(COMANDO);

            COMANDO = " delete from ordefab_det where estado = '0' and date_format(fecha_reg,'%Y%m%d') < date_format(sysdate(),'%Y%m%d') ";
            ctem = stmt.executeUpdate(COMANDO);

            COMANDO = " delete from ordefab where estado = '0' and date_format(fecha_reg,'%Y%m%d') < date_format(sysdate(),'%Y%m%d') ";
            ctem = stmt.executeUpdate(COMANDO);

            COMANDO = " delete from ajusts_det where estado = '0' and date_format(fecha_reg,'%Y%m%d') < date_format(sysdate(),'%Y%m%d') ";
            ctem = stmt.executeUpdate(COMANDO);

            COMANDO = " delete from ajusts where estado = '0' and date_format(fecha_reg,'%Y%m%d') < date_format(sysdate(),'%Y%m%d') ";
            ctem = stmt.executeUpdate(COMANDO);
*/
            COMANDO = " select	login  from datos_personales where id_personal = '"+id_personal.trim()+"' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                z_login = rset.getString("login");
            }

            COMANDO = " select id_tienda from usuarios where id_personal = '" + id_personal.trim() + "' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                z_id_tienda = rset.getString("id_tienda");
            }

            COMANDO = " select upper(valor) nombre from valores where id_valor = '" +id_modulo.trim() +"' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                h_tienda = rset.getString("nombre");
            }

            COMANDO = " select upper(nombre) nombre from puntos where id_tienda = '" + z_id_tienda.trim() + "' and ip = '" + s_ip.trim() + "' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                z_punto = rset.getString("nombre");
            }

            COMANDO = " select isnull(valor,0) dolar from valores where id_valor = '11011121512809319616' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                z_dolar = rset.getString("dolar");
            }

            COMANDO = " select upper(isnull(nombre,'-')) nombre, " +
                    " upper(isnull(apellido,'-')) apellido " +
                    " from datos_personales " +
                    " where id_personal = '" + id_personal.trim() + "' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                z_apellido = rset.getString("apellido") + " ";
                z_nombre = rset.getString("nombre") + " ";
            }

            z_nombre = z_nombre.substring(0, z_nombre.indexOf(" "));
            z_apellido = z_apellido.substring(0, z_apellido.indexOf(" "));
%>

<html>
    <head>
        <link rel="stylesheet" href="../css/head.css" type="text/css" media="screen" />
    </head>
    
    <body background="../images/head_1.jpg" leftmargin=0 topmargin=0>
        <table width="400px" cellspacing="8" cellpadding="1" border="0">
            <tr>
                <td align="right" width="65px">Usuario&nbsp;:&nbsp;</td>
                <th><font size="1"><%=z_nombre.trim()%>&nbsp;<%=z_apellido.trim()%></font>&nbsp;&nbsp;/&nbsp;&nbsp;<font color="#FFFF00" size="1"><%=z_login.trim()%></font>&nbsp;</th>
            </tr>
            <tr>
                <td align="right" width="65px">Area&nbsp;:&nbsp;</td>
                <th><%=h_tienda.trim()%></th>
            </tr>
            <tr>
                <td align="right" width="65px">Punto IP&nbsp;:&nbsp;</td>
                <th><font size="1"><%=z_punto.trim()%></font>&nbsp;&nbsp;/&nbsp;&nbsp;<font color="#FFFF00" size="1"><%=s_ip.trim()%></font>&nbsp;&nbsp;/&nbsp;&nbsp;<font color="#FFFF00">$&nbsp;</font><font size="1" color="#FFFF00"><%=z_dolar.trim()%></font>&nbsp;</th>
            </tr>
        </table>
    </body>
</html>

<%@ include file="../cierradb.jsp" %>