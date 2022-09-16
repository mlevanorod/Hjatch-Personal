
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.net.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.text.*" %>
<%@ page import="javax.sql.*, javax.naming.*" %>

<%
            Connection conn2 = null;
            Statement stmt2 = null;
            ResultSet rset2 = null;
			DriverManager.registerDriver (new com.microsoft.sqlserver.jdbc.SQLServerDriver());
			conn2 = DriverManager.getConnection("jdbc:sqlserver://192.168.0.10:1433;databaseName=BDPERSONAL", "sa", "S0p0rt3ch@");
            stmt2 = conn2.createStatement();
            String COMANDO2 = "";
%>