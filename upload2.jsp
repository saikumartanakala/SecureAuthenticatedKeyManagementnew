<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>

<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>



<html>
<head>
</head>
<body>
<%

ArrayList list = new ArrayList();
		ServletContext context = getServletContext();

		String dirName ="C:/Gallery/";
		String paramname=null;
		String file=null;
		String a=null,b=null,c=null,d=null,ee=null,ff=null,gg=null,hh=null,ii=null,image=null,image2=null;
	
		FileInputStream fs=null,fs2=null;
 
		File file1 = null,file2 = null;	
			
		
		try {
			
			MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB

			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
				if(paramname.equalsIgnoreCase("name"))
				{
					a=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("pwd"))
				{
					b=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("dob"))
				{
					c=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("email"))
				{
					d=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("mob"))
				{
					ee=multi.getParameter(paramname);
				}
				
				
				if(paramname.equalsIgnoreCase("cap"))
				{
					ff=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("utype"))
				{
					gg=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("stype"))
				{
					hh=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("t1"))
				{
					ii=multi.getParameter(paramname);
				}
				}
	
                  int f = 0;
						Enumeration files = multi.getFileNames();	
						while (files.hasMoreElements()) 
						{
							paramname = (String) files.nextElement();
							
							if(paramname != null)
							{
								f = 1;
								image = multi.getFilesystemName(paramname);
								String fPath = "C:\\Gallery\\"+image;
								file1 = new File(fPath);
								fs = new FileInputStream(file1);
								list.add(fs);
								
								
								if (files.hasMoreElements()) 
										{
											paramname = (String) files.nextElement();
											
											if(paramname != null)
											{
													f = 1;
													image2 = multi.getFilesystemName(paramname);
													String fPath1 = "C:\\Gallery\\"+image2;
													file2 = new File(fPath1);
													fs2 = new FileInputStream(file2);
													list.add(fs2);
						                     }
									   }
								  }
								}      
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        	FileInputStream fs1 = null;
                        
                        
			int lyke=0;
			String as="Rejected";
			
 
 PreparedStatement ps=connection.prepareStatement("insert into user(uname,pwd,dob,email,mobile,location,utype,stype,cname,imagess,count,sk,finger) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
				ps.setString(1,a);
               	ps.setString(2,b);
				ps.setString(3,c);	
       			ps.setString(4,d);
       			ps.setString(5,ee);
       			ps.setString(6,ff);
       			ps.setString(7,gg);
				ps.setString(8,hh);
				ps.setString(9,ii);
			 	ps.setBinaryStream(10, (InputStream)fs, (int)(file1.length()));
				ps.setInt(11,lyke);
				
				ps.setString(12,as);
				
 	ps.setBinaryStream(13, (InputStream)fs2, (int)(file2.length()));
	
						int x=ps.executeUpdate();
		
			out.println("User Registered Successfully......");
			  %>
<p><a href="register.html">Back</a>  </p>

</body>
			  </html>
			  <%
			
				
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}
	
 %>
</body>
</html>

