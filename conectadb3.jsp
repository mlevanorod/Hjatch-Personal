<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.net.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.text.*" %>
<%@ page import="javax.sql.*, javax.naming.*" %>

<%
            Connection conn3 = null;
            Statement stmt3 = null;
            ResultSet rset3 = null;
            DriverManager.registerDriver (new com.microsoft.sqlserver.jdbc.SQLServerDriver());
            conn3 = DriverManager.getConnection("jdbc:sqlserver://192.168.0.10:1433;databaseName=SIGSALUD", "sa", "S0p0rt3ch@");
            stmt3 = conn3.createStatement();
            String COMANDO3 = "";
%>