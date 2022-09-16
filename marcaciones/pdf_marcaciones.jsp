<%@ include file="../conectadb.jsp" %>
<%@ include file="../conectadb2.jsp" %>
<%@ include file="../conectadb3.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%	
	String s_anio		= request.getParameter("f_anio");	
	String s_mes		= request.getParameter("f_mes");
	int n_anio = Integer.parseInt(request.getParameter("f_anio"));	
	int n_mes = Integer.parseInt(request.getParameter("f_mes"));
	int n_dni = Integer.parseInt(request.getParameter("f_codigo"));
	String s_nombre		= request.getParameter("c_nombre");
	
	String s_nomb		= request.getParameter("f_nomb");
	String s_unidad		= request.getParameter("f_unidad");
	String s_dni		= request.getParameter("f_codigo");

	String nom_unid 	= "";
	String cnomape 	    = "";
	
	String id_personal	= request.getParameter("f_id_personal");	
	String estado 		= "";
	String anio 		= new String("AÑO".getBytes("ISO-8859-1"),"UTF-8");
	String s_total 		= "";
	String cant_dd		= "";
	String mes 			= "";
	int i = 0;
	int d = 0;
	int umes = 0;

	COMANDO3 = "SELECT MES, upper(NOMBRE) as NOMBRE	"+
				" FROM MES  "+
				" WHERE MES = '"+s_mes+"' ";
		rset3 = stmt3.executeQuery(COMANDO3);

		if(rset3.next())
		{

			mes = rset3.getString("NOMBRE");
		}

	COMANDO = "  select	a.Nombre as NOMBRE "+
				"  from	dbo.ServicioDepartUnidad a "+
				"  join	dbo.DepartamentoUnidad b "+
				"    on	a.IdDepartUnid = b.IdDepartUnid "+
				" where	IdServDepartUnid = '"+s_unidad+"' ";

		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
		nom_unid = rset.getString("NOMBRE");
	}


 	COMANDO2 = "select NOMBRE as NOMBRE_APELLIDO from [BDPERSONAL].[dbo].[MAESTRO] where dni_relog = '" +n_dni+ "'";
    rset2 = stmt2.executeQuery(COMANDO2);
	if(rset2.next())
	{
		cnomape = rset2.getString("NOMBRE_APELLIDO");
	} 

%>

<head>
	<title>REPORTE DE MARCACIONES </title>
</head>
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
        <table width="916">
             <tr>
               <td colspan="4"><hr></td>
             </tr>
             <tr>
               <td bgcolor="#EAEAEA">&nbsp;</td>
               <td bgcolor="#EAEAEA">&nbsp;</td>
               <td bgcolor="#EAEAEA">&nbsp;</td>
               <td bgcolor="#EAEAEA">&nbsp;</td>
             </tr>
             <tr>
               <td width="4%" bgcolor="#EAEAEA">&nbsp;</td>
               <td width="64%" bgcolor="#EAEAEA"><strong>HOSPITAL JOSE AGURTO TELLO DE CHOSICA</strong></td>
               <td width="12%" bgcolor="#EAEAEA">&nbsp;</td>
               <td width="20%" bgcolor="#EAEAEA"></td>
             </tr>
             <tr>
               <td bgcolor="#EAEAEA">&nbsp;</td>
               <td bgcolor="#EAEAEA"><strong>UNIDAD DE PERSONAL Y CONTROL DE ASISTENCIA</strong></td>
               <td bgcolor="#EAEAEA">HORA : </td>
               <td bgcolor="#EAEAEA"><script type="text/javascript"> function startTime(){ today=new Date(); h=today.getHours(); m=today.getMinutes(); s=today.getSeconds(); m=checkTime(m); s=checkTime(s); document.getElementById('reloj').innerHTML=h+":"+m+":"+s; t=setTimeout('startTime()',500);} function checkTime(i) {if (i<10) {i="0" + i;}return i;} window.onload=function(){startTime();} </script> <div id="reloj"></div></td>
             </tr>
             <tr>
               <td colspan="4" bgcolor="#EAEAEA">&nbsp;</td>
             </tr>
             <tr>
               <td colspan="4"><hr></td>
             </tr>
             <tr>
               <td bgcolor="#EAEAEA">&nbsp;</td>
               <td bgcolor="#EAEAEA">Apellidos y Nombres :</td>
               <td colspan="2" bgcolor="#EAEAEA">Unidad :</td>
             </tr>
             <tr>
               <td>&nbsp;</td>
               <td><font size="2"> <%=cnomape%> </font></td>
               <td colspan="2"><font size="2"> <%=nom_unid%> </font></td>
             </tr>
             <tr>
               <td colspan="4"><hr></td>
             </tr>
             <tr>
               <td>&nbsp;</td>
               <td colspan="2"><CENTER> <font size="4"><%=mes%> - <%=s_anio%> </font><C/ENTER> </td>
               <td>&nbsp;</td>
             </tr>
             <tr>
               <td colspan="4"><hr></td>
             </tr>
           </table>
