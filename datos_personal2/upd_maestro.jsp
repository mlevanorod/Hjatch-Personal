<%@ include file="../conectadb.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>

<%

	String	s_codigo			=	request.getParameter("f_codigo_upd");
	String	s_dni				=	request.getParameter("f_dni_upd");
	String	s_plaza				=	request.getParameter("f_plaza_upd");
	String	s_nombre			=	request.getParameter("f_nombre_upd");
	String	s_cargo_presupuestal =	request.getParameter("f_cargo_presupuestal_upd");
	String	s_nivel				=	request.getParameter("f_nivel_upd");
	String	s_remuneracion		=	request.getParameter("f_remuneracion_upd");
	String	s_horario			=	request.getParameter("f_horario_upd");
	String	s_horas				=	request.getParameter("f_horas_upd");
	String	s_cargo_funcional	=	request.getParameter("f_cargo_funcional_upd");
	String	s_unidad_organica	=	request.getParameter("f_unidad_organica_upd");
	String	s_nivel_pago		=	request.getParameter("f_nivel_pago_upd");
	String	s_grupo_trabajador	=	request.getParameter("f_grupo_trabajador_upd");
	String	s_dni_reloj			=	request.getParameter("f_dni_reloj_upd");
	String	s_essalud			=	request.getParameter("f_essalud_upd");
	String	s_codsiaf			=	request.getParameter("f_codsiaf_upd");
	//String  s_condicion 		=   request.getParameter("f_condicion_upd");
	String	s_cadena_funcional	=	request.getParameter("f_cadena_funcional_upd");
	String  s_estadocivil 		=   request.getParameter("f_estadocivil_upd");
	String	s_direccion			=	request.getParameter("f_direccion_upd");
	String	s_iddepartunidrol	=	request.getParameter("f_unidadrol_upd");
	String	s_idservrol			=	request.getParameter("f_serviciorol_upd");
    String  s_fechaing          =   request.getParameter("f_fecing_upd"); 
    String  s_fechanac          =   request.getParameter("f_fecnac_upd"); 

	COMANDO = "update 	Maestro set "+
			"			dni = '"+s_dni+"', "+
			"			dni_actual = '"+s_dni+"', "+
			"			plaza = '"+s_plaza+"', "+
			"			nombre = upper('"+s_nombre+"'), "+
			"			codcargo = '"+s_cargo_presupuestal+"', "+
			"			codnivel = '"+s_nivel+"', "+
			"			haber = '"+s_remuneracion+"', "+
			"			codhora = '"+s_horario+"', "+
			"			horas = '"+s_horas+"', "+
			"			codfuncion = '"+s_cargo_funcional+"', "+
			"			codunidadorg = '"+s_unidad_organica+"', "+
			"			nivelgrd = '"+s_nivel_pago+"', "+
			"			dni_relog = '"+s_dni_reloj+"', "+
			"			essalud = '"+s_essalud+"', "+
			"			codsiaf = '"+s_codsiaf+"', "+
			//"			situacion = '"+s_condicion+"',	"+
			"			estadocivil = '"+s_estadocivil+"', "+
			"			direccion = '"+s_direccion+"',	"+			
			"			fecha_ing = '"+s_fechaing+"',	"+
			"			fecnac = '"+s_fechanac+"',	"+
			"			cadena = Upper('"+s_cadena_funcional+"') "+
			"  where  	codigo = '"+s_codigo+"' "; 
		//out.print(COMANDO);
		int y = stmt.executeUpdate(COMANDO);


	COMANDO = "select 	* "+
			  "  from 	ServicioMaestro	"+
			  " where   codigo = '"+s_codigo+"' ";
		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
		COMANDO = "Update  ServicioMaestro "+
					" set  iddepartunid = "+s_iddepartunidrol+",	 "+
					"	   idservdepartunid = "+s_idservrol+"	"+
					" where codigo = '"+s_codigo+"'		";
			int x = stmt.executeUpdate(COMANDO);
	}else{
		COMANDO = "insert into  ServicioMaestro values ("+s_idservrol+","+s_iddepartunidrol+",'"+s_codigo+"',1) ";
			int m = stmt.executeUpdate(COMANDO);
	}


		out.print("1");

%>