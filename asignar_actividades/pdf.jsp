<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb2.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ include file="../conectadb4.jsp" %>
<%@ include file="../conectadb5.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%	
	String s_anio		= request.getParameter("f_anio");	
	String s_mes		= request.getParameter("f_mes");
	String s_nomb		= request.getParameter("f_nomb");
	int s_unidad		= Integer.parseInt(request.getParameter("f_unidad"));
	String nom_unid 	= "";
	String id_personal	= request.getParameter("f_id_personal");	
	String estado 		= "";
	String anio 		= new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
	String s_total 		= "";
	String cant_dd		= "";
	String mes 			= "";
	String a 			= "";
	String b			= "";
	int i = 0;
	int umes = 0;
	int d = 0;

	COMANDO3 = "SELECT MES, upper(NOMBRE) as NOMBRE	"+
				" FROM MES  "+
				" WHERE MES = '"+s_mes+"' ";
		rset3 = stmt3.executeQuery(COMANDO3);

		if(rset3.next())
		{

			mes = rset3.getString("NOMBRE");
		}

	COMANDO = "  SELECT		UPPER(NOMBRE) AS NOMBRE "+
				"  FROM		ServicioDepartUnidad "+
				" WHERE		idservdepartunid = "+s_unidad+" ";

		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
		nom_unid = rset.getString("NOMBRE");
	}


%>

<head>
	<title>IMPRIMIR ROLES DE PERSONAL</title>
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
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>

<div class="row">
	<div  align="center" class="print">
		<!-- Primary table -->
		<div class="table-primary">
				<table class="table table-bordered" width="100%" align="center">
					<tr>
						<td>
							<div align="center" >
								<img src="../images/minsa.png" width="60%" height="40%">
							</div>
						</td>
					</tr>
				</table>
				<br><br>
				<table class="table table-bordered" border="2">
					<thead>
						<tr>
							<th colspan="35">
								<div align="center" >	
									<font size="5"> <%=nom_unid%> </font> <br>
									<%=mes%> - <%=s_anio%>
								</div>
							</th>							
						</tr>
						<tr>
							<th >
								<div align="center" >	
									#
								</div>
							</th>
							<th >
								<div align="center" >	
									NOMBRE
								</div>
							</th>
							<th >
								<div align="center" >	
									SERV.
								</div>
							</th>
<%
				COMANDO = "SELECT dbo.DiasEnMes('"+s_anio+"-"+s_mes+"-01') as dia_ultimo ";
					rset = stmt.executeQuery(COMANDO);
				if(rset.next())
				{
					umes = rset.getInt("dia_ultimo");
				}

				for(int y=1; y<=umes; y++ )
				{
%>				
							<th >
								<div align="center" >	
									<%=y%> <br>
<%
			COMANDO = "SELECT SUBSTRING(DATENAME(weekday, (right( '00' + cast( "+y+" AS varchar(2)), 2 ) + '/' + CONVERT(varchar(2), "+s_mes+") + '/' + CONVERT(varchar(4), "+s_anio+"))),1,2) as DIASEMANA ";
				rset = stmt.executeQuery(COMANDO);
				if(rset.next())
				{
						out.print(rset.getString("DIASEMANA"));
				}
%>
								</div>
							</th>
<%
				}
%>				
				
						</tr>
					</thead>
					<tbody>
						<tr>
