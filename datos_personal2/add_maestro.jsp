<%@ include file="../conectadb.jsp" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>

<%


        String  s_codigo                =       request.getParameter("f_codigo_add");
        String  s_dni                   =       request.getParameter("f_dni_add");
        String  s_plaza                 =       request.getParameter("f_plaza_add");
        String  s_nombre                =       request.getParameter("f_nombre_add");
        String  s_cargo_presupuestal    =       request.getParameter("f_cargo_presupuestal_add");
        String  s_nivel                 =       request.getParameter("f_nivel_add");
        String  s_remuneracion          =       request.getParameter("f_remuneracion_add");
        String  s_horario               =       request.getParameter("f_horario_add");
        String  s_horas                 =       request.getParameter("f_horas_add");
        String  s_cargo_funcional       =       request.getParameter("f_cargo_funcional_add");
        String  s_unidad_organica       =       request.getParameter("f_unidad_organica_add");
        String  s_nivel_pago            =       request.getParameter("f_nivel_pago_add");
        String  s_grupo_trabajador      =       request.getParameter("f_grupo_trabajador_add");
        String  s_dni_reloj             =       request.getParameter("f_dni_reloj_add");
        String  s_essalud               =       request.getParameter("f_essalud_add");
        String  s_codsiaf               =       request.getParameter("f_codsiaf_add");
        String  s_condicion             =       request.getParameter("f_condicion_add");
        String  s_cadena_funcional      =       request.getParameter("f_cadena_funcional_add");
        String  s_estadocivil           =       request.getParameter("f_estadocivil_add");
        String  s_direccion             =       request.getParameter("f_direccion_add");
        String  s_iddepartunidrol       =       request.getParameter("f_unidadrol_add");
        String  s_idservrol             =       request.getParameter("f_serviciorol_add");        
        String  s_fechaing             =       request.getParameter("f_fecing_add"); 
        String  s_fechanac             =       request.getParameter("f_fecnac_add"); 

	COMANDO = "INSERT INTO [dbo].[MAESTRO] "+
                                "   ([CODIGO] "+
                                "   ,[dni] "+
                                "   ,[dni_actual] "+
                                "   ,[plaza] "+
                                "   ,[nombre] "+
                                "   ,[codcargo] "+
                                "   ,[codnivel] "+
                                "   ,[haber] "+
                                "   ,[codhora] "+
                                "   ,[horas] "+
                                "   ,[codfuncion] "+
                                "   ,[codunidadorg] "+
                                "   ,[nivelgrd] "+
                                "   ,[dni_relog] "+
                                "   ,[essalud] "+
                                "   ,[codsiaf] "+
                                "   ,[situacion] "+
                                "   ,[estadocivil] "+
                                "   ,[direccion] "+
                                "   ,[fecha_ing] "+
                                "   ,[fecnac] "+
                                "   ,[grupo_trabajo] "+
                                "   ,[cadena]) "+
                        "     VALUES "+
                                "   ( '"+s_codigo+"' "+
                                "   ,'"+s_dni+"' "+
                                "   ,'"+s_dni+"' "+
                                "   ,'"+s_plaza+"' "+
                                "   ,upper('"+s_nombre+"') "+
                                "   ,'"+s_cargo_presupuestal+"' "+
                                "   ,'"+s_nivel+"' "+
                                "   ,'"+s_remuneracion+"' "+
                                "   ,'"+s_horario+"' "+
                                "   ,'"+s_horas+"' "+
                                "   ,'"+s_cargo_funcional+"' "+
                                "   ,'"+s_unidad_organica+"' "+
                                "   ,'"+s_nivel_pago+"' "+
                                "   ,'"+s_dni_reloj+"' "+
                                "   ,'"+s_essalud+"' "+
                                "   ,'"+s_codsiaf+"' "+
                                "   ,'"+s_condicion+"' "+
                                "   ,'"+s_estadocivil+"' "+
                                "   ,'"+s_direccion+"' "+
                                "   ,'"+s_fechaing+"' "+
                                "   ,'"+s_fechanac+"' "+
                                "   ,'"+s_grupo_trabajador+"' "+
                                "   ,Upper('"+s_cadena_funcional+"') ) ";

              //  out.print(COMANDO);
		int y = stmt.executeUpdate(COMANDO);

                COMANDO = "insert into  ServicioMaestro values ("+s_idservrol+","+s_iddepartunidrol+",'"+s_codigo+"',1) ";
                        int m = stmt.executeUpdate(COMANDO);
                //out.print(COMANDO);
		out.print("1");

%>