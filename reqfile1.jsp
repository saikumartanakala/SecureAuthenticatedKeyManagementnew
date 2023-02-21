<%@page import="java.net.InetAddress"%>
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
<script type='text/javascript'>

function saveTextAsFile()
{
	var textToWrite = document.getElementById("textarea").value;
	var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
	var fileNameToSaveAs = document.getElementById("t4").value;

	var downloadLink = document.createElement("a");
	downloadLink.download = fileNameToSaveAs;
	downloadLink.innerHTML = "Download File";
	if (window.webkitURL != null)
	{
		// Chrome allows the link to be clicked
		// without actually adding it to the DOM.
		downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
	}
	else
	{
		// Firefox requires the link to be added to the DOM
		// before it can be clicked.
		downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
		downloadLink.onclick = destroyClickedElement;
		downloadLink.style.display = "none";
		document.body.appendChild(downloadLink);
	}

	downloadLink.click();
}

function destroyClickedElement(event)
{
	document.body.removeChild(event.target);
}



</script>
<style type="text/css">
<!--
.style1 {
	font-size: 18px;
	color: #FF0000;
	font-weight: bold;
	font-style: italic;
}
.style2 {
	color:  yellow;
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
           <li class="active"><a href="request1.jsp"><span>Request for SK</span></a></li>
          <li class="active"><a href="reqfile.jsp"><span>Request for File</span></a></li>
          <li class="active"><a href="SendTrust0.jsp"><span>Feedback about Cloud</span></a></li>
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
              <h2>View Cloud Files </h2>
              			  <br />
              

<%

	
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int j=0,k=0;

      	try 
	{
        
           String cname=request.getParameter("t1");  
		    String fname=request.getParameter("t2");
			 String oname=request.getParameter("t3");
			  String sk=request.getParameter("t4");    
           String uname=(String)application.getAttribute("uname");
           
           Statement st=connection.createStatement();
           
           SimpleDateFormat sdfDate = new SimpleDateFormat(
					"dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat(
					"HH:mm:ss");

			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
      		 
      		
			String query2="select count(*) from udownloads where oname='"+uname+"' and cname='"+cname+"' and dt='"+strDate+"'"; 
	           
	           ResultSet rs2=st.executeQuery(query2);
			
			if(rs2.next())
			{
				int i=rs2.getInt(1);
				if(i<=2)
				{
					String query="select * from cfiles where cname='"+cname+"' and fname='"+fname+"' and oname='"+oname+"' and key2='"+sk+"'  "; 
			          
			           ResultSet rs=st.executeQuery(query);
				if ( rs.next() )
				   {
					
					s2=rs.getString("pt");
					
				
					%>

			  <table width="300" border="1" align="center">
                              <tr >
                                  <td bgcolor="red" width="100"> <span class="style2">Cloud Name </span></td>
			    <td><%= cname %></td>
			  </tr>
			  <tr >
			    <td bgcolor="red"><span class="style2">Owner Name </span></td>
			    <td><%= oname %></td>
			  </tr>
			  <tr >
			    <td bgcolor="red"><span class="style2">File Name </span></td>
			    <td><input type="text" name="t4" id="t4" value="<%= fname %>" readonly /></td>
			  </tr>
			  <tr >
			    <td bgcolor="red"><span class="style2">File Content </span></td>
			    <td><textarea name="textarea" id="textarea" cols="50" rows="15"><%= s2 %></textarea></td>
			  </tr>
			  <tr>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			  </tr>
			  <tr>
			    <td>&nbsp;</td>
			    <td><button onClick="saveTextAsFile()">Download</button></td>
			  </tr>
			</table>

			<%
InetAddress localhost = InetAddress.getLocalHost(); 
        System.out.println("System IP Address : " + 
                      (localhost.getHostAddress()).trim()); 
			String ip_h = (localhost.getHostAddress()).trim();
			String host_h = (localhost.getHostAddress()).trim();
			st.executeUpdate(" insert into udownloads values ('"+uname+"','"+cname+"','"+fname+"','"+sk+"','"+ip_h+"','"+host_h+"','"+strDate+"') ");

				   }
				}
				if(i>2)
				{ InetAddress localhost = InetAddress.getLocalHost(); 
					String ip_h = (localhost.getHostAddress()).trim();  
					String host_h = (localhost.getHostAddress()).trim();
					
					st.executeUpdate(" insert into Attackers values ('"+uname+"','"+cname+"','"+fname+"','"+ip_h+"','"+host_h+"','"+dt+"','"+sk+"') ");
					
					out.println("LIMIT FOR DOWNLOADING IS EXPIRED...!");
				
				
				%><p><a href="reqfile.jsp">Back</a></p>



			<%
				}
			}
			else
			{
				String query="select * from cfiles where cname='"+cname+"' and fname='"+fname+"' and oname='"+oname+"' and key2='"+sk+"'  "; 
		          
		           ResultSet rs=st.executeQuery(query);
			if ( rs.next() )
			   {
				
				s2=rs.getString("pt");
				
			
				%>

		  <table width="300" border="1" align="center">
		  <tr >
		    <td bgcolor="red" width="100"><span class="style2">Cloud Name </span></td>
		    <td><%= cname %></td>
		  </tr>
		  <tr >
		    <td bgcolor="red"><span class="style2">Owner Name </span></td>
		    <td><%= oname %></td>
		  </tr>
		  <tr >
		    <td bgcolor="red"><span class="style2">File Name </span></td>
		    <td><input type="text" name="t4" id="t4" value="<%= fname %>" readonly /></td>
		  </tr>
		  <tr >
		    <td bgcolor="red"><span class="style2">File Content </span></td>
		    <td><textarea name="textarea" id="textarea" cols="50" rows="15"><%= s2 %></textarea></td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td><button onClick="saveTextAsFile()">Download</button></td>
		  </tr>
		</table>

		<%

		String ip_h = request.getRemoteAddr();  
		String host_h = request.getRemoteHost(); 
		st.executeUpdate(" insert into udownloads values ('"+uname+"','"+cname+"','"+fname+"','"+sk+"','"+ip_h+"','"+host_h+"','"+strDate+"') ");

			   }
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
          <h2 class="star"><span>Sidebar</span> Menu</h2>
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
      <p class="rf">&nbsp;</p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center></div>
</body>
</html>
