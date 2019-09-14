<%--
  Created by IntelliJ IDEA.
  User: Udaypal
  Date: 9/9/2019
  Time: 10:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>

<html>
<head>
  <title>CS 157 A</title>
</head>
<body>
<h1>My Movie List</h1>
<table border="3" cellpadding="10">
    <thead>
        <tr>
            <th>Name</th>
            <th>Year</th>
            <th>Rating</th>
        </tr>
    </thead>
    <tbody>
        <%

            String db = request.getParameter("dbname"); //or root

            String user = "root";
        try {
            java.sql.Connection con;
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, user, "RNuv=*SKss1469");

         %>
        <%
            ResultSet rs = con.createStatement().executeQuery("select * from movies");
            while(rs.next())
        {
        %>
        <tr>
            <%
                String name = rs.getString("name");
                int year = rs.getInt("year");
                double rating = rs.getDouble("rating");
            %>
            <td><%=name %></td>
            <td><%=year %></td>
            <td><%=rating %></td>
        </tr>

        <%
        }
    }
    catch(SQLException e) {
    out.println("SQLException caught: " +e.getMessage());
  }
        %>
    </tbody>
</table>

