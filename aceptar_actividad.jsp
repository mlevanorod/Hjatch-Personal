<%@ include file="../conectadb.jsp" %>

<%
		String 	s_con		=	request.getParameter("f_CON");
		String 	h_con		=	request.getParameter("h_CON");
		String 	con			=	request.getParameter("CON");
  
		String 	s_eme		=	request.getParameter("f_EME");
		String 	h_eme		=	request.getParameter("h_EME");
		String 	eme			=	request.getParameter("EME");

		String 	s_dsp		=	request.getParameter("f_DSP");
		String 	h_dsp		=	request.getParameter("h_DSP");
		String 	dsp			=	request.getParameter("DSP");

		String 	s_hos		=	request.getParameter("f_HOS");
		String 	h_hos		=	request.getParameter("h_HOS");
		String 	hos			=	request.getParameter("HOS");

		String 	s_mpr		=	request.getParameter("f_MPR");
		String 	h_mpr		=	request.getParameter("h_MPR");
		String 	mpr			=	request.getParameter("MPR");
		
		String 	s_mft		=	request.getParameter("f_MFT");
		String 	h_mft		=	request.getParameter("h_MFT");
		String 	mft			=	request.getParameter("MFT");

		String 	s_adm		=	request.getParameter("f_ADM");
		String 	h_adm		=	request.getParameter("h_ADM");
		String 	adm			=	request.getParameter("ADM");

		String 	s_otr		=	request.getParameter("f_OTR");
		String 	h_otr		=	request.getParameter("h_OTR");
		String 	otr			=	request.getParameter("OTR");
					
		String 	s_pfm		=	request.getParameter("f_PFM");
		String 	h_pfm		=	request.getParameter("h_PFM");
		String 	pfm			=	request.getParameter("PFM");

		String 	s_psp		=	request.getParameter("f_PSP");
		String 	h_psp		=	request.getParameter("h_PSP");
		String 	psp			=	request.getParameter("PSP");
		
		String 	s_hpe		=	request.getParameter("f_HPE");
		String 	h_hpe		=	request.getParameter("h_HPE");
		String 	hpe			=	request.getParameter("HPE");

		String 	s_hci		=	request.getParameter("f_HCI");
		String 	h_hci		=	request.getParameter("h_HCI");
		String 	hci			=	request.getParameter("HCI");

		String 	s_hgi		=	request.getParameter("f_HGI");
		String 	h_hgi		=	request.getParameter("h_HGI");
		String 	hgi			=	request.getParameter("HGI");

		String 	s_hme		=	request.getParameter("f_HME");
		String 	h_hme		=	request.getParameter("h_HME");
		String 	hme			=	request.getParameter("HME");

		String 	s_htr		=	request.getParameter("f_HTR");
		String 	h_htr		=	request.getParameter("h_HTR");
		String 	htr			=	request.getParameter("HTR");

		String 	s_hne		=	request.getParameter("f_HNE");
		String 	h_hne		=	request.getParameter("h_HNE");
		String 	hne			=	request.getParameter("HNE");

		String 	s_uci		=	request.getParameter("f_UCI");
		String 	h_uci		=	request.getParameter("h_UCI");
		String 	uci			=	request.getParameter("UCI");

		String 	s_cob		=	request.getParameter("f_COB");
		String 	h_cob		=	request.getParameter("h_COB");
		String 	cob			=	request.getParameter("COB");

		String 	s_ryf		=	request.getParameter("f_RYF");
		String 	h_ryf		=	request.getParameter("h_RYF");
		String 	ryf			=	request.getParameter("RYF");

		String 	s_prg		=	request.getParameter("f_PRG");
		String 	h_prg		=	request.getParameter("h_PRG");
		String 	prg			=	request.getParameter("PRG");

		String 	s_itc		=	request.getParameter("f_ITC");
		String 	h_itc		=	request.getParameter("h_ITC");
		String 	itc			=	request.getParameter("ITC");

		String 	s_ror		=	request.getParameter("f_ROR");
		String 	h_ror		=	request.getParameter("h_ROR");
		String 	ror			=	request.getParameter("ROR");

		String 	s_cqg		=	request.getParameter("f_CQG");
		String 	h_cqg		=	request.getParameter("h_CQG");
		String 	cqg			=	request.getParameter("CQG");

		String 	s_cet		=	request.getParameter("f_CET");
		String 	h_cet		=	request.getParameter("h_CET");
		String 	cet			=	request.getParameter("CET");

		String 	s_pro		=	request.getParameter("f_PRO");
		String 	h_pro		=	request.getParameter("h_PRO");
		String 	pro			=	request.getParameter("PRO");

		String 	s_cap		=	request.getParameter("f_CAP");
		String 	h_cap		=	request.getParameter("h_CAP");
		String 	cap			=	request.getParameter("CAP");

		String 	s_eco		=	request.getParameter("f_ECO");
		String 	h_eco		=	request.getParameter("h_ECO");
		String 	eco			=	request.getParameter("ECO");

		String 	s_ryc		=	request.getParameter("f_RYC");
		String 	h_ryc		=	request.getParameter("h_RYC");
		String 	ryc			=	request.getParameter("RYC");

		String 	s_cte		=	request.getParameter("f_CTE");
		String 	h_cte		=	request.getParameter("h_CTE");
		String 	cte			=	request.getParameter("CTE");

		String 	s_inv		=	request.getParameter("f_INV");
		String 	h_inv		=	request.getParameter("h_INV");
		String 	inv			=	request.getParameter("INV");

		String 	s_iec		=	request.getParameter("f_IEC");
		String 	h_iec		=	request.getParameter("h_IEC");
		String 	iec			=	request.getParameter("IEC");

		String 	s_amb		=	request.getParameter("f_AMB");
		String 	h_amb		=	request.getParameter("h_AMB");
		String 	amb			=	request.getParameter("AMB");

		String 	s_csj		=	request.getParameter("f_CSJ");
		String 	h_csj		=	request.getParameter("h_CSJ");
		String 	csj			=	request.getParameter("CSJ");

		String 	s_cvd		=	request.getParameter("f_CVD");
		String 	h_cvd		=	request.getParameter("h_CVD");
		String 	cvd			=	request.getParameter("CVD");		

		String 	s_tp1		=	request.getParameter("f_TP1");
		String 	h_tp1		=	request.getParameter("h_TP1");
		String 	tp1			=	request.getParameter("TP1");


		String 	s_tp2		=	request.getParameter("f_TP2");
		String 	h_tp2		=	request.getParameter("h_TP2");
		String 	tp2			=	request.getParameter("TP2");


		String 	s_tp3		=	request.getParameter("f_TP3");
		String 	h_tp3		=	request.getParameter("h_TP3");
		String 	tp3			=	request.getParameter("TP3");


		String 	s_ob1		=	request.getParameter("f_OB1");
		String 	h_ob1		=	request.getParameter("h_OB1");
		String 	ob1			=	request.getParameter("OB1");


		String 	s_ob2		=	request.getParameter("f_OB2");
		String 	h_ob2		=	request.getParameter("h_OB2");
		String 	ob2			=	request.getParameter("OB2");

		String 	s_coo		=	request.getParameter("f_COO");
		String 	h_coo		=	request.getParameter("h_COO");
		String 	coo			=	request.getParameter("COO");

		String 	s_emc		=	request.getParameter("f_EMC");
		String 	h_emc		=	request.getParameter("h_EMC");
		String 	emc			=	request.getParameter("EMC");

		String 	s_coc		=	request.getParameter("f_COC");
		String 	h_coc		=	request.getParameter("h_COC");
		String 	coc			=	request.getParameter("COC");
        
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


	if(s_con != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_con+", '"+s_codigo+"',  "+s_dia+" , "+s_mes+" , "+s_anio+" , '"+con+"',"+h_con+" ";
				y = stmt.executeUpdate(COMANDO);
				//out.print(COMANDO);
	}


	if(s_eme != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_eme+", '"+s_codigo+"',  "+s_dia+" , "+s_mes+" , "+s_anio+" , '"+eme+"',"+h_eme+" ";
				y = stmt.executeUpdate(COMANDO);
				//out.print(COMANDO);
	}


	if(s_dsp != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_dsp+", '"+s_codigo+"',  "+s_dia+" , "+s_mes+" , "+s_anio+" , '"+dsp+"',"+h_dsp+" ";
				y = stmt.executeUpdate(COMANDO);
				//out.print(COMANDO);
	}


	if(s_hos != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_hos+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+hos+"',"+h_hos+" ";
				y = stmt.executeUpdate(COMANDO);
	}


	if(s_mpr != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_mpr+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+mpr+"',"+h_mpr+" ";
				y = stmt.executeUpdate(COMANDO);
	}


	if(s_mft != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_mft+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+mft+"',"+h_mft+" ";
				y = stmt.executeUpdate(COMANDO);
	}


	if(s_adm != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_adm+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+adm+"',"+h_adm+" ";
				y = stmt.executeUpdate(COMANDO);
	}

	
	if(s_otr != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_otr+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+otr+"',"+h_otr+" ";
				y = stmt.executeUpdate(COMANDO);
	}	
	

	if(s_pfm != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_pfm+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+pfm+"',"+h_pfm+" ";
				y = stmt.executeUpdate(COMANDO);
	}

	
	if(s_psp != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_psp+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+psp+"',"+h_psp+" ";
				y = stmt.executeUpdate(COMANDO);
	}	
			

	if(s_hpe != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_hpe+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+hpe+"',"+h_hpe+" ";
				y = stmt.executeUpdate(COMANDO);
	}	

	if(s_hci != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_hci+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+hci+"', "+h_hci+" ";
				y = stmt.executeUpdate(COMANDO);
	}	

	if(s_hgi != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_hgi+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+hgi+"',"+h_hgi+" ";
				y = stmt.executeUpdate(COMANDO);
	}	

    if(s_hme != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_hme+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+hme+"',"+h_hme+" ";
				y = stmt.executeUpdate(COMANDO);
	}        
	
	if(s_htr != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_htr+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+htr+"', "+h_htr+" ";
				y = stmt.executeUpdate(COMANDO);
	}	
  					
    if(s_hne != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_hne+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+hne+"',"+h_hne+" ";
				y = stmt.executeUpdate(COMANDO);
	}
  
   if(s_uci != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_uci+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+uci+"',"+h_uci+" ";
				y = stmt.executeUpdate(COMANDO);
	}
     
    if(s_cob != null )
	 {
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_cob+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+cob+"',"+h_cob+" "; 
				y = stmt.executeUpdate(COMANDO);
	}        
              
   if(s_ryf != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_ryf+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+ryf+"',"+h_ryf+" ";
				y = stmt.executeUpdate(COMANDO);
	}  
      

    if(s_prg != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_prg+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+prg+"',"+h_prg+" ";
				y = stmt.executeUpdate(COMANDO);
	}        
        
    if(s_itc != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_itc+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+itc+"',"+h_itc+" ";
				y = stmt.executeUpdate(COMANDO);
	}  
	
	if(s_ror != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_ror+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+ror+"',"+h_ror+" ";
				y = stmt.executeUpdate(COMANDO);
	} 

	if(s_cqg != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_cqg+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+cqg+"',"+h_cqg+" ";
				y = stmt.executeUpdate(COMANDO);
	} 

	if(s_cet != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_cet+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+cet+"',"+h_cet+" ";
				y = stmt.executeUpdate(COMANDO);
	} 

	if(s_pro != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_pro+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+pro+"',"+h_pro+" ";
				y = stmt.executeUpdate(COMANDO);
	} 
	
	if(s_cap != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_cap+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+cap+"',"+h_cap+" ";
				y = stmt.executeUpdate(COMANDO);
	}

	if(s_eco != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_eco+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+eco+"',"+h_eco+" ";
				y = stmt.executeUpdate(COMANDO);
	} 

	if(s_ryc != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_ryc+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+ryc+"',"+h_ryc+" ";
				y = stmt.executeUpdate(COMANDO);
	} 
	if(s_cte != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_cte+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+cte+"',"+h_cte+" ";
				y = stmt.executeUpdate(COMANDO);
	} 
	if(s_inv != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_inv+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+inv+"',"+h_inv+" ";
				y = stmt.executeUpdate(COMANDO);
	} 

	if(s_iec != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_iec+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+iec+"',"+h_iec+" ";
				y = stmt.executeUpdate(COMANDO);
	} 

	if(s_amb != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_amb+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+amb+"',"+h_amb+" ";
				y = stmt.executeUpdate(COMANDO);
	}

	if(s_csj != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_csj+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+csj+"',"+h_csj+" ";
				y = stmt.executeUpdate(COMANDO);
	}   

	if(s_cvd != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_cvd+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+cvd+"',"+h_cvd+" ";
				y = stmt.executeUpdate(COMANDO);
	}  

	if(s_tp1 != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_tp1+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+tp1+"',"+h_tp1+" ";
			//	out.print(COMANDO);
				y = stmt.executeUpdate(COMANDO);
	}  

	if(s_tp2 != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_tp2+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+tp2+"',"+h_tp2+" ";
				y = stmt.executeUpdate(COMANDO);
	}  


	if(s_tp3 != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_tp3+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+tp3+"',"+h_tp3+" ";
				y = stmt.executeUpdate(COMANDO);
	}  

	if(s_ob1 != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_ob1+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+ob1+"',"+h_ob1+" ";
				y = stmt.executeUpdate(COMANDO);
	}  

	if(s_ob2 != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_ob2+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+ob2+"',"+h_ob2+" ";
				y = stmt.executeUpdate(COMANDO);
	}  

	if(s_coo != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_coo+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+coo+"',"+h_coo+" ";
				y = stmt.executeUpdate(COMANDO);
	}  	

	if(s_emc != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_emc+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+emc+"',"+h_emc+" ";
				y = stmt.executeUpdate(COMANDO);
	}  

	if(s_coc != null )
	{
		COMANDO =	"EXEC SP_PERSONAL_INSERTAR_ACTIVIDAD "
						+s_coc+", '"+s_codigo+"',  "+s_dia+" , '"+s_mes+"' , "+s_anio+" , '"+coc+"',"+h_coc+" ";
				y = stmt.executeUpdate(COMANDO);
	}  		

        out.print("1");

%>