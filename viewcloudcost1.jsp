<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
.style1 {
	color: #0000FF;
	font-weight: bold;
}
.style2 {color: #FF0000}
.style3 {font-weight: bold}
-->
</style>
<style type="text/css">
<!--
.style1 {color: #0000FF}
.style2 {
	color: #FF00FF;
	font-size: 14px;
	font-weight: bold;
}
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
.style4 {color: white}
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
              <h2>View Cloud Costs</h2>
              			  <br />
              <table width="601" border="1" align="center">
                  <tr bgcolor="yellow">
    <td width="195"><div align="center" class="style1"><span class="style3">Memory Size </span></div></td>
      <td width="255"><div align="center" class="style1"><span class="style3">Cloud Cost in Rs </span></div></td>
    <td width="249"><div align="center" class="style1"><span class="style3">Cloud Name </span></div></td>
  </tr>

<%

	
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;

      	try 
	{
        
           String cname=request.getParameter("t1");      
      		
      		 
      		
      		String query="select * from cost where cloud='"+cname+"' "; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		s1=rs.getString(1);
		s2=rs.getString(2);
		s3=rs.getString(3);
		
		
	
		%>

  <tr>
    <td><div align="center"><font color="red"><%=s1%></div></td>
    <td><div align="center"><font color="red"><%=s2%></div></td>
    <td><div align="center"><font color="red"><%=s3%></div></td>
  </tr>

<%
	   }
	  
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
</table>
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
          <h2 class="star">Menu Operations </h2>
          <div class="clr"></div>
          <ul class="sb_menu style3">
            <li class="style2"><a href="viewcloudrepu.jsp">Find Reputation</a></li>
            <li class="style2"><a href="viewcloudtrust.jsp">Find Trust Worthy</a></li>
            <li class="style2"><a href="viewcloudcost.jsp">Find Cost & Memory</a></li>
            <li class="style2"><a href="SendTrust.jsp">Send Trustworthiness of Cloud</a></li>
            <li class="style2"><a href="Delete.jsp">Delete</a></li>
            <li class="active"><span class="style2"><a href="viewcloudfiles.jsp">View Cloud Files</a></span></li>
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
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center></div>
</body>
</html>
