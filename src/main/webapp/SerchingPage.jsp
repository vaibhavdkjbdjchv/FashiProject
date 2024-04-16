<%@page import="java.util.Spliterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	/*	ProductSearch = ProductSearch.toLowerCase();
		ProductSearch = ProductSearch.trim(); */
		
		/* String GenderTestQuery = null; */
		/* Object ProductSearcho = request.getAttribute("ProductSearch");
		String ProductSearch = "";
		ProductSearch = ProductSearch.valueOf(ProductSearcho); */
		
		Object QueryToRuno = request.getAttribute("query");
		String QueryToRun = "";
		QueryToRun = QueryToRun.valueOf(QueryToRuno);
		 /* if(ProductSearch.contains(" "))
		{ 
			String gendertest = null;
			String [] splitarray = ProductSearch.split(" "); 
		
			
			String[] genderarray = {"men","man","gents","boy","women","woman","ladies","girl"};
		
			for(int i = 0; i < splitarray.length; i++)
			{
				for(int j = 0; j < genderarray.length; j++)
				{
					
					
					if(j <= 4 && splitarray[i].equals(genderarray[j])  )
					{
						gendertest = "ma%";
						break;
					}
					else if(j > 4 && splitarray[i].equals(genderarray[j]))
					{
						gendertest = "fe%";
						break;
					}
				}
			}
			
			GenderTestQuery = " and ProId like '" + gendertest + "'";
			QueryToRun += GenderTestQuery;
		 }
		else
		{ */
			/* ProductSearch ="%" + ProductSearch + "%"; */
		/* } */  
		
			
		
		Class.forName("com.mysql.jdbc.Driver");
	
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=root");

		PreparedStatement pstmt = con.prepareStatement(QueryToRun);
		/* pstmt.setString(1, ProductSearch);
		pstmt.setString(2, ProductSearch);
		pstmt.setString(3, ProductSearch);.
		pstmt.setString(4, ProductSearch); */
		
		ResultSet rs = pstmt.executeQuery();
	%>
	
	<div id="container2"
    style="padding: 20px; background-color:white; ">
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
        <div id="container3">
    <form action="mainservlet" style="display: flex; justify-content: center; align-items: center; height: 100%; width: 100%;">
                <button name="searched" value="male" style="width: 100%; height: 100%; background: transparent; color: white; font-size: 16px; border: none;">
        <div id="navbar">
        <select name="" id="">
                <option value="">ALL CATEGORIES</option>
        </select>
        </div>
                </button>
     </form>
        <div id="navlist">
            <ul id="homelist">
                <li id="HOME"><form action="directHomepage" method="post" style="display: flex; justify-content: center; align-items: center; height: 100%; width: 100%;"><button style="width: 100%; height: 100%; background: transparent; color: white; font-size: 16px; border: none;">HOME</button></form> </li>
                <li id="SHOP"><form action="mainservlet" style="display: flex; justify-content: center; align-items: center; height: 100%; width: 100%;"> <button name="searched" value="ima" style="width: 100%; height: 100%; background: transparent; color: white; font-size: 16px; border: none;">SHOP</button></form> </li>
                <li id="COLLECTION">COLLECTION
                    <ul id="collectiondrop">
                        <li class="collectionoption"><form action="mainservlet" style="display: flex; justify-content: center; align-items: center; height: 100%; width: 100%;"><button name="searched" value="male" style="width: 100%; height: 100%; background: transparent; color: white; font-size: 16px; border: none;">Men's</button></form> </li>
                        <li class="collectionoption"><form action="mainservlet" style="display: flex; justify-content: center; align-items: center; height: 100%; width: 100%;"><button name="searched" value="female" style="width: 100%; height: 100%; background: transparent; color: white; font-size: 16px; border: none;">Women's</button></form> </li>
                        <li class="collectionoption">Kid's</li>
                    </ul>
                </li>
                <li id="BLOG">BLOG</li>
                <li id="CONTACT">CONTACT</li>
                <li id="PAGES">PAGES</li>
            </ul>
        </div>
    </div>
        <!-- <div id="menubarmargin">
            <div id="menubar">
                <button>MENU <i class="fa fa-bars" aria-hidden="true"></i></button>
            </div>
        </div> -->
    <section id="searchpagecontentsection">
        <aside id="searchpageaside">
            <div id="catag">
            <form action="mainservlet">
                <ul id="catagul">
                    <li><h1>Catagory</h1></li>
                    <li id="womancatagory"><button class="searchpageullist" name="searched" value="male">Men's</button>
                        <ul id="womanul">
                            <li><button class="searchpageullist" name="searched" value="male Shirt">Shirt</button></li>
                            <li><button class="searchpageullist" name="searched" value="male Pant">Pant</button></li>
                            <li><button class="searchpageullist" name="searched" value="male Shoes">Shoes</button></li>
                            <li><button class="searchpageullist" name="searched" value="male Watch">Watch</button></li>
                            <li><button class="searchpageullist" name="searched" value="male Wallet">Wallet</button></li>
                        </ul>
                    </li>
                    <li id="womancatagory"><button class="searchpageullist" name="searched" value="female">Women's</button>
                        <ul id="womanul">
                            <li><button class="searchpageullist" name="searched" value="female Lehenga">Lehenga Choli</button></li>
                            <li><button class="searchpageullist" name="searched" value="female Bag">Hand Bag</button></li>
                            <li><button class="searchpageullist" name="searched" value="female JEWELLERY">Jwellery</button></li>
                            <li><button class="searchpageullist" name="searched" value="female Watch">Watch</button></li>
                            <li><button class="searchpageullist" name="searched" value="female Sweater">Sweater</button></li>
                        </ul>
                    </li>
                </ul>
                <ul>

                </ul>
                </form>
            </div>
        </aside>
        <article id="searchpagearticle">
        
        <%
        	while(rs.next())
        	{
        %>
        	<form action="DynamicProductPage.jsp">
            <div class="slide" style="min-width: 25%; margin: 50px 24px 0px 24px">
                <button name="productSelected" value="<%= rs.getString(2)%>" style="overflow: hidden; border-radius: 15px; border: 1px solid #8080804a;">
                    <div style="width: 100%;">
                        <div class="hovercontent" style="width: 300px; height:375px">
                            <i class="fa-duotone fa-bag-shopping cart"></i>
                            <h3>+ Quick View</h3>
                            <i class="fa-duotone fa-shuffle shuffle"></i>
                        </div>
                        <img src="<%=rs.getString(9) %>" alt="" style="width: 300px;">
                    </div>
                    <div class="content" style="width: 100%;">
                        <span><%=rs.getString(3) %></span>
                        <h2 style="width: 280px; overflow: hidden; margin: 0; height: 70px;" title="<%=rs.getString(4) %>"><%=rs.getString(4) %></h2>
                        <h3><%= "Rs. "+ rs.getString(7)+" /-"%></h3>
                    </div>
                </button>
            </div>
            </form>
            <%}%>
        </article>
    </section>
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