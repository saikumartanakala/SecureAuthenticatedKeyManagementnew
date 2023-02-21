<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<html>
<body>
<%
			int id= Integer.parseInt(request.getParameter("uid"));
	     	
          
            
           
           
            

String ccat="Student";

               

		
		try
		{
	
			
			
			

 
Statement st=connection.createStatement();
ResultSet rs=st.executeQuery("select * from feedback where id="+id+" ");
if(rs.next()==true)
{
	Statement st1=connection.createStatement();
	ResultSet rs1=st1.executeQuery("select * from feedback1 where id="+id+" ");
	if(rs1.next()==true)
	{
		
		String ct=rs1.getString("feedback");
		
		 Statement st2=connection.createStatement();
		 st2.executeUpdate("update feedback set feedback='"+ct+"' where id="+id+" ");
			
		 Statement st3=connection.createStatement();
		 st3.executeUpdate("delete from Attackers1 where fid="+id+" ");
	}

}
else
{
	out.print("FEEDBACK NOT FOUND");
}






		out.print("FEEDBACK RECOVERED SUCCESSFULLY");
		
		%><p><a href="listallcollusion.jsp">Back</a></p>

</body>
</html>

	<% 	}
	  
	catch(SQLException e)
        {
		out.print(e.getMessage());
	    }  
           %>
