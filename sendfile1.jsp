<%@page import="java.time.Instant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ include file="connect.jsp" %>

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
.style1 {color: #FF0000}
-->
</style>
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
.style4 {color:  red}
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

      	try 
	{
      		
      		
      		String uname=(String)application.getAttribute("uname");
      		 
      		String user=request.getParameter("select5");
      		String tname=request.getParameter("file");
      		String msg=request.getParameter("textarea");
      		
      		
      		String h1="";
      		
      		
      		
      		String keyWord = "5765586965748666502846";

      			keyWord = keyWord.substring(0, 16);
      			byte[] keyValue = keyWord.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.ENCRYPT_MODE, key);
      			String encryptedValue = new String(Base64.encode(msg.getBytes()));
      		

      		
      			
      			byte[] keyValue1 = keyWord.getBytes();
      			Key key1 = new SecretKeySpec(keyValue1, "AES");
      			Cipher c1 = Cipher.getInstance("AES");
      			c1.init(Cipher.DECRYPT_MODE, key1);
      			String decryptedValue = new String(Base64.decode(encryptedValue.getBytes()));
      		
      			
      			
      			
      		PrintStream p = new PrintStream(new FileOutputStream("D:/ctrust/"+tname));
			p.print(new String(msg));
			
			MessageDigest md = MessageDigest.getInstance("SHA1");
			FileInputStream fis11 = new FileInputStream("D:/ctrust/"+tname);
			DigestInputStream dis1 = new DigestInputStream(fis11, md);
			BufferedInputStream bis1 = new BufferedInputStream(dis1);
 
			//Read the bis so SHA1 is auto calculated at dis
			while (true) {
				int b1 = bis1.read();
				if (b1 == -1)
					break;
			}
 
			BigInteger bi1 = new BigInteger(md.digest());
			String spl1 = bi1.toString();
			h1 = bi1.toString(16);
			
      		
      		
           
	
%>

<form action="sendfile2.jsp" method="post"  name="form1">
  <table width="612" border="1" align="center">
    <tr>
        <td width="286" bgcolor="yellow"><span class="style4"><b>Cloud Server:-  </span></td>
      <td width="339"><input type="text" name="t12" id="t12" value="<%= user %>" readonly></td>
    </tr>
    
    
    <tr>
      <td bgcolor="yellow"><span class="style4"><b>File Name:- </span></td>
      <td><input type="text" name="t22" id="t22"  value="<%= tname %>" readonly></td>
    </tr>
    <tr>
      <td bgcolor="yellow"><span class="style4"><b>File Content:-</span></td>
      <td><textarea name="textarea" id="textarea"  cols="50" rows="15" readonly><%= msg %></textarea></td>
    </tr>
       
    <tr>
      <td bgcolor="yellow"><span class="style4"><b>Hash Key:-</span></td>
      <td><input name="t5" type="text" id="t5" size="50" value="<%= h1 %>" readonly></td>
    </tr>
    <tr>
      <td bgcolor="yellow"><span class="style4"><b>Encrypted File:- </span></td>
      <td><textarea name="textarea2" cols="50" rows="15" readonly><%= encryptedValue %></textarea></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right">
        <input type="submit" name="Submit" value="Send">
      </div></td>
      <td><input type="reset" name="Submit2" value="Reset"></td>
    </tr>
  </table>
</form>
<%

	   

           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
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
        <ul class="fbg_ul"><li class="active"></li>
        </ul>
      </div>
      <div class="col c3">
        <h2>&nbsp;</h2>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center></div>
</body>
</html>
