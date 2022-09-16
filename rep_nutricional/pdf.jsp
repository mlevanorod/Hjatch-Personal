<%@ include file="../conectadb.jsp" %>
<%@ page
language="java"
import="java.io.*,java.sql.*, com.lowagie.text.*,com.lowagie.text.pdf.*,java.awt.Color"
contentType="text/html; charset=utf-8"
errorPage=""
%>

<%@page language="java" import="com.itextpdf.text.Rectangle" %>
<%@page language="java" import="com.itextpdf.io.image.ImageDataFactory" %>
<%@page language="java" import="com.itextpdf.text.Image" %>

<%
	String s_turno 	= request.getParameter("f_turno");
	String s_tipo  	= request.getParameter("f_tipo");	
	String s_anio	= request.getParameter("f_anio");	
	String s_mes	= request.getParameter("f_mes");
	String s_fecha 	= "01/"+s_mes+"/"+s_anio;	
	//out.print(s_fecha);
	int count = 0;
	int dias = 0;

	COMANDO = "SELECT DAY(DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,'"+s_fecha+"')+1,0))) AS DIA";
		rset = stmt.executeQuery(COMANDO);
	if(rset.next())
	{
		dias = rset.getInt("DIA");
	}

	response.setContentType("application/pdf");
	Document document=new Document();
	ByteArrayOutputStream buffer=new ByteArrayOutputStream();
	PdfWriter.getInstance(document, response.getOutputStream());
	document.addAuthor("Ing. Michael Lev.");
	document.addCreator("Ing. Michael Lev.");
	document.addTitle("Resultado Laboratorio");
	document.addSubject("Resultado");
	document.setPageSize(PageSize.A4.rotate());  // Para poner la pagina en Horizontal
	//document.setAlignment(Element.ALIGN_CENTER);

	document.open();

	float[] widths1={1f};
	PdfPTable table1=new PdfPTable(widths1);
	PdfPCell cell1=new PdfPCell(new Paragraph("Rep. Nutricional"));
		cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell1.setBorderColor(new Color(255,255,255));
		table1.addCell(cell1);

		table1.setWidthPercentage(100);  // tamaño horizontal de la tabla
		table1.setSpacingAfter(20f);	// espacio de una tabla a la otra
		document.add(table1);

// Inicio Tabla 3
float[] widths3={0.60f,0.61f,0.61f,0.60f,0.60f,0.61f,0.61f,0.60f,0.61f,0.60f,0.60f,0.61f,0.61f,0.60f,0.60f,0.61f,0.61f,0.60f,0.61f,0.60f,0.60f,0.61f,0.61f,0.60f,0.60f,0.61f,0.61f,0.60f,0.61f,0.60f };
PdfPTable table3 = new PdfPTable(widths3);

PdfPCell columna1 = new PdfPCell(new Phrase("Tur.",
														FontFactory.getFont("arial",
														10)));
             
// Indicamos cuantas columnas ocupa la celda
columna1.setHorizontalAlignment(Element.ALIGN_CENTER);
columna1.setBorder(Rectangle.NO_BORDER);
table3.addCell(columna1);

PdfPCell columna2 = new PdfPCell(new Phrase("Des",
														FontFactory.getFont("arial",
														10)));
             
// Indicamos cuantas columnas ocupa la celda
columna2.setHorizontalAlignment(Element.ALIGN_CENTER);
columna2.setBorder(Rectangle.NO_BORDER);
table3.addCell(columna2);

for (int y=1; y<=dias; y++) {

PdfPCell columna3 = new PdfPCell(new Phrase("D"+y,
														FontFactory.getFont("arial",
														10)));
             
// Indicamos cuantas columnas ocupa la celda
columna3.setHorizontalAlignment(Element.ALIGN_CENTER);
columna3.setBorder(Rectangle.NO_BORDER);
table3.addCell(columna3);
	
}

table3.setSpacingAfter(20);
table3.setWidthPercentage(100);

document.add(table3);
// fin tabla 3

// Inicio Tabla 4
float[] widths4={0.60f,0.61f,0.61f,0.60f,0.60f,0.61f,0.61f,0.60f,0.61f,0.60f,0.60f,0.61f,0.61f,0.60f,0.60f,0.61f,0.61f,0.60f,0.61f,0.60f,0.60f,0.61f,0.61f,0.60f,0.60f,0.61f,0.61f,0.60f,0.61f,0.60f };
PdfPTable table4 = new PdfPTable(widths4);

dias = dias + 2;

for (int i=1; i<=dias; i++) {
	
	PdfPCell columna = new PdfPCell(new Phrase(""+i,
											FontFactory.getFont("arial",
											10)));
	             
	// Indicamos cuantas columnas ocupa la celda
	columna.setHorizontalAlignment(Element.ALIGN_CENTER);
	columna.setBorder(Rectangle.NO_BORDER);
	table4.addCell(columna);

}


table4.setSpacingAfter(20);
table4.setWidthPercentage(100);

document.add(table4);
// Fin Tabla 4


document.close();

%>





