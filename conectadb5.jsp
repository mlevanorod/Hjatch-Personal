<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.net.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.text.*" %>
<%@ page import="javax.sql.*, javax.naming.*" %>

<%
            Connection conn5 = null;
            Statement stmt5 = null;
            ResultSet rset5 = null;
            DriverManager.registerDriver (new com.microsoft.sqlserver.jdbc.SQLServerDriver());
            conn5 = DriverManager.getConnection("jdbc:sqlserver://192.168.0.10:1433;databaseName=BDPERSONAL", "sa", "S0p0rt3ch@");
            stmt5 = conn5.createStatement();
            String COMANDO5 = "";
%>