<%@ include file="../conectadb.jsp" %>

<%
	String s_id	= request.getParameter("f_id");
	String s_motivo	= request.getParameter("f_motivo");
	String s_fecha_del = request.getParameter("f_fecha_del");
	String s_situacion_destino = request.getParameter("f_situacion_destino");
	String s_cod_situacion = request.getParameter("f_cod_situacion");

	COMANDO = " INSERT INTO [dbo].[traslado_situacion] "+
					"           ([fecha_traslado] "+
					"           ,[motivo_traslado] "+
					"           ,[situacion_inicial] "+
					"           ,[situacion_destino] "+
					"           ,[codigo] "+
					"           ,[estado]) "+
					"     VALUES "+
					"           ('"+s_fecha_del+"' "+
					"           ,'"+s_motivo+"' "+
					"           ,'"+s_cod_situacion+"' "+
					"           ,'"+s_situacion_destino+"' "+
					"           ,'"+s_id+"' "+
					"           ,1)  ";
	//out.print(COMANDO);
	int y = stmt.executeUpdate(COMANDO);

	COMANDO = " update 		maestro "+
				"  set      situacion = '"+s_situacion_destino+"' "+
				"where      codigo = '"+s_id+"' ";
	//out.print(COMANDO);
	int x = stmt.executeUpdate(COMANDO);	

	out.print("1");

%>