<%@page import="com.ty.fashiCartDto.CartProduct"%>
<%@page import="com.ty.fashiCart.Dao.User_Cart_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./Fashi.css">
    <link rel="stylesheet" data-purpose="Layout StyleSheet" title="Web Awesome">
        <!-- href="/css/app-wa-6a9cb4a257323146888f1141e7267e2d.css?vsn=d"> -->

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
<%
	Object cart = request.getAttribute("proId");
	String cartproduct = String.valueOf(cart);
	
	Object cartUser = request.getAttribute("cartingUser");
	String cartUserstr = String.valueOf(cartUser);
	/* List<CartProduct> products = (List<CartProduct>) cartUser; */
	
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=root");
	
	User_Cart_Dao dao = new User_Cart_Dao();
	/* dao.giveListOfProduct(cartUserstr); */
	
	int subTotalOfAllProduct = 0;
	int delivryTotal = 0;
	int noOfProduct = 0;
	%>
	

	 <div id="preloader">
        <img alt="" src="./images/preloader.gif">
    </div>

    <div id="container2" style="padding: 20px; background-color:white; ">
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
    <!-- ================================================================================================================================= -->



    <!-- cart different code -->
    <section id="CartContentsection">
        <section id="Cart_left_setion">
            <aside id="cart_left">
                <h1 id="cartHeadingname"><%= cartproduct+", your Shooping Cart"%></h1>

                <form action="DynamicProductPage.jsp">
                    <table id="cartprotable">
                        <thead id="carttablehead">
                            <tr id="carttableheadrow">
                                <th class="carttableheading1">Product Image</th>
                                <th class="carttableheading3">Product Qty</th>
                                <th class="carttableheading2">Product Description</th>
                            </tr>
                        </thead>

                        <tbody id="cartprotablebody">
                        <%if(!dao.giveListOfProduct(cartUserstr).isEmpty())
	{%>
	<%
	for (CartProduct product : dao.giveListOfProduct(cartUserstr)) 
	{
		 /* String str = String.valueOf(product) ; */
		PreparedStatement pstmt = con.prepareStatement("select * from fashidb.products_details where ProId like ?");
		pstmt.setObject(1, product.getProId());
		ResultSet rs = pstmt.executeQuery();
	%>
                        <%rs.next();%><%noOfProduct++; %>
                            <div>
                                <tr class="cartprotablebodyrow">
                                    <td class="cartprotablebodydata1">
                                        <button class="carttablebotton" name="productSelected" value="<%=rs.getString(2)%>">
                                            <img src="<%=rs.getString(9)%>" alt="" class="cartProImg">
                                        </button>
                                    </td>
                                    <td class="cartprotablebodydata1">
                                        
                                        <span id="QtyInc">+</span>
                                        <input type="text" id="QtyCart" name="TotCarQty" value="1">
                                        <!-- <button class="carttablebotton" name="cartbotton" value="ProductId" id="QtyCart"></button> -->
                                        <span id="QtyDec">-</span>
                                        <!-- <button class="carttablebotton" name="cartbotton" value="ProductId" id="QtyDec">-</button> -->

                                    </td>
                                    <td class="cartprotablebodydata2">
                                        <button class="carttablebotton" name="productSelected" value="<%=rs.getString(2)%>">
                                            <h1 class="cartproducttype"><%=rs.getString(3) %></h1>
                                            <h1 class="cartproductname"><%=rs.getString(4) %></h1>
                                            <!-- <h1 class="cartproductQty"><span class="cartQtyinc">+</span><span class="CartProQty">2</span> <span class="cartQtydec">-</span></h1> -->
                                            <h1 class="proddiscount"><%= rs.getString(6) + "% off"%></h1>
                                            <h1 class="cartproductprice"><%= "Rs. "+ rs.getString(7)+" /-"%></h1>
                                        </button>
                                    </td>
                                </tr>
                            </div>
                            <%subTotalOfAllProduct += Integer.parseInt(rs.getString(7)) ;
                            if(delivryTotal < 100){delivryTotal += 40;}
                            } %>
                            <%%>
                            <%}else{%>
                            	<h1 style="text-align: center; font-size: 20px; margin: 20px;">You Don't Have any Item in Your Cart</h1>
                           <% } %>
                        </tbody>
                    </table>
                </form>
            </aside>
        </section>

        <section id="cart_right_section">

            <aside id="cart_right">
                <div class="cartrightpricediv">
                    <h1 class="cardrightheding">Summary</h1>

                    <div id="cartcountdiv">
                        <h1 id="cartcountheading">Estimated shopping and Tax :</h1>
                        <div id="cartcountdisdiv">
                            <table id="cartpricetable">
                                <tr class="carttabrow">
                                    <td class="carttableleftdata">Subtotal</td>
                                    <%-- <%subTotalOfAllProduct += Integer.parseInt(rs.getString(7)) ; %> --%>
                                    <td class="carttablerightdata"><%=subTotalOfAllProduct%></td>
                                </tr>
                                <tr class="carttabrow">
                                    <td class="carttableleftdata">Delivery charges</td>
                                    <td class="carttablerightdata"><%-- <%if(delivryTotal < 100)delivryTotal *= 40;%> --%><%= delivryTotal %></td>
                                </tr>
                                <tr class="carttabrow">
                                    <td class="carttableleftdata">Total</td>
                                    <td class="carttablerightdata" id="finalPrice"><%=subTotalOfAllProduct + delivryTotal%></td>
                                </tr>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div id="cartcoupon">
                        <input id="couponinput" type="text" name="" id="" placeholder="Enter Coupon Code">
                        <button id="couponbutton">Check</button>
                    </div>

                    <form id="cartbuybuttondiv" action="CartToPayment" method="post">
                        <button id="cartbuybutton" name="pricetopaymentmethod" value="<%=subTotalOfAllProduct + delivryTotal%>">Make Payment</button>
                    </form>
                </div>

            </aside>
        </section>
    </section>

	
    <!-- cart different code -->

    <script>
        var loader = document.getElementById("preloader");

        window.addEventListener("load", function () {
            loader.style.display = "none";
        })
        
        let check = document.getElementById("couponbutton");

        check.addEventListener("click", e=>{
            check.innerText="checked";
            check.style.background="yellowgreen";
        })
        
        let Qtyincrease = document.getElementById("QtyInc");
        let QtyDecrese = document.getElementById("QtyDec");
        let Qtytotal = document.getElementById("QtyCart");
        /* let */ 

         let productqty = 1; 
        
         Qtytotal.setAttribute("value", productqty);

        Qtyincrease.addEventListener("click", e=>{
            productqty++;
            console.log(productqty);
            Qtytotal.setAttribute("value", productqty);
            
        })

        QtyDecrese.addEventListener("click", e=>{
        	if(productqty > 1){
            productqty--;
            console.log(productqty);
            Qtytotal.setAttribute("value", productqty);}
        }) 
        
        
    </script>
</body>
</html>