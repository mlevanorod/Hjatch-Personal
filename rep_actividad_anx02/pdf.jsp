<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb2.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%	
	String s_anio		= request.getParameter("f_anio");	
	String s_mes		= request.getParameter("f_mes");

	String s_unidad		= request.getParameter("f_unidad");
	String id_personal	= request.getParameter("f_id_personal");
	String s_codigo		= "";
	String estado 		= "";
	String nom_unidad	= "";
        String cod_unidad	= "";
	String cod_servicio	= "";
        String nom_servicio	= "";
        
	String anio 		= new String("AÃ‘O".getBytes("ISO-8859-1"),"UTF-8");
	String s_total 		= "";
	String cant_dd		= "";
	String mes 		= "";
	String color 		= "";
        String xcad             = "";
        

        int xmes = Integer.parseInt(s_mes);
	int i = 1;
	int d = 0;
	int total = 0;
        int co1 = 0;
        int co2 = 0;
        int co3 = 0;
        int co4 = 0;        
        int co5 = 0;        
        int co6 = 0;
        int co7 = 0;
        int co8 = 0;
        int co9 = 0; 
        int c10 = 0;
        int c11 = 0;
        int c12 = 0;
        int c13 = 0;
        int c14 = 0;
        int c15 = 0;        
                

        COMANDO3 = "SELECT  MES, upper(NOMBRE) as NOMBRE	"+
				" FROM MES  "+
				" WHERE MES = '"+s_mes+"' ";
		rset3 = stmt3.executeQuery(COMANDO3);

		if(rset3.next())
		{
			mes = rset3.getString("NOMBRE");
		}

	COMANDO = "  SELECT		CODIGO,IdDepartUnid,UPPER(NOMBRE) AS NOMBRE "+
				"  FROM		ServicioDepartUnidad "+
				" WHERE		idservdepartunid = "+s_unidad+" ";

		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
                cod_servicio = rset.getString("IdDepartUnid");
                cod_unidad = rset.getString("CODIGO");
		nom_unidad = rset.getString("NOMBRE");
	}

        COMANDO = "  SELECT		UPPER(NOMBRE) AS NOMBRE "+
				"  FROM		DepartamentoUnidad "+
				" WHERE		iddepartunid = "+cod_servicio+" ";

		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
            nom_servicio = rset.getString("NOMBRE");

	}
	//out.print(s_nomb);

%>

<head>
	<title>ANEXO 02 CUADRO RESUMEN REFERENCIAL DE LA PROGRAMACION DE LOS TURNOS DEL TRABAJO MEDICO</title>
</head>

<style type="text/css">

	H1.SaltoDePagina
 	{
    	 PAGE-BREAK-AFTER: always
 	}

</style>
 
<body>
			<table align="center" class="form-group" >
				<tr>
                                	<td colspan="7">
						<div align="left" class="table-header">
							<div class="table-caption">
								<!--<p><input type="button" class="printer" value="Imprimir"></p>-->
								<a href="#" title="Print Programa" class="printer" > <img src="../images/printer.gif"  width="50" height="50"> </a>
							</div>
						</div>												
					</td>
                                </tr>
			</table>
<div class="row">
	<div  align="center" class="print">
		<!-- Primary table -->
		<div class="table-primary">
			<table class="form-group" border="1">
                                <tr>
                                    <th>AÑO</th> 
                                    <th>MES</th> 
                                    <th>HOSPITA</th> 
                                    <th>CATEGORIA</th> 
                                </tr>
                                <tr>
                                	<td width="120" align="center"> <%=s_anio%> </td>
                                	<td width="120" align="center"> <%=mes%> </td>
                                	<td width="400" align="center"> HOSPITAL JOSE AGURTO TELLO DE CHOSICA</td>
                                	<td width="120" align="center"> II-2 </td>                                       
                                </tr>
                        </table>
                                        <br>                
			<table  class="form-group"  border="1">
                                <tr>
                                    <th>DEPARTAMENTO</th> 
                                    <th>SERVICIO</th> 
                                </tr>
                                <tr>
                                	<td width="380" align="center"> <%=nom_servicio%>  </td>
                                	<td width="380" align="center"> <%=nom_unidad%> </td>
                                </tr>
			</table>
