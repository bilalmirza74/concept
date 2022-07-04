<%@ page import = "java.sql.*"%>
<%
String username = request.getParameter("username");
String email = request.getParameter("email");
String subject = request.getParameter("subject");
String message = request.getParameter("message");
				
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/concept","root","");
    PreparedStatement ps = conn.prepareStatement("insert into contact(username, email, subject, message) values(?,?,?,?);");
	ps.setString(1,username);
    ps.setString(2,email);
	ps.setString(3,subject);
    ps.setString(4,message);
    int x = ps.executeUpdate();
	if(x > 0){
		out.println("Message Send Succesfully✅...."); 
	}
	else{
		out.println("Message Sending Fail❌...."); 
	}
	}catch(Exception e){
		out.println(e);
	}
%>

