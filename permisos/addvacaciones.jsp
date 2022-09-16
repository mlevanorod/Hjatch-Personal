<%@ include file="../conectadb.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>

<%

	String	s_codigo	=	request.getParameter("f_id_licencia");
	String	s_anio		=	request.getParameter("f_anio");
	String	s_mes		=	request.getParameter("f_mes");
	String  s_fecha_ini =  	request.getParameter("f_fecha_ini");
	String  s_fecha_fin =  	request.getParameter("f_fecha_fin");
	String  s_obs 		=   request.getParameter("f_observacion");
	String  s_licencia  =  	request.getParameter("f_tipo_licencia");

	COMANDO = "INSERT INTO [dbo].[VACACIONES] "+
					"           ([CODIGO] "+
					"           ,[DESDE] "+
					"           ,[HASTA] "+
					"           ,[DIAS] "+
					"           ,[ESTADO] "+
					"           ,[CUENTA] "+
					"           ,[CODORDEN] "+
					"           ,[REFERENCIA] "+
					"           ,[NUMPOSTERGA] "+
					"           ,[TIPO] "+
					"           ,[ANO]) "+
					"     VALUES "+
					"           ('"+s_codigo+"' "+
					"           ,'"+s_fecha_ini+"' "+
					"           ,'"+s_fecha_fin+"' "+
					"           ,DATEDIFF(day, '"+s_fecha_ini+"', '"+s_fecha_fin+"')+1 "+
					"           ,'Programado' "+
					"           ,DATEDIFF(day, '"+s_fecha_ini+"', '"+s_fecha_fin+"')+1 "+
					"           , (SELECT		RIGHT('000000' + Ltrim(Rtrim(MAX(CODORDEN) + 1)),6) FROM VACACIONES) "+ // Tipo de Licencia)
					"           ,'"+s_obs+"' "+
					"           ,0 "+
					"           ,'"+s_licencia+"' "+
					"           ,'"+s_anio+"') "; 
		//out.print(COMANDO);
		int y = stmt.executeUpdate(COMANDO);
		out.print("1");
%>
