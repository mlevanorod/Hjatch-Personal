
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.net.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.text.*" %>
<%@ page import="javax.sql.*, javax.naming.*" %>



<%
	Connection conn = null;
	Statement stmt = null;
    ResultSet rset = null;
	
	DriverManager.registerDriver (new com.microsoft.sqlserver.jdbc.SQLServerDriver());
	conn = DriverManager.getConnection("jdbc:sqlserver://192.168.0.10:1433;databaseName=BDPERSONAL", "sqlsoporte", "S0p0rt32014");
	 // Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
  //  conn  = DriverManager.getConnection("jdbc:sqlserver://localhost;PC\SQL; user=sa; password=sql; ");
  
    stmt  = conn.createStatement();
    String COMANDO = "";
   // DecimalFormat formateador = new DecimalFormat("##########0.00 ; (-###0.00)");
   // DecimalFormat formateador1 = new DecimalFormat("##########0.00");
    //DecimalFormat formateador2 = new DecimalFormat("###,###.00");
//DecimalFormat formateador2 = new DecimalFormat("#####,###,##000"); 
%>