<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>

    <%
        StringBuffer spnReason = new StringBuffer(request.getParameter("spnReason"));
  
        int loc = (new String(spnReason)).indexOf('\n');
        while(loc > 0){
        	spnReason.replace(loc, loc+1, "<BR>");
            loc = (new String(spnReason)).indexOf('\n');
       }
     %>


	<%= session.getAttribute("netid")%>
	<%= session.getAttribute("majorid")%>
	<%=	session.getAttribute("cid")%>
	<%=	session.getAttribute("secnum")%>
	<%=	session.getAttribute("year")%>
	<%=	session.getAttribute("semesterid")%>

	<%
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/spnrequest";
		String user = "root";
		String password = "";

		Class.forName(driverName);
		conn = DriverManager.getConnection(url, user, password);
		
		Statement statement = conn.createStatement();
        	
		String userNetID = (String)session.getAttribute("netid");
		String userMajorID = (String)session.getAttribute("majorid");
		String userCID = (String)session.getAttribute("cid");
		String userSecNum = (String)session.getAttribute("secnum");
		String userSemesterID = (String)session.getAttribute("semesterid");
		String userYear = (String)session.getAttribute("year");
		String userStatus = "Pending";
		String userResponse = "";
		//String prof = (String)session.getAttribute("profid");

		
		//Find way to get profid 
		String query = "INSERT INTO requesttest VALUES('"+userMajorID+"','"+userCID+"','"+userSecNum+"','"+userNetID+"','"+userStatus+"','"+spnReason+"','"+userSemesterID+"','"+userYear+"','"+userResponse+"')";
		statement.executeUpdate(query);
		
		response.sendRedirect("studentRequestFive.jsp");
	%>
	
	<center><p style="color:red">Error processing request</p></center>

</body>
</html>
