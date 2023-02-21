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
              <h2>Delete the File in Cloud</h2>
              			  <br />
              <%
     
	     	String cname=request.getParameter("select5");
            String fname=request.getParameter("t1");
        
		
		try
		{
			Statement st=connection.createStatement();
			
			String uname=(String)application.getAttribute("uname");
			
			String query="select * from cfiles where oname='"+uname+"' and cname='"+cname+"' and fname='"+fname+"' "; 
	           
	           ResultSet rs=st.executeQuery(query);
			
			if(rs.next())
			{
							
				
				String query1="select * from backup where oname='"+uname+"' and cname='"+cname+"' and fname='"+fname+"'  "; 
		           
		           ResultSet rs1=st.executeQuery(query1);
				
				if(rs1.next())
				{
					
					st.executeUpdate(" delete from cfiles where oname='"+uname+"' and cname='"+cname+"' and fname='"+fname+"' ");
					st.executeUpdate(" delete from backup where oname='"+uname+"' and cname='"+cname+"' and fname='"+fname+"'  ");
					
					out.println("FILE DELETED SUCCESSFULLY IN CLOUD");
					
					
					%><p><a href="Delete.jsp">Back</a></p>



				<%
				}
				else
				{
					out.println("FILE NOT FOUND IN CLOUD");
					
					
					%><p><a href="Delete.jsp">Back</a></p>



				<%
				}
			
			}
			else
			{
				out.println("FILE NOT FOUND IN CLOUD");
				
				
				%><p><a href="Delete.jsp">Back</a></p>



			<%
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
</html>