<br>  
                        <table class="table table-bordered" border="1" style="white-space:nowrap">
					<thead>
						<tr>
							<th >
								<div align="center" >	
									N
								</div>
							</th>
							<th >
								<div align="center" >	
									NOMBRE
								</div>
							</th>
							<th>
								<div align="center">
									SITUACION
								</div>
							</th>
              <th >
                <div align="center" > 
                    EME
                </div>
              </th>
              <th >
                <div align="center" > 
                    HOS
                </div>
              </th>
              <th >
                <div align="center" > 
                    SOP
                </div>
              </th>
              <th >
                <div align="center" > 
                    CEM
                </div>
              </th>
              <th >
                <div align="center" > 
                    ADM
                </div>
              </th>
              <th >
                <div align="center" > 
                    COB
                </div>
              </th>
                <th >
                <div align="center" > 
                    PROC
                </div>
              </th>
              <th >
                <div align="center" > 
                    INC
                </div>
              </th>
              <th >
                <div align="center" > 
                    CMT
                </div>
              </th>
              <th >
                <div align="center" > 
                    CAP
                </div>
              </th>
              <th >
                <div align="center" > 
                    JMED
                </div>
              </th>
              <th >
                <div align="center" > 
                    TLM
                </div>
              </th>
              <th >
                <div align="center" > 
                    AUD
                </div>
              </th>
              <th >
                <div align="center" > 
                    REFC
                </div>
              </th>
              <th >
                <div align="center" > 
                    SUP
                </div>
              </th>
              <th>
                  <div align="right" >  
                      TOTAL
                  </div>  
              </th>
					 </tr>
					</thead>
					<tbody>