<%

	COMANDO2 = 	" EXEC SP_GET_ASISTENCIA_MAESTRO_13 "+s_unidad+", '"+s_mes+"', '"+s_anio+"' ";
				//out.print(COMANDO2);

		rset2 = stmt2.executeQuery(COMANDO2);
	while(rset2.next())
	{ i++; d=0;
			estado = rset2.getString("INDICADOR");

			if(d==7){
				if(i==4 || i==8 || i==12)
				{
%>
					</tbody>
				</table>
					<br><br><br><br><br><br><br>
				<table class="table table-bordered" border="2">
					<tbody>
<%
				}}
%>
						<tr>
							<td>								
								<div align="center" >
									<b><%=i%></b>
								</div>
							</td>
							<td nowrap width="250">
								<div align="left">
									<b><%=rset2.getString("NOMBRE")%></b>
								</div>
							</td>
							<td>
								<table border="1">
<%

		COMANDO4 = 	"SELECT NOMBRE FROM ACTIVIDADES AC INNER JOIN REL_ACTIVIDADES RA ON AC.ID_ACTIVIDAD = RA.ID_ACTIVIDAD"+
					" WHERE RA.IdServDepartUnid = '"+s_unidad+"' AND AC.ACTIVO = 1 ";
				rset4 = stmt4.executeQuery(COMANDO4);
				while(rset4.next()){
%>
									<tr>
										<td>
                                            <div align="center" style="height: 20px; ">	
												<b><%=rset4.getString("NOMBRE")%></b>
                                            </div>
                                         </td>
									</tr>
<%	// CE
	}
%>
								</table>
							</td>
<%

			COMANDO5 = " EXEC SP_GET_ASISTENCIA_MAESTRO_NEW_2 '"+rset2.getString("CODIGO")+"', '"+s_mes+"', '"+s_anio+"' ";
					//out.print(COMANDO5);
				rset5 = stmt5.executeQuery(COMANDO5);
			while(rset5.next())
			 {	
			 d++;

%>
							<td bgcolor="<%=rset5.getString("color")%>">
								<table border="1">
<%

		COMANDO4 = 	"SELECT ABREVIATURA FROM ACTIVIDADES AC INNER JOIN REL_ACTIVIDADES RA ON AC.ID_ACTIVIDAD = RA.ID_ACTIVIDAD"+
					" WHERE RA.IdServDepartUnid = '"+s_unidad+"'  AND AC.ACTIVO = 1  ";
				//	out.print(COMANDO4);
				rset4 = stmt4.executeQuery(COMANDO4);
				while(rset4.next()){
%>
									<tr>
                                        <td align="center" >
                                         <div align="center" style="width: 23px; height: 20px; ">	
                                         <b><%=rset5.getString(rset4.getString("ABREVIATURA"))%></b>
                                          </div>
                                          </td>
									</tr>

<%	// CE
	}
%>

									

								</table>

							</td>
<%
		}
%>

    					</tr>

<%
	} //out.print(estado);
%>


					</tbody>
				</table>
					<br><br>
				<table class="table table-bordered" width="60%" align="center">
					<tr>
						<td>
								<div align="center" >
<%
						if("2.0".equals(estado) || "3.0".equals(estado) || "4.0".equals(estado))
						{
							
							COMANDO = "select top 1 ltrim(rtrim(DNI)) AS DNI from [BDPERSONAL].[dbo].[FIRMA_JEFE_SERV] WHERE ID_SERV = '"+s_unidad+"' AND INICIO < '15-"+s_mes+"-"+s_anio+"' AND FIN > '15-"+s_mes+"-"+s_anio+"'";
							rset = stmt.executeQuery(COMANDO);
							if(rset.next())
							{
%>									
									<img src="../images/<%=rset.getString("DNI")%>.jpg" width="250" height="165"><br>
<%			
							}
						}
%>
								</div>	
						</td>
						<td>
								<div align="center" >
<%
						if("2.0".equals(estado) || "3.0".equals(estado) || "4.0".equals(estado))
						{
							COMANDO = "select top 1 ltrim(rtrim(DNI)) AS DNI from [BDPERSONAL].[dbo].[FIRMA_JEFE_DEP] WHERE ID_DEPART = (SELECT IdDepartUnid FROM ServicioDepartUnidad WHERE IdServDepartUnid ='"+s_unidad+"') AND INICIO < '15-"+s_mes+"-"+s_anio+"' AND FIN > '15-"+s_mes+"-"+s_anio+"'";
							rset = stmt.executeQuery(COMANDO);
							if(rset.next())
							{
%>									
									<img src="../images/<%=rset.getString("DNI")%>.jpg" width="250" height="165"><br>
<%			
							}
						}
%>
								</div>	
						</td>
						<td>
								<div align="center" >	
<%
						if("3.0".equals(estado)  || "4.0".equals(estado))
						{
							COMANDO = "select top 1 ltrim(rtrim(DNI)) AS DNI from [BDPERSONAL].[dbo].[FIRMA_JEFE_DEP] WHERE ID_DEPART = 7 AND INICIO < '15-"+s_mes+"-"+s_anio+"' AND FIN > '15-"+s_mes+"-"+s_anio+"'";
							rset = stmt.executeQuery(COMANDO);
							if(rset.next())
							{
%>
									<img src="../images/<%=rset.getString("DNI")%>.jpg" width="250" height="165"><br>
<%			
							}
						}
%>
								</div>	
						</td>
						<td>
								<div align="center" >	
<%
						if("4.0".equals(estado))
						{
							COMANDO = "select top 1 ltrim(rtrim(DNI)) AS DNI from [BDPERSONAL].[dbo].[FIRMA_JEFE_DEP] WHERE ID_DEPART = 2 AND INICIO < '15-"+s_mes+"-"+s_anio+"' AND FIN > '15-"+s_mes+"-"+s_anio+"'";
							rset = stmt.executeQuery(COMANDO);
							if(rset.next())
							{
%>
									<img src="../images/<%=rset.getString("DNI")%>.jpg" width="250" height="165">
<%			
							}
						}
%>
								</div>		
						</td>
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
