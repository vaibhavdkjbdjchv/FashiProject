<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "com.ty.FashiLoginServletApp.*" %>
    <%@ page import = "com.ty.FashiLoginServletApp.FashiLogin" %>
    <%@page import = "java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./Fashi.css"> 
<link rel="stylesheet" data-purpose="Layout StyleSheet" title="Web Awesome"
            href="/css/app-wa-6a9cb4a257323146888f1141e7267e2d.css?vsn=d">

        <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.0/css/all.css">

        <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.0/css/sharp-solid.css">

        <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.0/css/sharp-regular.css">

        <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.0/css/sharp-light.css">
        <link rel="shortcut icon" href="./New folder/fashi project/images/OIP.jpg" type="image/x-icon">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Mulish&display=swap" rel="stylesheet">
        <!-- <link rel="stylesheet" href="./fonts/font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.css"> -->

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Caprasimo&family=Mulish&display=swap" rel="stylesheet">
        <link
            href="https://fonts.googleapis.com/css2?family=Borel&family=Dancing+Script&family=IBM+Plex+Sans:wght@100&family=Roboto+Slab:wght@700&family=Roboto:wght@100;300;400;500;700;900&display=swap"
            rel="stylesheet">
</head>
<body>
<div id="preloader">
		<img alt="" src="./images/preloader.gif">
	</div>


	 <%
			String str = request.getParameter("productSelected");
			
        	Class.forName("com.mysql.jdbc.Driver");
        	
        	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=root");
        	
        	PreparedStatement pstmt = con.prepareStatement("select * from fashidb.products_details where ProId = ?");
        	pstmt.setString(1,str);
        	ResultSet rs = pstmt.executeQuery();
        	rs.next();
        	String protype = rs.getString(3);
        	String proname = rs.getString(4);
        	String propara = rs.getString(5);
        	String prodiscount = rs.getString(6);
        	String proprice = rs.getString(7);
        	String proimg = rs.getString(9);
        	String prodiscrip = rs.getString(8);
        	
        	/* Object flag =request.getAttribute("loginflag") ;
         	String loflag = String.valueOf(flag);
         	boolean lflag = Boolean.parseBoolean(loflag); */
         	
         %>
         <%-- <%=flag %> --%>
            <%-- <div id="container1">
                <div id="mail">
                    <i class="fa fa-envelope" aria-hidden="true"></i>
                    krishnapan91@gmail.com
                </div>
                <div id="mobilno">
                    <i class="fa fa-phone" aria-hidden="true"></i>
                    +91 8459149995
                </div>
                <div id="social">
                    <i class="fa-brands fa-facebook-f"></i>
                    <i class="fa-brands fa-twitter"></i>
                    <i class="fa-brands fa-linkedin\"></i>
                    <i class="fa-brands fa-pinterest-p"></i>
                </div>
                <div id="lang">
                    <!-- <img src=\"./images/flag.jpg\" alt=\"loading\"> -->
                    <select name="" id="">
                        <option value=""><button>English</button></option>
                        <option value=""><button>Hindi</button></option>
                        <option value=""><button>Marathi</button></option>
                    </select>
                </div>
                <div id="login" style="display: flex; gap:10px;">
                    <i class="fa fa-user" aria-hidden="true"></i>
                    <%boolean b = Boolean.parseBoolean(request.getParameter("loginflag")) ;%>
                    <% if(lflag){%>
                    <form action="logout" method = "post" >
                    <button><i class=\"fa-solid fa-image-user\">${username}</i></button>
                    </form><%}
                    else{%>
                    <button><a href="./FashiLogin.html"> Log in</a></button> 
                    <%} %> 
                </div>
            </div> --%>

            <div id="container2"
                style="position: -webkit-sticky; position: sticky;top: 0; padding: 10px; background-color:white;">
                <div id="logo">
                    <form action="directHomepage" method="post"><button style="background: transparent;border: none"><img src="./images/logo.png.webp" alt=""></button></form>
                </div>

                <div id="searchbar">
                    <div style="display: flex;">
            <form action="mainservlet">
                <button id="searchvalues" name="searched" value="ima">All Products</button>
                </form>
                <form style="display: inline-block;" id="searchid" action="mainservlet">
                    <input type="search" placeholder="What do you need? " name="searched">
                    <button id="searchbutton"><i class="fa fa-search" aria-hidden="true"></i></button>
                </form>
                    </div>
                </div>
                <div id="cart" style="display: flex; justify-content: center;">
                    <i class="fa-regular fa-heart"></i>
                    <form action="CartButtonFunction" method="post">
            	<button style="background: transparent; border: none;">
            		<i class="fa fa-shopping-cart" aria-hidden="true"></i>
            	</button>
            </form>
                </div>
            </div>
            <div id="productSection">
                <div id="productimg">
                    <div id="proimg">
                        <img src="<%=rs.getString(9)%>" alt="">
                    </div>
                    <div style="display: flex; flex-direction: row; justify-content: space-between; width: 90% ">
                    <form id="purchase" action="Cart" method="post">
                        <button id="Cartbutt" name="purchasebutt" value="<%=rs.getString(2)%>">Add To Cart</button>
                    </form>
                    <form id="purchase" action="Buy" method="post">
                        <button id = "BuyButt" name="purchasebutt" value="<%=rs.getString(2)%>">Buy Now</button>
                     </form>
                     </div>
                </div>
                <div id="productcontent">
                    <div id="prodheding">
                        <span><%=rs.getString(3)%></span>
                        <h2><%=rs.getString(4)%></h2>
                        <p><%=rs.getString(5)%>
                        </p>
                    </div>
                    <div id="Productpricedesc">
                        <h2 id="proddiscount"><%= rs.getString(6) + "% off"%> 
                        </h2>
                        <h1 id="Productprice"><%= "Rs. "+rs.getString(7) + " /-" %></h1> 

                    </div>
                    <br>
                    <hr>
                    <div id="proddescp">
                        <p>
                            <%= rs.getString(8) %>
                        </p>
                    </div>
                </div>
            </div>
            <%
            if(con != null || pstmt != null || rs != null)
            {
            	con.close();
            	pstmt.close();
            	rs.close();
            }
            %>
            
            <script>
            	var loader = document.getElementById("preloader");
            	
            	window.addEventListener("load",function(){
            		loader.style.display = "none";
            	})
            </script>
</body>
</html>