<%
				        COMANDO = "select CODIGO,PROFESIONAL,SITUACION,[EME],[HOS],[CQG] AS SOP,[CON] AS CEM,[ADM],[COB],[PRO],[ITC] AS INTER,[CTE] AS CMT,[CAP],[JMED] AS JMED,[TLM],[AUD],[RYC]AS REFC,[SUP] FROM (SELECT CODIGO,PROFESIONAL,SITUACION,ABREVIATURA,HORAS FROM V_ACTIVIDAD_ANEXO_02 where ANIO="+s_anio+" AND MES="+s_mes+" AND CODUNIDADORG='"+cod_unidad+"') AS t1 pivot (SUM(HORAS) for ABREVIATURA IN ([EME],[HOS],[CQG],[CON],[ADM],[COB],[PRO],[ITC],[CTE],[CAP],[JMED],[TLM],[AUD],[RYC],[SUP])) as t2 ORDER BY PROFESIONAL ";
                rset = stmt.executeQuery(COMANDO);
               while(rset.next())        
				            {
%>   
                                <tr>
                                        <th >
                                            <%=i%>
                                        </th>
							<th >
								<div align="left" > 
                  <% out.print(rset.getString("PROFESIONAL")); %>
                </div>
              </th>
              <th >
                <div align="center" > 
                  <% out.print(rset.getString("SITUACION")); %>
                </div>
              </th>
              <th >
                <div align="center" > 
<%
                                              if(rset.getString("EME")!=null) {
                                                 out.print(rset.getString("EME"));
                                                 xcad = rset.getString("EME");
                                                 co1=Integer.parseInt(xcad);
                                              }else{
                                                  out.print("0");
                                                  co1=0;
                                              };      
%>
                </div>
              </th>
              <th >
                <div align="center" > 
<%
                                              if(rset.getString("HOS")!=null) {
                                                 out.print(rset.getString("HOS"));
                                                 xcad = rset.getString("HOS");
                                                 co2=Integer.parseInt(xcad);
                                              }else{
                                                  out.print("0");
                                                  co2=0;
                                              };        
%>
                </div>
              </th>
              <th >
                <div align="center" > 
<%
                                              if(rset.getString("SOP")!=null) {
                                                 out.print(rset.getString("SOP"));
                                                 xcad = rset.getString("SOP");
                                                 co3=Integer.parseInt(xcad);
                                              }else{
                                                  out.print("0");
                                                  co3=0;
                                              };      
%>
                </div>
              </th>                                                        
              <th >
                <div align="center" > 
<%
                                              if(rset.getString("CEM")!=null) {
                                                 out.print(rset.getString("CEM"));
                                                 xcad = rset.getString("CEM");
                                                 co4=Integer.parseInt(xcad);
                                              }else{
                                                  out.print("0");
                                                  co4=0;
                                              };        
%>
                </div>
              </th>
              <th >
                <div align="center" > 
<%
                                              if(rset.getString("ADM")!=null) {
                                                 out.print(rset.getString("ADM"));
                                                 xcad = rset.getString("ADM");
                                                 co5=Integer.parseInt(xcad);
                                              }else{
                                                  out.print("0");
                                                  co5=0;
                                              };
%>
                </div>
              </th>
              <th >
                <div align="center" > 
<%                                          
                                              if(rset.getString("COB")!=null) {
                                                 out.print(rset.getString("COB"));
                                                 xcad = rset.getString("COB");
                                                 co6=Integer.parseInt(xcad);
                                              }else{
                                                  out.print("0");
                                                  co6=0;
                                              };
%>
                </div>
              </th>
              <th >
                <div align="center" > 
<%
                                              if(rset.getString("PRO")!=null) {
                                                 out.print(rset.getString("PRO"));
                                                 xcad = rset.getString("PRO");
                                                 co7=Integer.parseInt(xcad);
                                              }else{
                                                  out.print("0");
                                                  co7=0;
                                              };
%>
                </div>
              </th>
              <th >
                <div align="center" > 
<%
                                              if(rset.getString("INTER")!=null) {
                                                 out.print(rset.getString("INTER"));
                                                 xcad = rset.getString("INTER");
                                                 co8=Integer.parseInt(xcad);
                                              }else{
                                                  out.print("0");
                                                  co8=0;
                                              };
%>
                </div>
              </th>                                                        
              <th >
                <div align="center" > 
<%
                                              if(rset.getString("CMT")!=null) {
                                                 out.print(rset.getString("CMT"));
                                                 xcad = rset.getString("CMT");
                                                 co9=Integer.parseInt(xcad);
                                              }else{
                                                  out.print("0");
                                                  co9=0;
                                              };      
%>
                </div>
              </th>
              <th >
                <div align="center" > 
<%
                                              if(rset.getString("CAP")!=null) {
                                                 out.print(rset.getString("CAP"));
                                                 xcad = rset.getString("CAP");
                                                 c10=Integer.parseInt(xcad);
                                              }else{
                                                  out.print("0");
                                                  c10=0;
                                              };      

%>
                </div>
              </th>                                                        
              <th >
                <div align="center" > 
<%
                                              if(rset.getString("JMED")!=null) {
                                                 out.print(rset.getString("JMED"));
                                                 xcad = rset.getString("JMED");
                                                 c11=Integer.parseInt(xcad);
                                              }else{
                                                  out.print("0");
                                                  c11=0;
                                              };      
%>
                </div>
              </th>                                                        
              <th >
                <div align="center" > 
<%
                                              if(rset.getString("TLM")!=null) {
                                                 out.print(rset.getString("TLM"));
                                                 xcad = rset.getString("TLM");
                                                 c12=Integer.parseInt(xcad);
                                              }else{
                                                  out.print("0");
                                                  c12=0;
                                              };      

%>
                </div>
              </th>                                                                                                                
              <th >
                <div align="center" > 
<%
                                              if(rset.getString("AUD")!=null) {
                                                 out.print(rset.getString("AUD"));
                                                 xcad = rset.getString("AUD");
                                                 c13=Integer.parseInt(xcad);
                                              }else{
                                                  out.print("0");
                                                  c13=0;
                                              };
%>
                </div>
              </th>                                                                                                                
              <th >
                <div align="center" > 
<%
                                              if(rset.getString("REFC")!=null) {
                                                 out.print(rset.getString("REFC"));
                                                 xcad = rset.getString("REFC");
                                                 c14=Integer.parseInt(xcad);
                                              }else{
                                                 out.print("0");
                                                 c14=0;
                                              };
%>
                </div>
              </th> 
              <th >
                <div align="center" > 
<%
                                              if(rset.getString("SUP")!=null) {
                                                 out.print(rset.getString("SUP"));
                                                 xcad = rset.getString("SUP");
                                                 c15=Integer.parseInt(xcad);
                                              }else{
                                                out.print("0");
                                                 c15=0;
                                              };      
%>
                </div>
							</th> 
<%
                                    total = co1+co2+co3+co4+co5+co6+co7+co8+co9+c10+c11+c12+c13+c14+c15;
%>
                                    <th>
                                        <div align="right" >	
                                          <%=total%>
                                        </div>  
                                    </th>                                                       
                                </tr>                   
                                
<%
				i++; };
%>
                                </tbody>
				</table>
                         <br><br>             
				<table class="table table-bordered" border="2" align="center">
          <tr>
            <td>
                <div align="center" >
