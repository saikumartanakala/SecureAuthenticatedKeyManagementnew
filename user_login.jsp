<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>

<%
    
        String username=request.getParameter("username");      

        String Password=request.getParameter("password");
		String otype=request.getParameter("select5");
		String ctype=request.getParameter("select6");
        application.setAttribute("uname",username);


	    
try
{
	   String sql="SELECT * FROM user where uname='"+username+"' and pwd='"+Password+"' and utype='"+otype+"' and cname='"+ctype+"' ";
        Statement stmt = connection.createStatement();
	    ResultSet rs =stmt.executeQuery(sql);
		String utype="";
		
		
		if(otype.equalsIgnoreCase("Data Owner"))
		{
			if(rs.next())
		    {
                        
		    response.sendRedirect("user_main2.jsp");
	           }
		    else
		    {
		    response.sendRedirect("wronglogin.html");
	          }
		}
		else if(otype.equalsIgnoreCase("Cloud Consumer"))
		{
			if(rs.next())
		    {
		    response.sendRedirect("userverification.jsp");
	           }
		    else
		    {
		    response.sendRedirect("wronglogin.html");
	          }
		}
	   
}

catch(Exception e)
{out.print(e);}
%>

