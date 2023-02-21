<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
      <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<html>
<body>
<%
			int id= Integer.parseInt(request.getParameter("uid"));
	     	
          
            
           
           
            

String ccat="Student";

               

		
		try
		{
	
			
			
			

 
Statement st=connection.createStatement();
ResultSet rs=st.executeQuery("select * from cfiles where id="+id+" ");
if(rs.next()==true)
{
	Statement st1=connection.createStatement();
	ResultSet rs1=st1.executeQuery("select * from backup where id="+id+" ");
	if(rs1.next()==true)
	{
		String fname=rs1.getString("fname");
		String mac=rs1.getString("mac");
		String ct=rs1.getString("ct");
		
		
		PrintStream p = new PrintStream(new FileOutputStream("D:/ctrust/"+fname));
		p.print(new String(ct));
		
		 Statement st2=connection.createStatement();
		 st2.executeUpdate("update cfiles set ct='"+ct+"', mac='"+mac+"' where id="+id+" ");
			
		 Statement st3=connection.createStatement();
		 st3.executeUpdate("delete from Attackers2 where id="+id+" ");
	}

}
else
{
	out.print("FILE NOT FOUND");
}






		out.print("FILE RECOVERED SUCCESSFULLY");
		
		%><p><a href="listallcontent.jsp">Back</a></p>

</body>
</html>

	<% 	}
	  
	catch(SQLException e)
        {
		out.print(e.getMessage());
	    }  
           %>
