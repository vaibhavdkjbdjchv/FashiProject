<%@page import="com.ty.FashiLoginServletApp.FashiLogin"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.sql.*" %>
    <%@ page import = "com.ty.FashiLoginServletApp.MainServer" %>
    <%@ page import = "com.ty.FashiLoginServletApp.FashiLogin" %>
    <%@ page import = "org.json.simple.JSONObject" %>
    
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FASHI</title>
    <link rel="stylesheet" data-purpose="Layout StyleSheet" title="Web Awesome">
        <!-- href="/css/app-wa-6a9cb4a257323146888f1141e7267e2d.css?vsn=d"> -->

    <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.0/css/all.css">

    <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.0/css/sharp-solid.css">

    <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.0/css/sharp-regular.css">

    <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.0/css/sharp-light.css">
    <link rel="shortcut icon" href="./images/OIP.jpg" type="image/x-icon">
    <link rel="stylesheet" href="./Fashi.css">
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
	
		Object loginflag = request.getAttribute("loginflag");
		String loginflagstr = String.valueOf(loginflag);
	
		Object str = request.getAttribute("loginflag");
		
		Class.forName("com.mysql.jdbc.Driver");
	
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=root");
	
		PreparedStatement pstmt = con.prepareStatement("select * from fashidb.products_details where ProId like 'fe%'");
		
		ResultSet rs = pstmt.executeQuery();
		
		
		
		/* JSONParser jParser = new JSONParser(); */
		
		 /* request.setAttribute("loginflag", String.valueOf(true)); */ 
	%>
	<section id = "mainPage">
	<%-- <%= MainServer.loginflag %> --%>
	<div id="container1">
        <div id="mail">
            <i class="fa fa-envelope" aria-hidden="true"></i>
            krishnapan91@gmail.com
        </div>
        <div id="mobilno">
            <i class="fa fa-phone" aria-hidden="true"></i>
            +91 8459149995
        </div>
        <div id="social">
            <a class="linkingcomponent" href="https://www.facebook.com/profile.php?id=100012123313731"><i class="fa-brands fa-facebook-f"></i></a>
            <a class="linkingcomponent" href="https://twitter.com/"><i class="fa-brands fa-twitter"></i></a>
            <a class="linkingcomponent" href="https://instagram.com/krish_na203?igshid=OGQ5ZDc2ODk2ZA=="><i class="fa-brands fa-instagram"></i></a>
            <a class="linkingcomponent" href="https://www.facebook.com/"><i class="fa-brands fa-pinterest-p"></i></a>
        </div>
        
        
        <div id="lang">
            <!-- <img src="./images/flag.jpg" alt="loading"> -->
            <select name="" id="">
                <option value=""><button>English</button></option>
                <option value=""><button>Hindi</button></option>
                <option value=""><button>Marathi</button></option>
            </select>
        </div>
        <div id="login">
            <%if(loginflagstr.equals("null")){ %>
            <form action="./FashiLogin.html">
            	<i class="fa fa-user" aria-hidden="true"></i>
            	<button id = "mainloginbuton">Log in</button>
            </form>
            <%} else{ %>
            <form action="logout" method="post">
            	<i class="fa fa-user" aria-hidden="true"></i>
            	<button id = "mainloginbuton"><%=loginflagstr %></button>
            </form>
            <%} %>
        </div>
    </div>

    <div id="container2">
        <div id="logo">
            <form action="directHomepage" method="post"><button style="background: transparent;border: none"><img src="./images/logo.png.webp" alt=""></button></form>
        </div>
        <div id="searchbar">
            <div style="display: flex;">
            <form action="mainservlet" >
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
    <div id="bannersection">
        <div class="banner">
            <div>
                <img id="banner1" src="./images/banner1.jpg" alt="">
            </div>
            <div id="bannercontent">
                <span class="anime">BAGS, KIDS</span>
                <h1 class="anime"> <strong>Black Friday</strong></h1>
                <div id="banner1para" class="anime">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. <br> Dolorum vel in iste dicta dolor sequi.
                </div>
                <div>
                    <button id="shopbutton" class="anime">Shop Now</button>
                </div>
            </div>
            <div id="salebanner">
                <button>SALE<br> 50%</button>
            </div>
        </div>
        <div class="banner">
            <img id="banner2" src="./images/banner2.jpg" alt="">
        </div>
    </div>
    <section id="groupsection">
        <div id="groupbanner">
        <form action="mainservlet" style="display: contents">
            <div id="groupbanner1" class="groupbanner">
                <div id="gender1" class="gender">
                    <button name="searched" value="male">Men's</button>
                </div>
            </div>
            <div id="groupbanner2" class="groupbanner">
                <div id="gender2" class="gender">
                    <button name="searched" value="female">Woman's</button>
                </div>
            </div>
            <div id="groupbanner3" class="groupbanner">
                <div id="gender3" class="gender">
                    <button>Kid's</button>
                </div>
            </div>
            </form>
        </div>
    </section>
    <section id="collectionsection">
        <div class="largewoman">
            <h1>Women's</h1>
            <button>Discover More</button>
        </div>
        <div id="collection">
            <div id="collectiondiv">
                <ul id="collectionList">
                    <li>Clothings</li>
                    <li>HandBag</li>
                    <li>Shoes</li>
                    <li>Accessories</li>
                </ul>
            </div>
            <div class="container">
                <form action="DynamicProductPage.jsp">
                    <div class="slides">  
                        <div id="slide1" class="slide">
                        <%rs.next(); %>
                            <button name="productSelected" value="<%= rs.getString(2)%>">
                                <div>
                                    <div class="hovercontent">
                                        <i class="fa-duotone fa-bag-shopping cart"></i>
                                        <h3>+ Quick View</h3>
                                        <i class="fa-duotone fa-shuffle shuffle"></i>
                                    </div>
                                    <img src="<%=rs.getString(9) %>" alt="">
                                </div>
                                <div class="content">
                                    <span><%=rs.getString(3) %></span>
                                    <h2><%=rs.getString(4) %></h2>
                                    <h3><%= "Rs. "+ rs.getString(7)+" /-"%></h3>
                                </div>
                            </button>
                        </div>
                        <div id="slide2" class="slide">
                        <%rs.next(); %>
                            <button name="productSelected" value="<%= rs.getString(2)%>">
                                <div id="ho">
                                    <div class="hovercontent">
                                        <i class="fa-duotone fa-bag-shopping cart"></i>
                                        <h3>+ Quick View</h3>
                                        <i class="fa-duotone fa-shuffle shuffle"></i>
                                    </div>
                                    <img src="<%=rs.getString(9) %>" alt="">
                                </div>
                                <div class="content">
                                    <span><%=rs.getString(3) %></span>
                                    <h2><%=rs.getString(4) %></h2>
                                    <h3><%= "Rs. "+ rs.getString(7)+" /-"%></h3>
                                </div>
                            </button>
                        </div>
                        <div id="slide3" class="slide">
                        <%rs.next(); %>
                            <button name="productSelected" value="<%= rs.getString(2)%>">
                                <div id="ho">
                                    <div class="hovercontent">
                                        <i class="fa-duotone fa-bag-shopping cart"></i>
                                        <h3>+ Quick View</h3>
                                        <i class="fa-duotone fa-shuffle shuffle"></i>
                                    </div>
                                    <img src="<%=rs.getString(9) %>" alt="">
                                </div>
                                <div class="content">
                                    <span><%=rs.getString(3) %></span>
                                    <h2><%=rs.getString(4) %></h2>
                                    <h3><%= "Rs. "+ rs.getString(7)+" /-"%></h3>
                                </div>
                            </button>
                        </div>
                        <div id="slide4" class="slide">
                        <%rs.next(); %>
                            <button name="productSelected" value="<%= rs.getString(2)%>">
                                <div id="ho">
                                    <div class="hovercontent">
                                        <i class="fa-duotone fa-bag-shopping cart"></i>
                                        <h3>+ Quick View</h3>
                                        <i class="fa-duotone fa-shuffle shuffle"></i>
                                    </div>
                                    <img src="<%=rs.getString(9) %>" alt="">
                                </div>
                                <div class="content">
                                    <span><%=rs.getString(3) %></span>
                                    <h2><%=rs.getString(4) %></h2>
                                    <h3><%= "Rs. "+ rs.getString(7)+" /-"%></h3>
                                </div>
                            </button>
                        </div>
                        <div id="slide5" class="slide">
                        <%rs.next(); %>
                            <button name="productSelected" value="<%= rs.getString(2)%>">
                                <div id="ho">
                                    <div class="hovercontent">
                                        <i class="fa-duotone fa-bag-shopping cart"></i>
                                        <h3>+ Quick View</h3>
                                        <i class="fa-duotone fa-shuffle shuffle"></i>
                                    </div>
                                    <img src="<%=rs.getString(9) %>" alt="">
                                </div>
                                <div class="content">
                                    <span><%=rs.getString(3) %></span>
                                    <h2><%=rs.getString(4) %></h2>
                                    <h3><%= "Rs. "+ rs.getString(7)+" /-"%></h3>
                                </div>
                            </button>
                        </div>
                </form>
            </div>
        </div>
        <div class="prv-btn ">
            <button class="btncon">
                <i class="fa-solid fa-chevron-right fa-rotate-180"></i>
            </button>
        </div>
        <div class="next-btn ">
            <button class="btncon">
                <i class="fa-solid fa-chevron-right"></i>
            </button>
        </div>
    </section>
    <section id="dealsection">
        <div id="baground">
            <div id="dealcontent">
                <h1>Deal of The Week</h1>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quaerat repudiandae molestiae, fuga ut
                    fugiat eos dolorum cupiditate! </p>
                <div id="rate">
                    <h2>Rs. 750 </h2>
                    <span> / HandBag</span>
                </div>
                <div id="timerdiv">
                    <span>last date</span>
                    <div id="timer">
                        <div class="timer" id="hour"><span>Hour</span></div>
                        <div class="timer" id="min"><span>Min</span></div>
                        <div class="timer" id="sec"><span>Sec</span></div>
                    </div>
                    <button id="shopbutton">Shop Now</button>
                </div>
            </div>
        </div>
    </section>
    <section id="collectionsection2">
        <div id="collection">
            <div id="collectiondiv">
                <ul id="collectionList">
                    <li>Clothings</li>
                    <li>HandBag</li>
                    <li>Shoes</li>
                    <li>Accessories</li>
                </ul>
            </div>
		<% pstmt = con.prepareStatement("select * from fashidb.products_details where ProId like 'ma%'"); 

		 rs = pstmt.executeQuery();
		%>
            <div class="container container2">
            <form action="DynamicProductPage.jsp" >
                <div class="slides slides2">
                    <div id="slide1" class="slide slide2">
                    <%rs.next(); %>
                            <button name="productSelected" value="<%= rs.getString(2)%>">
                        <div>
                            <div class="hovercontent">
                                <i class="fa-duotone fa-bag-shopping cart"></i>
                                <h3>+ Quick View</h3>
                                <i class="fa-duotone fa-shuffle shuffle"></i>
                            </div>
                            <img src="<%=rs.getString(9) %>" alt="">
                        </div>
                        <div class="content">
                            <span><%=rs.getString(3) %></span>
                            <h2><%=rs.getString(4) %></h2>
                            <h3><%= "Rs. "+ rs.getString(7)+" /-"%></h3>
                        </div>
                        </button>
                    </div>
                    <div id="slide2" class="slide slide2">
                    <%rs.next(); %>
                            <button name="productSelected" value="<%= rs.getString(2)%>">
                        <div id="ho">
                            <div class="hovercontent">
                                <i class="fa-duotone fa-bag-shopping cart"></i>
                                <h3>+ Quick View</h3>
                                <i class="fa-duotone fa-shuffle shuffle"></i>
                            </div>
                            <img src="<%=rs.getString(9) %>" alt="">
                        </div>
                        <div class="content">
                            <span><%=rs.getString(3) %></span>
                            <h2><%=rs.getString(4) %></h2>
                            <h3><%= "Rs. "+ rs.getString(7)+" /-"%></h3>
                        </div>
                        </button>
                    </div>
                    <div id="slide3" class="slide slide2">
                    <%rs.next(); %>
                            <button name="productSelected" value="<%= rs.getString(2)%>">
                        <div id="ho">
                            <div class="hovercontent">
                                <i class="fa-duotone fa-bag-shopping cart"></i>
                                <h3>+ Quick View</h3>
                                <i class="fa-duotone fa-shuffle shuffle"></i>
                            </div>
                            <img src="<%=rs.getString(9) %>" alt="">
                        </div>
                        <div class="content">
                            <span><%=rs.getString(3) %></span>
                            <h2><%=rs.getString(4) %></h2>
                            <h3><%= "Rs. "+ rs.getString(7)+" /-"%></h3>
                        </div>
                        </button>
                    </div>
                    <div id="slide4" class="slide slide2">
                    <%rs.next(); %>
                            <button name="productSelected" value="<%= rs.getString(2)%>">
                        <div id="ho">
                            <div class="hovercontent">
                                <i class="fa-duotone fa-bag-shopping cart"></i>
                                <h3>+ Quick View</h3>
                                <i class="fa-duotone fa-shuffle shuffle"></i>
                            </div>
                            <img src="<%=rs.getString(9) %>" alt="">
                        </div>
                        <div class="content">
                            <span><%=rs.getString(3) %></span>
                            <h2><%=rs.getString(4) %></h2>
                            <h3><%= "Rs. "+ rs.getString(7)+" /-"%></h3>
                        </div>
                        </button>
                    </div>
                    <div id="slide5" class="slide slide2">
                    <%rs.next(); %>
                            <button name="productSelected" value="<%= rs.getString(2)%>">
                        <div id="ho">
                            <div class="hovercontent">
                                <i class="fa-duotone fa-bag-shopping cart"></i>
                                <h3>+ Quick View</h3>
                                <i class="fa-duotone fa-shuffle shuffle"></i>
                            </div>
                            <img src="<%=rs.getString(9) %>" alt="">
                        </div>
                        <div class="content">
                            <span><%=rs.getString(3) %></span>
                            <h2><%=rs.getString(4) %></h2>
                            <h3><%= "Rs. "+ rs.getString(7)+" /-"%></h3>
                        </div>
                        </button>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <div class="largewoman largeman">
            <h1>Men's</h1>
            <button>Discover More</button>
        </div>
    </section>
    <section id="postersection">
        <div>
            <div class="poster" id="poster1">
                <div class="posterdiv">
                    <i class="fa-brands fa-instagram"></i><br>
                    <h1>Colorlib_Collection</h1>
                </div>
            </div>
            <div class="poster" id="poster2">
                <div class="posterdiv">
                    <i class="fa-brands fa-instagram"></i><br>
                    <h1>Colorlib_Collection</h1>
                </div>
            </div>
            <div class="poster" id="poster3">
                <div class="posterdiv">
                    <i class="fa-brands fa-instagram"></i><br>
                    <h1>Colorlib_Collection</h1>
                </div>
            </div>
            <div class="poster" id="poster4">
                <div class="posterdiv">
                    <i class="fa-brands fa-instagram"></i><br>
                    <h1>Colorlib_Collection</h1>
                </div>
            </div>
            <div class="poster" id="poster5">
                <div class="posterdiv">
                    <i class="fa-brands fa-instagram"></i><br>
                    <h1>Colorlib_Collection</h1>
                </div>
            </div>
            <div class="poster" id="poster6">
                <div class="posterdiv">
                    <i class="fa-brands fa-instagram"></i><br>
                    <h1>Colorlib_Collection</h1>
                </div>
            </div>
        </div>
    </section>
    <section id="cardsection">
        <h1 id="brand">Shop by Top Brands</h1>
        <div id="cards">
            <div id="card1" class="cardsclass">
                <img class="tp" src="./images/adidas.jpg" alt="">
                <h1 class="brandname">ADIDAS</h1>
                <button id="shopbutton">Shop Now</button>
            </div>
            <div id="card2" class="cardsclass">
                <img class="tp" src="./images/puma.jpg" alt="">
                <h1 class="brandname">PUMA</h1>
                <button id="shopbutton">Shop Now</button>
            </div>
            <div id="card3" class="cardsclass">
                <img class="tp" src="./images/nike.jpg" alt="">
                <h1 class="brandname">NIKE</h1>
                <button id="shopbutton">Shop Now</button>
            </div>
        </div>
    </section>
    <section id="featuresection">
        <div id="features1">
            <i class="fa-sharp fa-solid fa-truck-fast"></i>
            <div class="featurediv">
                <h1>Free Shipping</h1>
                <p>For all Orders over 500 Rs.</p>
            </div>
        </div>
        <div id="features2">
            <i class="fa-solid fa-clock"></i>
            <div class="featurediv">
                <h1>10 Day Replacement</h1>
                <p>Return within 10 days</p>
            </div>
        </div>
        <div id="features3">
            <i class="fa-regular fa-shield-check"></i>
            <div class="featurediv">
                <h1>Secured Payment</h1>
                <p>Safe & Secured Payment </p>
            </div>
        </div>
    </section>
    <section id="lastsocial">
        <i class="fa-brands fa-square-facebook"></i>
        <i class="fa-brands fa-instagram"></i>
        <i class="fa-brands fa-twitter"></i>
        <i class="fa-brands fa-square-snapchat"></i>
    </section>
    </section>
    
    
   			/* boolean login = false;  */
	
			/* request.setAttribute("loginflag", login);  */
			<%
            if(con != null || pstmt != null || rs != null)
            {
            	con.close();
            	pstmt.close();
            	rs.close();
            }
            %>
            <script src="http://code.jquery.com/jquery-latest.min.js"></script>
            <script>
            	var loader = document.getElementById("preloader");
            	var mainPage = document.getElementById("mainPage");
            	
            	window.addEventListener("load",function(){
            		loader.style.display = "none";
            	})
            	window.addEventListener("load",function(){
            		mainPage.style.display = "block";
            	})
            	
            	
            	/* let loginVerify = async () => {
            		console.log(window);
            		let data = await window.fetch("./json/login.json",{
            			method:"GET"
            		});
            		let finalData = await data.json();
            		let div = document.getElementById("mainloginbuton");
            		finalData.map(v => {
            			
            			let {flag,name} = v;
            			console.log(flag);
            			console.log(name);
            		
            			if(Boolean(flag)){
            			div.innerHTML += `<a href="#">${name}</a> `
            			}
            		})
            	} */
            	
            	/* loginVerify(); */
            	
            	
            	let d = new Date()
                let hours = d.getHours();
            	let Minutes = d.getMinutes();
            	let Seconds = d.getSeconds();
            	
            	let bagseconds = document.getElementById("sec");
                let bagmin = document.getElementById("min");
                let baghour = document.getElementById("hour");
                let hn = 24 - hours;
                let mn = 60 - Minutes;
                let sn = 60 - Seconds;
                setInterval(e=>{
                    if(sn > 1){
                    sn--;}
                    else{
                       if(mn > 1){mn--;sn=60;}
                       else{
                    	   hn--;
                    	   mn=60;
                    	   sn=60;
                       }
                    	   
                       }
                       
					baghour.innerHTML=hn+"<span>Hour</span>";
                    bagseconds.innerHTML=sn+"<span>Sec</span>";
                    bagmin.innerHTML=mn+"<span>Min</span>";

                },1000)
            	
            	
            </script>
</body>
</html>