<%              
              COMANDO = "select top 1 ltrim(rtrim(DNI)) AS DNI from [BDPERSONAL].[dbo].[FIRMA_JEFE_SERV] WHERE ID_SERV = '"+s_unidad+"' AND INICIO < '15-"+s_mes+"-"+s_anio+"' AND FIN > '15-"+s_mes+"-"+s_anio+"'";
              rset = stmt.executeQuery(COMANDO);
              if(rset.next())
              {
%>                  
                  <img src="../images/<%=rset.getString("DNI")%>.jpg" width="250" height="165"><br>
<%      
              }
%>
                </div>  
            </td>
            <td>
                <div align="center" >
<%

              COMANDO = "select top 1 ltrim(rtrim(DNI)) AS DNI from [BDPERSONAL].[dbo].[FIRMA_JEFE_DEP] WHERE ID_DEPART = (SELECT IdDepartUnid FROM ServicioDepartUnidad WHERE IdServDepartUnid ='"+s_unidad+"') AND INICIO < '15-"+s_mes+"-"+s_anio+"' AND FIN > '15-"+s_mes+"-"+s_anio+"'";
              rset = stmt.executeQuery(COMANDO);
              if(rset.next())
              {
%>                  
                  <img src="../images/<%=rset.getString("DNI")%>.jpg" width="250" height="165"><br>
<%      
              }
%>
                </div>  
            </td>
            <td>
                <div align="center" > 
<%
              COMANDO = "select top 1 ltrim(rtrim(DNI)) AS DNI from [BDPERSONAL].[dbo].[FIRMA_JEFE_DEP] WHERE ID_DEPART = 7 AND INICIO < '15-"+s_mes+"-"+s_anio+"' AND FIN > '15-"+s_mes+"-"+s_anio+"'";
              rset = stmt.executeQuery(COMANDO);
              if(rset.next())
              {
%>
                  <img src="../images/<%=rset.getString("DNI")%>.jpg" width="250" height="165"><br>
<%      
              }
%>
                </div>  
            </td>
            <td>
                <div align="center" > 
<%
              COMANDO = "select top 1 ltrim(rtrim(DNI)) AS DNI from [BDPERSONAL].[dbo].[FIRMA_JEFE_DEP] WHERE ID_DEPART = 2 AND INICIO < '15-"+s_mes+"-"+s_anio+"' AND FIN > '15-"+s_mes+"-"+s_anio+"'";
              rset = stmt.executeQuery(COMANDO);
              if(rset.next())
              {
%>
                  <img src="../images/<%=rset.getString("DNI")%>.jpg" width="250" height="165">
<%      
              }
%>
                </div>  
            </td>
          </tr>         
        </table>
                        <br>
			<table  class="form-group" style="font-size: 14">
                                <tr>
                                	<td>[EME] = EMGERGENCIA </td>
                                        <td>      </td>
                                	<td>[HOS] = VISITA A HOSP</td>
                                        <td>       </td>
                                        <td>[SOP] = SALA DE OPERACIONES</td>
                                        <td>       </td>
                                        <td>[CEM] = CONSULTA EXTERNA</td>
                                        <td>       </td>
                                        <td>[ADM] = ADMINISTRATIVO</td>
                                </tr>
                                <tr>
                                        <td>[COB] = CENTRO OBSTETRICO</td>
                                        <td>       </td>
                                        <td>[PROC] = PROCD.DIAG.TERAP</td>
                                        <td>       </td>
                                        <td>[INC] = INTERCONSULTAS </td>
                                        <td>      </td>
                                	<td>[CMT] = COMITE</td>
                                        <td>       </td>
                                        <td>[CAP] = CAPACITACION</td>
                                </tr>
                                <tr>
                                        <td>[JMED] = JUNTA MEDICA</td>
                                        <td>       </td>
                                        <td>[TLM] = TELEMEDICINA</td>
                                        <td>       </td>
                                        <td>[AUD] = AUDITORIA</td>
                                        <td>       </td>
                                        <td>[REFC] = REFERENCIA Y CONTRAREFERENCIA</td>
                                        <td>       </td>
                                        <td>[SUP] = SUPERVISION</td>
                                </tr>
                        </table>                                                                
		</div>
		<!-- / Primary table -->
	</div>
</div>
	
	<script src="../js/jquery.min.js"></script> 
	<script src="print.js"></script>
	<script type="text/javascript">
	$(document).ready(function()
	{
		$(".printer").bind("click",function()
		{
			$('.print').printArea();
		});
	});
	</script>
</body>        
