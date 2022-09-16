<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../conectadb.jsp" %>
<%@ include file= "id.jsp" %>
<%@ include file="../seguro.jsp" %>
<%@ include file="../cleanTemp.jsp" %>
<style> #insumos td{ line-height : 19px; border-width : 1; border-style : solid; border-color : #EBEBEB; } </style>
<html>    
    <head>
        <script src="../js/jquery-1.3.2.min.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="../css/style2.css" />
        <script language="Javascript">document.oncontextmenu = function(){return false}</script>
        <!--<script language="Javascript">document.onselectstart = function(){ return false; }</script>-->
        <script type="text/javascript" language="Javascript">
            $(document).ready(inicializarEventos);
            
            function inicializarEventos(){
                $('#datos1 :text').addClass("inputext");
                $('#datos1 :submit').addClass("inpusubmit");
                $('#datos1 :button').addClass("inpubutton");
                $('#datos1 :text').keyup(updValor);
            }
            
            function updValor(){
				alert('entro');
                var idv = $(this).attr('id');
                var val = $(this).val();
                $.post("updValor.jsp",{ id_valor:$.trim(idv), valor:$.trim(val) } );
            }
        </script>
    </head>
    <%
            String z_nombre = "";
            String z_razon = "";
            String z_ruc = "";
            String z_direcc = "";
            String z_telef = "";
            String z_rpc = "";
            String z_rpm = "";
            String z_nextel = "";
            String z_email = "";
            String z_website = "";
            String z_minimo = "";
            String z_maximo = "";
            String z_dolar = "";
            String z_igv = "";
            String z_credito = "";
            String z_venta = "";

            COMANDO = " select isnull(upper(valor),'-') valor from valores where id_valor = '11020212552901091031' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                z_nombre = rset.getString("valor"); if(z_nombre.equals("-")){ z_nombre = ""; }
            }

            COMANDO = " select isnull(upper(valor),'-') valor from valores where id_valor = '11100619570505515476' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                z_razon = rset.getString("valor"); if(z_razon.equals("-")){ z_razon = ""; }
            }

            COMANDO = " select isnull(upper(valor),'-') valor from valores where id_valor = '11011121495201303497' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                z_ruc = rset.getString("valor"); if(z_ruc.equals("-")){ z_ruc = ""; }
            }

            COMANDO = " select isnull(upper(valor),'-') valor from valores where id_valor = '11020212575508358914' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                z_direcc = rset.getString("valor"); if(z_direcc.equals("-")){ z_direcc = ""; }
            }

            COMANDO = " select isnull(upper(valor),'-') valor from valores where id_valor = '11020213000804159395' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                z_telef = rset.getString("valor"); if(z_telef.equals("-")){ z_telef = ""; }
            }
            
            COMANDO = " select isnull(upper(valor),'-') valor from valores where id_valor = '11092822222201556299' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                z_rpc = rset.getString("valor"); if(z_rpc.equals("-")){ z_rpc = ""; }
            }
            
            COMANDO = " select isnull(upper(valor),'-') valor from valores where id_valor = '11092822230801016375' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                z_rpm = rset.getString("valor"); if(z_rpm.equals("-")){ z_rpm = ""; }
            }
            
            COMANDO = " select isnull(upper(valor),'-') valor from valores where id_valor = '11092822234300412978' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                z_nextel = rset.getString("valor"); if(z_nextel.equals("-")){ z_nextel = ""; }
            }
            
            COMANDO = " select isnull(upper(valor),'-') valor from valores where id_valor = '11020213002703798298' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                z_email = rset.getString("valor"); if(z_email.equals("-")){ z_email = ""; }
            }
            
            COMANDO = " select isnull(upper(valor),'-') valor from valores where id_valor = '11020213004604733104' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                z_website = rset.getString("valor"); if(z_website.equals("-")){ z_website = ""; }
            }
            
            COMANDO = " select isnull(upper(valor),'-') valor from valores where id_valor = '11012417240805247740' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                z_minimo = rset.getString("valor"); if(z_minimo.equals("-")){ z_minimo = ""; }
            }
            
            COMANDO = " select isnull(upper(valor),'-') valor from valores where id_valor = '11100620352304883456' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                z_maximo = rset.getString("valor"); if(z_maximo.equals("-")){ z_maximo = ""; }
            }
            
            COMANDO = " select isnull(upper(valor),'-') valor from valores where id_valor = '11011121512809319616' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                z_dolar = rset.getString("valor"); if(z_dolar.equals("-")){ z_dolar = ""; }
            }
            
            COMANDO = " select isnull(upper(valor),'-') valor from valores where id_valor = '11011121501209014979' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                z_igv = rset.getString("valor"); if(z_igv.equals("-")){ z_igv = ""; }
            }
            
            COMANDO = " select isnull(upper(valor),'-') valor from valores where id_valor = '11100717342704035841' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                z_credito = rset.getString("valor"); if(z_credito.equals("-")){ z_credito = ""; }
            }
            
            COMANDO = " select isnull(upper(valor),'-') valor from valores where id_valor = '11100717334804269631' ";
            rset = stmt.executeQuery(COMANDO);
            if (rset.next()) {
                z_venta = rset.getString("valor"); if(z_venta.equals("-")){ z_venta = ""; }
            }
    %>
    <body>
        <table align="center" border="1">
            <form id="datos1" name="datos1">
                <tr>
                    <td colspan="9" class="titulo"><font size="1"><b>&nbsp;PARAMETRIZACIONES GENERALES&nbsp;</b></font></td>
                </tr>
                <tr>
                    <td>
                        <table align="center">
                            <tr>
                                <td align="center" colspan="2">&nbsp;<font size="1" color="#AB3939"><b>-&nbsp;Datos&nbsp;de&nbsp;la&nbsp;Sociedad&nbsp;-</b></font>&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right"><b>N</b>ombre Comercial&nbsp;:&nbsp;</td>
                                <td><input type="text" size="47" maxlength="90" value="<%=z_nombre.trim()%>" id="11020212552901091031" name="11020212552901091031"></td>
                            </tr>
                            <tr>
                                <td align="right"><b>R</b>azon Social&nbsp;:&nbsp;</td>
                                <td><input type="text" size="47" maxlength="90" value="<%=z_razon.trim()%>" id="11100619570505515476" name="11100619570505515476"></td>
                            </tr>
                            <tr>
                                <td align="right"><b>R</b>UC&nbsp;:&nbsp;</td>
                                <td><input type="text" size="14" maxlength="12" value="<%=z_ruc.trim()%>" id="11011121495201303497" name="11011121495201303497"></td>
                            </tr>
                            <tr>
                                <td align="right"><b>D</b>irecci&oacute;n&nbsp;:&nbsp;</td>
                                <td><input type="text" size="47" maxlength="90" value="<%=z_direcc.trim()%>" id="11020212575508358914" name="11020212575508358914"></td>
                            </tr>
                            <tr>
                                <td align="right"><b>T</b>el&oacute;fono&nbsp;:&nbsp;</td>
                                <td>
                                    <table align="left">
                                        <tr>
                                            <td><input type="text" size="14" maxlength="15" value="<%=z_telef.trim()%>" id="11020213000804159395" name="11020213000804159395"></td>
                                            <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>R</b>PC&nbsp;:&nbsp;</td>
                                            <td><input type="text" size="14" maxlength="15" value="<%=z_rpc.trim()%>" id="11092822222201556299" name="11092822222201556299"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="right"><b>N</b>extel&nbsp;:&nbsp;</td>
                                <td>
                                    <table align="left">
                                        <tr>
                                            <td><input type="text" size="14" maxlength="15" value="<%=z_nextel.trim()%>" id="11092822234300412978" name="11092822234300412978"></td>
                                            <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>R</b>PM&nbsp;:&nbsp;</td>
                                            <td><input type="text" size="14" maxlength="15" value="<%=z_rpm.trim()%>" id="11092822230801016375" name="11092822230801016375"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="right"><b>E</b>-mail&nbsp;:&nbsp;</td>
                                <td><input type="text" size="40" maxlength="90" value="<%=z_email.trim()%>" id="11020213002703798298" name="11020213002703798298"></td>
                            </tr>
                            <tr>
                                <td align="right"><b>W</b>eb Site&nbsp;:&nbsp;</td>
                                <td><input type="text" size="40" maxlength="90" value="<%=z_website.trim()%>" id="11020213004604733104" name="11020213004604733104"></td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">&nbsp;<font size="1" color="#AB3939"><b>-&nbsp;Sem�rofo&nbsp;Inventario / default&nbsp;-</b></font>&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right"><b>S</b>tock M&iacute;nimo&nbsp;:&nbsp;</td>
                                <td>
                                    <table align="left">
                                        <tr>
                                            <td><input type="text" size="5" maxlength="6" value="<%=z_minimo.trim()%>" id="11012417240805247740" name="11012417240805247740"></td>
                                            <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>S</b>tock Medio&nbsp;:&nbsp;</td>
                                            <td><input type="text" size="5" maxlength="6" value="<%=z_maximo.trim()%>" id="11100620352304883456" name="11100620352304883456"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">&nbsp;<font size="1" color="#AB3939"><b>-&nbsp;Compras&nbsp;y&nbsp;Ventas / default&nbsp;-</b></font>&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right"><b>C</b>ambio Dolar&nbsp;:&nbsp;</td>
                                <td>
                                    <table align="left">
                                        <tr>
                                            <td><input type="text" size="5" maxlength="5" value="<%=z_dolar.trim()%>" id="11011121512809319616" name="11011121512809319616"></td>
                                            <td align="right"><font size="1">S/.</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>I</b>GV&nbsp;:&nbsp;</td>
                                            <td><input type="text" size="5" maxlength="2" value="<%=z_igv.trim()%>" id="11011121501209014979" name="11011121501209014979"></td>
                                            <td><font size="1">%</font></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="right"><b>C</b>redito Compras&nbsp;:&nbsp;</td>
                                <td>
                                    <table align="left">
                                        <tr>
                                            <td><input type="text" size="5" maxlength="3" value="<%=z_credito.trim()%>" id="11100717342704035841" name="11100717342704035841"></td>
                                            <td align="right"><font size="1">d�as</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>P</b>recio Venta&nbsp;:&nbsp;</td>
                                            <td><input type="text" size="5" maxlength="2" value="<%=z_venta.trim()%>" id="11100717334804269631" name="11100717334804269631"></td>
                                            <td><font size="1">%</font></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </form>
        </table>   
    </body> 
    
</html>
<%@ include file= "../cierradb.jsp" %> 