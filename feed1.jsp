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
.style1 {color: #0000FF}
-->
</style>
<style type="text/css">
<!--
.style1 {
	font-size: 18px;
	color: blue;
	font-weight: bold;
	font-style: italic;
}
.style2 {
	color: #FF0000;
	font-weight: bold;
}
.style3 {color:  white}
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
            <li class="active"><a href="request1.jsp"><span>Request for SK</span></a></li>
          <li class="active"><a href="reqfile.jsp"><span>Request for File</span></a></li>
          <li class="active"><a href="SendTrust.jsp"><span>Feedback about Cloud</span></a></li>
          <li class="active"><a href="attackfeedback.jsp"><span>Attack Feedback</span></a></li>
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
              <h2 class="style1">Attack Feedback</h2>
               <br />
               
               <%

	
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;

      	try 
	{
        
           int mid=Integer.parseInt(request.getParameter("mid"));      
           String uname=(String)application.getAttribute("uname");
      		 
      		
      		String query="select * from feedback where id="+mid+" "; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	if ( rs.next() )
	   {
		i=rs.getInt(1);
		s2=rs.getString(2);
		s3=rs.getString(3);
		s4=rs.getString(4);
		s5=rs.getString(5);
	
		%>
              <form name="form1" method="post" action="feed2.jsp">
                <table width="371" border="0" align="center">
    <tr>
        <td bgcolor="red"><strong><font color="white"><B>Id</strong></td>
      <td><label>
        <input type="text" name="t1" value="<%=i %>" readonly />
      </label></td>
    </tr>
    <tr>
      <td bgcolor="red"><strong><font color="white"><B>Cloud</strong></td>
      <td><input type="text" name="t2" value="<%=s3 %>"  readonly /></td>
    </tr>
    <tr>
      <td bgcolor="red"><strong><font color="white"><B>Feedback</strong></td>
      <td><textarea name="t3"><%=s4%></textarea></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input type="submit" name="Submit" value="Submit">
      </label></td>
    </tr>
  </table>
              </form>
              
              <%
	   }
	  
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
          <h2 class="star">Menu Operations </h2>
          <div class="clr"></div>
             <ul class="sb_menu">
             <li class="active"><a href="viewcloudrepu0.jsp">Find Reputation</a></li>
            <li class="active"><a href="viewcloudtrust0.jsp">Find Trust Worthy</a></li>
            <li class="active"><a href="viewcloudcost0.jsp">Find Cost & Memory</a></li>
            <li class="active"><a href="viewcloudfiles0.jsp">View Cloud Files</a></li>
          </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2><span>I</span></h2>
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
      <p class="lf">&nbsp;</p>
      <p class="rf">&nbsp;</p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
</body>
</html>
