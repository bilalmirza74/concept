<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>
<html>
    <body>
        <%
        Connection con=null;
        Statement stmt=null;
        ResultSet rs = null;
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/concept", "root", "");
            stmt =  con.createStatement();
            String qry = "Select * from login where username = '"+username+"'";
            rs = stmt.executeQuery(qry);
        }
        catch(Exception e)
        {
            System.out.println("Exception"+e);
        }
        if(rs.next())
        {
            if(rs.getString(2).equals(password))
            {
                session.setAttribute("username",username);
                session.setAttribute("authenticate",rs.getInt(3));
                if(rs.getInt(3)==0){
                %>
                <jsp:include page="dashboard.html"/>
                <%
                }
                else if(rs.getInt(3)==1){
                %>
                <jsp:include page="dashboard.html"/>
                <%
                }
                else{
                %>
                <jsp:include page="index.html"/>
                <%
                }
            }
            else{
                %>
                <h1> You are not authorized</h1>
                <%
            }
        }
        else{
            %>
            <h1> No such username exists</h1>
            <%
        }
        %>
    </body>
</html>