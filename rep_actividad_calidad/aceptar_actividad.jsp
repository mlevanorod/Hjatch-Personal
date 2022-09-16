<%@ include file="../conectadb.jsp" %>

<%
	String 	s_eme		=	request.getParameter("f_EME");
	String  s_hos		=	request.getParameter("f_HOS");
	String	s_sop		=	request.getParameter("f_SOP");
	String 	eme			=	request.getParameter("EME");
	String  hos			=	request.getParameter("HOS");
	String	sop			=	request.getParameter("SOP");
	String	s_cem		=	request.getParameter("f_CEM");
	String	s_cet		=	request.getParameter("f_CET");
	String  s_codigo	=	request.getParameter("f_codigox");
	int	s_dia			=	Integer.parseInt(request.getParameter("f_diax"));
	int	s_mes			=	Integer.parseInt(request.getParameter("f_mesx"));
	int	s_anio			=	Integer.parseInt(request.getParameter("f_aniox"));
	int y = 0;


	//out.print(eme);
	
	COMANDO = "DELETE ACTIVIDAD_DETALLE "+
				" WHERE	codigo = '"+s_codigo+"'	"+
				"   and	dia = "+s_dia+"	 "+
				"   and mes = "+s_mes+"	"+
				"   and anio = '"+s_anio+"'  "+
				"   and estado = '1' ";

		y = stmt.executeUpdate(COMANDO);


	if(s_eme != null )
	{
		COMANDO =	"INSERT INTO ACTIVIDAD_DETALLE VALUES "+
						"("+s_eme+", '"+s_codigo+"',  "+s_dia+" , "+s_mes+" , "+s_anio+" , '1', '"+eme+"') ";
				y = stmt.executeUpdate(COMANDO);
				//out.print(COMANDO);
	}

	if(s_hos != null )
	{
		COMANDO =	"INSERT INTO ACTIVIDAD_DETALLE VALUES "+
						"("+s_hos+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '1', '"+hos+"') ";
				y = stmt.executeUpdate(COMANDO);
	}

	if(s_sop != null )
	{
		COMANDO =	"INSERT INTO ACTIVIDAD_DETALLE VALUES "+
						"("+s_sop+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '1', '"+sop+"') ";
				y = stmt.executeUpdate(COMANDO);
	}

	if(s_cem != null )
	{
		COMANDO =	"INSERT INTO ACTIVIDAD_DETALLE VALUES "+
						"("+s_cem+", '"+s_codigo+"', "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '1', 'X') ";
				y = stmt.executeUpdate(COMANDO);
				//out.print(COMANDO);
	}

	if(s_cet != null )
	{
		COMANDO =	"INSERT INTO ACTIVIDAD_DETALLE VALUES "+
						"("+s_cet+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '1' , 'X') ";
				y = stmt.executeUpdate(COMANDO);
	}	

	out.print("1");

%>