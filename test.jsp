 <%@page import = "java.util.*" session="true"%>

<%@ page  import= 'java.sql.* ' %>
<%@ page  import='java.util.*'  %>
<%@ page  import ='java.awt.Toolkit'  %>
<%@ page  import ='java.text.SimpleDateFormat'  %>

<%@ page import ='com.google.appengine.api.utils.SystemProperty' %>

<html>
<h1>Welcome to Google Cloud Database</h1>

<%

try
{
//out.println("welcome");
String url = null;
if (SystemProperty.environment.value() ==
    SystemProperty.Environment.Value.Production) {
  // Connecting from App Engine.
  // Load the class that provides the "jdbc:google:mysql://"
  // prefix.
  Class.forName("com.mysql.jdbc.GoogleDriver");
  url =
    "jdbc:google:mysql://irfanashra:versag11?user=root";
} else {
 // Connecting from an external network.
  Class.forName("com.mysql.jdbc.Driver");
 // url = "jdbc:mysql://localhost/schooladmin?user=root&password=irfan";
  url = "jdbc:mysql://173.194.241.181/schooladmin?user=irfan&password=irfan";
}
//Connection conn = DriverManager.getConnection("jdbc:google:mysql://usirfa:irfan:usirfa:irfan/database",
  //  "user", "password");
Connection conn = DriverManager.getConnection(url);

Statement stm=conn.createStatement();
//stm.executeUpdate("insert into user values('irfanuer','password irfan','irfan ashraf')");
//stm.executeUpdate("drop table user");
 //stm.executeUpdate("create table user (username varchar(50),password varchar(50),details varchar(50))");
out.println("<table border=1>");
out.println("<tr><th>Username</th><th>Password</th><th>Details</th></tr>");
ResultSet rst = conn.createStatement().executeQuery("select * from new_applications");
while(rst.next())
	{  
	out.println("<tr>");
				out.println("<td>"+rst.getString(1)+"</td>");
				out.println("<td>"+rst.getString(2)+"</td>");
				out.println("<td>"+rst.getString(3)+"</td>");
				
out.println("</tr>");
	}
	
 out.println("Db Created");
}

catch(Exception e)
{
out.println(e.toString());
//out.println(e.printStackTrace().toString());
}






%>



</html>
