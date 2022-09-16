<%@ include file="../conectadb.jsp" %>

<%
	String  s_con		=	request.getParameter("f_CON");
	String  h_con		=	request.getParameter("h_CON");
	String  con			=	request.getParameter("CON");

	String  s_hpe		=	request.getParameter("f_HPE");
	String  h_hpe		=	request.getParameter("h_HPE");
	String  hpe			=	request.getParameter("HPE");

	String  h_hci		=	request.getParameter("h_HCI");
	String  s_hci		=	request.getParameter("f_HCI");
	String  hci			=	request.getParameter("HCI");

	String  s_hgi		=	request.getParameter("f_HGI");
	String  h_hgi		=	request.getParameter("h_HGI");
	String  hgi			=	request.getParameter("HGI");

	String  s_hme		=	request.getParameter("f_HME");
	String  h_hme		=	request.getParameter("h_HME");
	String  hme			=	request.getParameter("HME");
	
	String  s_hne		=	request.getParameter("f_HNE");
	String  h_hne		=	request.getParameter("h_HNE");
	String  hne		=	request.getParameter("HNE");
	
	String  s_htr		=	request.getParameter("f_HTR");
	String  h_htr		=	request.getParameter("h_HTR");
	String  htr		=	request.getParameter("HTR");

	String  s_uci		=	request.getParameter("f_UCI");
	String  h_uci		=	request.getParameter("h_UCI");
	String  uci			=	request.getParameter("UCI");

	String  s_eme		=	request.getParameter("f_EME");
	String  h_eme		=	request.getParameter("h_EME");
	String  eme			=	request.getParameter("EME");

	String  h_cq		=	request.getParameter("h_CQ");
	String  s_cq		=	request.getParameter("f_CQ");
	String  cq		=	request.getParameter("CQ");

	String  s_pc		=	request.getParameter("f_PC");
	String  h_pc		=	request.getParameter("h_PC");
	String  pc			=	request.getParameter("PC");

	String  h_cs		=	request.getParameter("h_CS");
	String  s_cs		=	request.getParameter("f_CS");
	String  cs		=	request.getParameter("CS");

	String  h_adm		=	request.getParameter("h_ADM");
	String  s_adm		=	request.getParameter("f_ADM");
	String  adm		=	request.getParameter("ADM");

	String  h_otr		=	request.getParameter("h_OTR");
	String  s_otr		=	request.getParameter("f_OTR");
	String  otr		=	request.getParameter("OTR");


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
						"("+s_eme+", '"+s_codigo+"',  "+s_dia+" , "+s_mes+" , "+s_anio+" , '1', '"+eme+"',"+h_eme+") ";
				y = stmt.executeUpdate(COMANDO);
	}

	if(s_cq != null )
	{
		COMANDO =	"INSERT INTO ACTIVIDAD_DETALLE VALUES "+
						"("+s_cq+", '"+s_codigo+"',  "+s_dia+" , "+s_mes+" , "+s_anio+" , '1', '"+cq+"',"+h_cq+") ";
				y = stmt.executeUpdate(COMANDO);
	}

	if(s_cs != null )
	{
		COMANDO =	"INSERT INTO ACTIVIDAD_DETALLE VALUES "+
						"("+s_cs+", '"+s_codigo+"',  "+s_dia+" , "+s_mes+" , "+s_anio+" , '1', '"+cs+"',"+h_cs+") ";
				y = stmt.executeUpdate(COMANDO);
	}

	if(s_htr != null )
	{
		COMANDO =	"INSERT INTO ACTIVIDAD_DETALLE VALUES "+
						"("+s_htr+", '"+s_codigo+"',  "+s_dia+" , "+s_mes+" , "+s_anio+" , '1', '"+htr+"',"+h_htr+") ";
				y = stmt.executeUpdate(COMANDO);
	}

	if(s_hgi != null )
	{
		COMANDO =	"INSERT INTO ACTIVIDAD_DETALLE VALUES "+
						"("+s_hgi+", '"+s_codigo+"',  "+s_dia+" , "+s_mes+" , "+s_anio+" , '1', '"+hgi+"',"+h_hgi+") ";
				y = stmt.executeUpdate(COMANDO);
	}

	if(s_hci != null )
	{
		COMANDO =	"INSERT INTO ACTIVIDAD_DETALLE VALUES "+
						"("+s_hci+", '"+s_codigo+"',  "+s_dia+" , "+s_mes+" , "+s_anio+" , '1', '"+hci+"',"+h_hci+") ";
				y = stmt.executeUpdate(COMANDO);
	}

	if(s_uci != null )
	{
		COMANDO =	"INSERT INTO ACTIVIDAD_DETALLE VALUES "+
						"("+s_uci+", '"+s_codigo+"', "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '1', '"+uci+"',"+h_uci+") ";
				y = stmt.executeUpdate(COMANDO);
	}


	if(s_hme != null )
	{
		COMANDO =	"INSERT INTO ACTIVIDAD_DETALLE VALUES "+
						"("+s_hme+", '"+s_codigo+"', "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '1', '"+hme+"',"+h_hme+") ";
				y = stmt.executeUpdate(COMANDO);
	}
	if(s_hpe != null )
	{
		COMANDO =	"INSERT INTO ACTIVIDAD_DETALLE VALUES "+
						"("+s_hpe+", '"+s_codigo+"', "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '1', '"+hpe+"',"+h_hpe+") ";
				y = stmt.executeUpdate(COMANDO);
	}

	if(s_pc != null )
	{
		COMANDO =	"INSERT INTO ACTIVIDAD_DETALLE VALUES "+
						"("+s_pc+", '"+s_codigo+"', "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '1', '"+pc+"',"+h_pc+") ";
				y = stmt.executeUpdate(COMANDO);
	}



	if(s_adm != null )
	{
		COMANDO =	"INSERT INTO ACTIVIDAD_DETALLE VALUES "+
						"("+s_adm+", '"+s_codigo+"', "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '1', '"+adm+"',"+h_adm+") ";
				y = stmt.executeUpdate(COMANDO);
	}

	if(s_otr != null )
	{
		COMANDO =	"INSERT INTO ACTIVIDAD_DETALLE VALUES "+
						"("+s_otr+", '"+s_codigo+"', "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '1', '"+otr+"',"+h_otr+") ";
				y = stmt.executeUpdate(COMANDO);
	}

	if(s_hne != null )
	{
		COMANDO =	"INSERT INTO ACTIVIDAD_DETALLE VALUES "+
						"("+s_hne+", '"+s_codigo+"', "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '1', '"+hne+"',"+h_hne+") ";
				y = stmt.executeUpdate(COMANDO);
	}

	if(s_con != null )
	{
		COMANDO =	"INSERT INTO ACTIVIDAD_DETALLE VALUES "+
						"("+s_con+", '"+s_codigo+"', "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '1', '"+con+"',"+h_con+") ";
				y = stmt.executeUpdate(COMANDO);
	}


	out.print("1");

%>