<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body id="Buybody">

	<%
		Object username = request.getAttribute("username");
		String usernamestr = String.valueOf(username);
		
		Object userid = request.getAttribute("userid");
		String useridstr = String.valueOf(userid);
		
		Object productprice = request.getAttribute("productprice");
		String productpricestr = String.valueOf(productprice);
		
		
	%>

	<div id="preloader">
        <img alt="" src="./images/preloader.gif">
    </div>
	
	<div id="Buypageheaddiv">
        <form action="directHomepage" method="post"><button style="background: transparent;border: none"><img src="./images/logo.png.webp" alt=""></button></form>
        <h1 id="Buypageheading">Checkout</h1>
        <div id="cart" style="display: flex; justify-content: center;">
            <form action="CartButtonFunction" method="post">
                <button style="background: transparent; border: none;">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                </button>
            </form>
        </div>
    </div>
    
    <header style="width: 98%; background: white; margin: 0 auto; padding: 10px 20px; margin-top: 10px;">
        <h1 style="font-size: 23px;"><%=usernamestr + ", Please fill the Information" %></h1>
    </header>

    <div id="buypageaddressmaindiv">
        <div class="buypageaddressdiv" id="deliveryAdressdiv">
            <i class="fa-sharp fa-regular fa-badge-check" style="color: #db0000;"></i>
            <h1 id="buypageaddressdivdeding">Delivery Address</h1>
        </div>

        <div id="Divvvvvv" style="overflow: hidden; display: none;">
            <div class="buypageaddressformdiv">
                <form action="" id="buypageaddressform">
                    <div id="addresscolour">
                        <i class="fa-sharp fa-regular fa-shield-check"></i>
                        <label for="Address" id="buypageaddressaddlable">Address</label>
                    </div>
                    <div id="buypageaddressformallinputs">

                        <div style="display: flex; justify-content: center; gap: 10px; flex-direction: column;">
                            <div id="streetaddcolour">
                                <i class="fa-sharp fa-regular fa-circle-check"></i>
                                <label for="buypagestritadd" id="buypagestritaddlable">Street address :</label>
                            </div>
                            <input type="text" id="buypagestritadd" required>
                        </div>

                        <div id="buypageaddressformcombinediv">
                            <div class="buypageaddressformcombine">
                                <div id="citycolor">
                                    <i class="fa-sharp fa-regular fa-circle-check"></i>
                                    <label for="buypagecityadd" id="buypagecityaddlable">City :</label>
                                </div>
                                <input type="text" id="buypagecityadd" required>
                            </div>
                            <div class="buypageaddressformcombine">
                                <div id="Statecolor">
                                    <i class="fa-sharp fa-regular fa-circle-check"></i>
                                    <label for="buypagestateadd" id="buypagestateaddlable">State :</label>
                                </div>
                                <input type="text" id="buypagestateadd" required>
                            </div>
                        </div>

                        <div style="display: flex;  gap: 10px; align-items: center; ">
                            <div id="pincodecolor">
                                <i class="fa-sharp fa-regular fa-circle-check"></i>
                                <label for="buypagepincodeadd" id="buypagepincodeaddlable">Pin Code :</label>
                            </div>
                            <input type="text" id="buypagepincodeadd" required>
                        </div>


                        <div id="buyconfirmbuttondiv" style="display: flex; justify-content: center;">
                            <div style="text-align: center; display: flex; align-items: center; justify-content: center;" id="buyconfirmbutton">Submit</div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div id="BuypagePaymentmethod">
        <div id="BuypagePaymentmethodcontent">
            <div class="buypageaddressdiv">
                <i class="fa-regular fa-badge-check"></i>
                <h1 id="buypageaddressdivdeding">Payment method</h1>
            </div>
        </div>
        <div style="overflow: hidden; display: none;" id="paymentdivvvvvvv">

            <div id="buypagepaymentformdiv" style="padding: 20px;">
                <form action="ProductPlaced" method="post">
                    <div id="BuypagePaymentmethodoptiondiv">

                        <div class="BuypagePaymentmethodoption">
                            <i class="fa-sharp fa-regular fa-circle-check"></i>
                            <h1 class="BuypagePaymentmethodoptionhead">Cash On Delivery</h1>
                        </div>

                        <!-- <div class="BuypagePaymentmethodoption">
                    <i class="fa-sharp fa-regular fa-circle-check"></i>
                    <h1 class="BuypagePaymentmethodoptionhead">Credit \ Debit Card</h1>
                </div>

                <div class="BuypagePaymentmethodoption">
                    <i class="fa-sharp fa-regular fa-circle-check"></i>
                    <h1 class="BuypagePaymentmethodoptionhead">Net Banking</h1>
                </div> -->

                    </div>

                    <!-- <form action="Fashi.jsp" method="post"> --> 
                    <div id="productTotalPricediv">
                    
                    <button 
                            style="padding: 10px 30px; background-color: rgb(231, 171, 60); color: white; border: none">
                            <h1 id="productTotal"><%= "Rs. " + productprice + " /-" %> </h1>
                        </button></div><!-- </form> -->
                    <!-- <div id="Cardpaymentdiv">
                <div id="Cardpaymentdivcontent">
                    <div class="BuypagePaymentmethodoption">
                        <i class="fa-sharp fa-regular fa-circle-check"></i>
                        <label id="Cardpaymentheading" style="font-size: 20px;">Card Details</label>
                    </div>
                    <form action="" id="Cardpaymentform">
                        <div>
                            <div style="display: flex;  gap: 10px; align-items: center; ">
                                <i class="fa-sharp fa-regular fa-circle-check"></i>
                                <label for="CardHolder">Card Holder Name</label>
                            </div>
                            <input type="text">
                        </div>
                    </form>
                </div>
            </div> -->
                </form>
            </div>
        </div>
    </div>

    <script>
    
    var loader = document.getElementById("preloader");

    window.addEventListener("load", function () {
        loader.style.display = "none";
    })

    let deliveryAdressdiv = document.getElementById("deliveryAdressdiv");

    deliveryAdressdiv.addEventListener("click", e => {

        deliveryAdressdiv.innerHTML = "<i class=\"fa-sharp fa-regular fa-badge-check\" style=\"color: #1cd204;\"></i><h1 id = \"buypageaddressdivdeding\" > Delivery Address</h1 > "
        let div = document.getElementById("Divvvvvv");
        div.style.display = "block";
    })

    let streetadd = document.getElementById("buypagestritadd");
    let streetflag = false;

    streetadd.addEventListener("keyup", e => {
        streetflag = true;
        let streetaddcolour = document.getElementById("streetaddcolour");
        streetaddcolour.innerHTML = "<i class=\"fa-sharp fa-solid fa-circle-check\" style=\"color: #00db04;\"></i> <label for=\"buypagestritadd\" id=\"buypagestritaddlable\">Street address :</label>"
    })


    let buypagecityadd = document.getElementById("buypagecityadd");
    let cityflag = false;

    buypagecityadd.addEventListener("keyup", e => {
        cityflag = true;
        let citycolor = document.getElementById("citycolor");
        citycolor.innerHTML = "<i class=\"fa-sharp fa-solid fa-circle-check\" style=\"color: #00db04;\"></i> <label for=\"buypagestritadd\" id=\"buypagestritaddlable\">City :</label>"
    })


    let buypagestateadd = document.getElementById("buypagestateadd");
    let stateflag = false;

    buypagestateadd.addEventListener("keyup", e => {
        stateflag = true;
        let Statecolor = document.getElementById("Statecolor");
        Statecolor.innerHTML = "<i class=\"fa-sharp fa-solid fa-circle-check\" style=\"color: #00db04;\"></i> <label for=\"buypagestritadd\" id=\"buypagestritaddlable\">State :</label>"
    })


    let buypagepincodeadd = document.getElementById("buypagepincodeadd");
    let pincodeflag = false;

    buypagepincodeadd.addEventListener("keyup", e => {
        pincodeflag = true;
        let pincodecolor = document.getElementById("pincodecolor");
        pincodecolor.innerHTML = "<i class=\"fa-sharp fa-solid fa-circle-check\" style=\"color: #00db04;\"></i> <label for=\"buypagestritadd\" id=\"buypagestritaddlable\">Pin Code :</label>"
    })

    
    
    
    /* ===================================================================================== */
     setInterval(e => {
    	if(streetadd.getAttribute("value").length < 5){streetflag = false; console.log("i am working")}
    },500) 

    /* ===================================================================================== */
    
    
    setInterval(e => {
        if (streetflag && cityflag && stateflag && pincodeflag) {
            let addresscolour = document.getElementById("addresscolour");
            addresscolour.innerHTML = "<i class=\"fa-sharp fa-solid fa-shield-check\" style=\"color: #00db04;\"></i><label for=\"Address\" id=\"buypageaddressaddlable\">Address</label> "
            
            
            
            let buyconfirmbutton = document.getElementById("buyconfirmbutton");
            buyconfirmbutton.addEventListener("click", e => {
                deliveryAdressdiv.innerHTML = "<i class=\"fa-sharp fa-solid fa-badge-check\" style=\"color: #00db04;\"></i><h1 id = \"buypageaddressdivdeding\" > Delivery Address</h1 > "
                    
                    let div = document.getElementById("Divvvvvv");
                    div.style.display = "none";
                    
                    let paymentdivvvvvvv = document.getElementById("paymentdivvvvvvv")
                    paymentdivvvvvvv.style.display="block"
                    
                })
            }
            
        }, 1000);
    
    
    
    </script>

</body>
</html>