<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>

<%
    
        String username=request.getParameter("username");      

        String Password=request.getParameter("password");
        String cloud=request.getParameter("select5");
        application.setAttribute("cname",cloud);


	    
try
{
	   String sql="SELECT * FROM cloud where username='"+username+"' and password='"+Password+"' and cloud='"+cloud+"'";
        Statement stmt = connection.createStatement();
	    ResultSet rs =stmt.executeQuery(sql);
		String utype="";
	   if(rs.next())
	    {
	    response.sendRedirect("cloud_main.jsp");
           }
	    else
	    {
	    response.sendRedirect("wronglogin.html");
          }
}

catch(Exception e)
{out.print(e);}
%>