<table width="915" class="table table-bordered">
  
  
<%	d=0;
	COMANDO = "SELECT CASE WHEN DATEPART(dw,FECHA) = 1 then 'Lunes, ' WHEN DATEPART(dw,FECHA) = 2 then 'Martes, ' when DATEPART(dw,FECHA) = 3 " +
 " then 'Miercoles, ' WHEN DATEPART(dw,FECHA) = 4 then 'Jueves, ' WHEN DATEPART(dw,FECHA) = 5 then 'Viernes, ' WHEN DATEPART(dw,FECHA) = 6 " +
 " then 'Sabado, ' WHEN DATEPART(dw,FECHA) = 7 then 'Domingo, ' END + CONVERT(varchar(2), day(fecha)) + ' de ' + case when MONTH(fecha) = 1 " +
 " then 'Enero' when MONTH(fecha) = 2 then 'Febrero' when MONTH(fecha) = 3 then 'Marzo' when MONTH(fecha) = 4 then 'Abril'  " +
 " when MONTH(fecha) = 5 then 'Mayo' when MONTH(fecha) = 6 then 'Junio'  when MONTH(fecha) = 7 then 'Julio' when MONTH(fecha) = 8 then 'Agosto' " +
 " when MONTH(fecha) = 9 then 'Septiembre'  when MONTH(fecha) = 10 then 'Octubre' when MONTH(fecha) = 11 then 'Noviembre' when MONTH(fecha) = 12 then 'Diciembre'  " +
 " end + ' del ' + CONVERT(varchar(4), year(fecha)) fecha, hora from RELOGDIGI where Codigo = '"+n_dni+"'" + " AND year(fecha) = '" +n_anio+"'" + " and MONTH(fecha) = '" +n_mes+"'" + " order by REPLACE(STR(DAY(FECHA), 2), SPACE(1), '0')   asc";

	//out.print(COMANDO);
	rset	=	stmt.executeQuery(COMANDO);
		while(rset.next())
			{
				 d++;
				 if(d==1){
%>
				<thead>
					<tr>
					  <th width="10" bgcolor="#EAEAEA">&nbsp;</th>
						<th width="218" bgcolor="#EAEAEA">
							<div align="center" class="table-caption">
								NRO
							</div>
						</th>
						<th width="369" bgcolor="#EAEAEA">
							<div align="center" class="table-caption">
								F E C H A 
                          </div>
					  </th>
						<th width="290" bgcolor="#EAEAEA"><span class="table-caption">H O R A </span></th>
						<th width="10" bgcolor="#EAEAEA">
							<div align="center" class="table-caption"></div>
					  </th>
				  </tr>
				</thead>
				<tbody>
<%
				}
%>					
					<tr>
					  <td bgcolor="#EAEAEA">&nbsp;</td>
						<td>
							<div align="center" class="table-caption">
								<%=d%>
							</div>
						</td>
						<td>
							<div align="center" class="table-caption">
								<%=rset.getString("FECHA")%>
							</div>
						</td>
						<td align="center"><span class="table-caption"><%=rset.getString("HORA")%></span></td>
						<td bgcolor="#EAEAEA">
							<div align="center" class="table-caption"></div>
						</td>
					</tr>
<%
			}
%>
				</tbody>
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
