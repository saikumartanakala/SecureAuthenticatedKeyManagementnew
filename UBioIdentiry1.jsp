

<%@page import="java.text.DecimalFormat"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<style type="text/css">
<!--
.style1 {
	color: #FF0000;
	font-weight: bold;
}
-->	
</style>
<%@ include file="connect.jsp" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.*"%>
          
<%
				   ArrayList list = new ArrayList();
					
					ServletContext context = getServletContext();
					
					String dirName ="C:/Gallery/";
					String uname=(String)application.getAttribute("uname");
					String paramname=null,bank="",name="",pass="",email="",mno="",addr="",dob="",gender="",pincode="",location="",image=null,image2=null,cloud=null,bin = "";
				
					FileInputStream fs=null,fs2=null;
					
					File file1 = null, file2 = null;	

					try {
						MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024);	
					
							
						int f = 0;
						Enumeration files = multi.getFileNames();	
						while (files.hasMoreElements()) 
						{
							paramname = (String) files.nextElement();
							
							if(paramname != null)
							{
								f = 1;
								image = multi.getFilesystemName(paramname);
							}		
						}
			
			
					
								String sql1="SELECT finger FROM user where  uname='"+uname+"' ";
								Statement stmt1 = connection.createStatement();
								ResultSet rs1 =stmt1.executeQuery(sql1);
								
        while (rs1.next()) { 
            InputStream in = rs1.getBinaryStream(1);
            OutputStream fx = new FileOutputStream(new File("D:\\Test.jpg"));
            
            int c=0;
            while ((c = in.read()) > -1) {
                fx.write(c);
            }
            fx.close();
            in.close();
        }
                                         System.out.println("C:/Gallery/"+image);
             File fileA = new File("C:/Gallery/"+image); 
             File fileB = new File("D:/Test.jpg"); 
             BufferedImage imgA = ImageIO.read(fileA); 
             BufferedImage imgB = ImageIO.read(fileB); 
       
        int width1 = imgA.getWidth(); 
        int width2 = imgB.getWidth(); 
        int height1 = imgA.getHeight(); 
        int height2 = imgB.getHeight(); 
  
        if ((width1 != width2) || (height1 != height2)) {
           %>
									              <br/>
											    </div>
												<p align="center" class="style1">Finger Print Mismatch, Please Provide Correct Finger Print!! </p>
												<div align="center"><br/>
											      <br/>
												  <a href="userverification.jsp"><strong>Back</strong></a>
									              <%
                                                                                          }else 
        { 
            long difference = 0; 
            for (int y = 0; y < height1; y++) 
            { 
                for (int x = 0; x < width1; x++) 
                { 
                    int rgbA = imgA.getRGB(x, y); 
                    int rgbB = imgB.getRGB(x, y); 
                    int redA = (rgbA >> 16) & 0xff; 
                    int greenA = (rgbA >> 8) & 0xff; 
                    int blueA = (rgbA) & 0xff; 
                    int redB = (rgbB >> 16) & 0xff; 
                    int greenB = (rgbB >> 8) & 0xff; 
                    int blueB = (rgbB) & 0xff; 
                    difference += Math.abs(redA - redB); 
                    difference += Math.abs(greenA - greenB); 
                    difference += Math.abs(blueA - blueB); 
                } 
            } 
  
            // Total number of red pixels = width * height 
            // Total number of blue pixels = width * height 
            // Total number of green pixels = width * height 
            // So total number of pixels = width * height * 3 
            double total_pixels = width1 * height1 * 3; 
  
            // Normalizing the value of different pixels 
            // for accuracy(average pixels per color 
            // component) 
            double avg_different_pixels = difference / 
                                          total_pixels; 
  
            // There are 255 values of pixels in total 
            double percentage = (avg_different_pixels / 
                                            255) * 100; 
  
            System.out.println(" Image Difference Percentage-->" +percentage); 
            
            double originalresult=Double.parseDouble(new DecimalFormat("##.####").format(percentage));
            String s4="Image Difference in Percentage-->" +percentage+"\n";
            if(originalresult<=1.00)
            {          
											response.sendRedirect("user_main1.jsp");
            
								 }
								else
								{
										%>
									              <br/>
											    </div>
												<p align="center" class="style1">Finger Print Mismatch, Please Provide Correct Finger Print!! </p>
												<div align="center"><br/>
											      <br/>
												  <a href="userverification.jsp"><strong>Back</strong></a>
									              <%
								}
				
					
					
				
				
}
	}
	 catch (Exception e)
	  {
		out.print(e);
		e.printStackTrace();
	}
%>
												  
                                                </div>
												