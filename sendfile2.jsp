<%@page import="java.time.Duration"%>
<%@page import="java.time.Instant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ include file="connect.jsp" %>
<%@ page import="java.sql.*,java.util.Random,java.security.KeyPairGenerator,javax.crypto.Cipher,java.security.Key,java.security.KeyPair     "%>

    <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>A dynamic revocable Key Management Protocol tool for Cloud computing environments</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-quicksand.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style1 {
	font-size: 18px;
	color: #FF0000;
	font-weight: bold;
	font-style: italic;
}
.style2 {
	color: #FF0000;
	font-weight: bold;
}
.style3 {color: #FF0000}
.style4 {color: #0000FF}
.style5 {color: #003300}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
       <h1><a href="index.html"><span class="style1">A dynamic revocable Key Management Protocol tool for Cloud computing environments<span></span></a></h1>
      </div>
      <div class="searchform">
        <form id="formsearch" name="formsearch" method="post" action="#">
          <span>
          <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
          </span>
          <input name="button_search" src="images/search.gif" class="button_search" type="image" />
        </form>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="360" alt="" /></a> <a href="#"><img src="images/slide2.jpg" width="960" height="360" alt="" /></a> <a href="#"><img src="images/slide3.jpg" width="960" height="360" alt="" /></a> </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="user_main.jsp"><span>Home Page</span></a></li>
          <li class="active"><a href="purchase.jsp"><span>Purchase VM</span></a></li>
          <li class="active"><a href="sendfile.jsp"><span>Upload File</span></a></li>
         <li class="active"><a href="Verify.jsp"><span>Verify</span></a></li>
		 <li class="active"><a href="index.html"><span>Logout</span></a></li>
          
        </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
        
          <div class="mainbar">
            <div class="article">
            <p>&nbsp;</p>
              <h2>Upload File to Cloud</h2>
              			  <br />
              <%
     Instant start = Instant.now();
	     	String cname=request.getParameter("t12");
            String fname=request.getParameter("t22");
            String pt=request.getParameter("textarea");
            String mac=request.getParameter("t5");
            String ct=request.getParameter("textarea2");
          
            
           
           
            

String ccat="Student";

               

		
		try
		{
	
			Statement st=connection.createStatement();
			
			int length=pt.length();
			Key prKey;
			Key pubKey;
		   
		   Cipher encoder = null;
		   
		   KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
			encoder = Cipher.getInstance("RSA");
			KeyPair kp = kg.generateKeyPair();
			prKey = kp.getPrivate();

			pubKey = kp.getPublic();
			byte[] pub = pubKey.getEncoded();
			byte[] priv = prKey.getEncoded();
			
			
			
			SimpleDateFormat sdfDate = new SimpleDateFormat(
					"dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat(
					"HH:mm:ss");

			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
			String uname=(String)application.getAttribute("uname");
			
			
			String query2="select count(*) from cfiles where oname='"+uname+"' and cname='"+cname+"' and dt='"+strDate+"'"; 
	           
	           ResultSet rs2=st.executeQuery(query2);
			
			if(rs2.next())
			{
				int i=rs2.getInt(1);
				if(i<=5)
				{
					String query1="select * from vm where oname='"+uname+"' and cname='"+cname+"' "; 
			           
			           ResultSet rs1=st.executeQuery(query1);
					
					if(rs1.next())
					{
						String mem=rs1.getString(4);
						String cos=rs1.getString(5);
						int mem1=Integer.parseInt(mem);
						
						
						if(length<mem1)
						{
							int mem2=mem1-length;
                                                        Instant end = Instant.now();
			
                                                        Duration timeElapsed = Duration.between(start, end);
                                                        long tpt=((ct.length())/timeElapsed.toMillis())*1024;
							st.executeUpdate("insert into  cfiles (oname,cname,fname,mac,key1,key2,pt,ct,dt,tdelay,throughput) values ('"+uname+"','"+cname+"','"+fname+"','"+mac+"','"+String.valueOf(pub)+"','"+String.valueOf(priv)+"','"+pt+"','"+ct+"','"+strDate+"','"+timeElapsed.toMillis()+"','"+tpt+"')");
							st.executeUpdate("insert into  backup (oname,cname,fname,mac,key1,key2,pt,ct,dt) values ('"+uname+"','"+cname+"','"+fname+"','"+mac+"','"+String.valueOf(pub)+"','"+String.valueOf(priv)+"','"+pt+"','"+ct+"','"+strDate+"')");

							st.executeUpdate(" update vm set memory='"+mem2+"' where oname='"+uname+"' and cname='"+cname+"'  ");




							out.print("FILE SENT SUCCESSFULLY");
							
							%><p><a href="sendfile.jsp">Back</a></p>
							
							<%
						}
						else if(length>mem1)
						{
							out.print("YOU DONT HAVE MEMORY TO UPLOAD THE FILE CONTACT CLOUD SERVER...!");
							
							%><p><a href="sendfile.jsp">Back</a></p>
							
							<%
						}
						
					}
					else
					{
						out.print("YOU DONT HAVE VM TO UPLOAD THE FILE CONTACT CLOUD SERVER...!");
						
						%><p><a href="sendfile.jsp">Back</a></p>
						
						<%
					}
				}
				if(i>5)
				{
					String ip_h = request.getRemoteAddr();  
					String host_h = request.getRemoteHost(); 
					
					st.executeUpdate(" insert into Attackers values ('"+uname+"','"+cname+"','Uploading File to the Cloud','"+ip_h+"','"+host_h+"','"+dt+"') ");
					
					out.println("LIMIT FOR UPLOADING IS EXPIRED...!");
				
				
				%><p><a href="sendfile.jsp">Back</a></p>



			<%
				}
				
			}
			else
			{
				String query1="select * from vm where oname='"+uname+"' and cname='"+cname+"' "; 
		           
		           ResultSet rs1=st.executeQuery(query1);
				
				if(rs1.next())
				{
					String mem=rs1.getString(4);
					String cos=rs1.getString(5);
					int mem1=Integer.parseInt(mem);
					
					
					if(length<mem1)
					{
						int mem2=mem1-length;
		                  
                                                        Instant end = Instant.now();
			
                                                        Duration timeElapsed = Duration.between(start, end);
 long tpt=((ct.length())/timeElapsed.toMillis())*1024;
						st.executeUpdate("insert into  cfiles (oname,cname,fname,mac,key1,key2,pt,ct,dt,tdelay,throughput) values ('"+uname+"','"+cname+"','"+fname+"','"+mac+"','"+String.valueOf(pub)+"','"+String.valueOf(priv)+"','"+pt+"','"+ct+"','"+strDate+"','"+timeElapsed.toMillis()+"','"+tpt+"')");
						st.executeUpdate("insert into  backup (oname,cname,fname,mac,key1,key2,pt,ct,dt) values ('"+uname+"','"+cname+"','"+fname+"','"+mac+"','"+String.valueOf(pub)+"','"+String.valueOf(priv)+"','"+pt+"','"+ct+"','"+strDate+"')");

						st.executeUpdate(" update vm set memory='"+mem2+"' where oname='"+uname+"' and cname='"+cname+"'  ");




						out.print("FILE SENT SUCCESSFULLY");
						
						%><p><a href="sendfile.jsp">Back</a></p>
						
						<%
					}
					else if(length>mem1)
					{
						out.print("YOU DONT HAVE MEMORY TO UPLOAD THE FILE CONTACT CLOUD SERVER...!");
						
						%><p><a href="sendfile.jsp">Back</a></p>
						
						<%
					}
					
				}
				else
				{
					out.print("YOU DONT HAVE VM TO UPLOAD THE FILE CONTACT CLOUD SERVER...!");
					
					%><p><a href="sendfile.jsp">Back</a></p>
					
					<%
				}
			}
			

 
	 	}
	  
	catch(SQLException e)
        {
		out.print(e.getMessage());
	    }  
           %>
            </div>
          </div>
        </div>
        <div class="article">
          <h2>&nbsp;</h2>
          <div class="clr"></div>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span>Sidebar</span> Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
             <li class="active"><a href="viewcloudrepu.jsp">Find Reputation</a></li>
            <li class="active"><a href="viewcloudtrust.jsp">Find Trust Worthy</a></li>
            <li class="active"><a href="viewcloudcost.jsp">Find Cost & Memory</a></li>
            <li class="active"><a href="SendTrust.jsp">Send Trustworthiness of Cloud</a></li>
            <li class="active"><a href="Delete.jsp">Delete</a></li>
            <li class="active"><a href="viewcloudfiles.jsp">View Cloud Files</a></li>
          </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2>&nbsp;</h2>
        </div>
      <div class="col c2">
        <h2>&nbsp;</h2>
      </div>
      <div class="col c3">
        <h2>&nbsp;</h2>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <p class="lf">.</p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center></div>
</body>
</html>
