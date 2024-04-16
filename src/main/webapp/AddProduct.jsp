<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="com.ty.FashiLoginServletApp.*" %>
        <%@page import="java.sql.*" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Insert title here</title>
                <style>
                    body {
                        margin: 20px;
                        padding: 0;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                    }

                    #formhead {
                        background-color: rgb(231, 171, 60);
                        margin: 0px;
                        padding: 10px 0px;
                    }

                    #addsection {
                        width: 60%;
                        border: 1px solid black;
                        border-radius: 8px;
                        overflow: hidden;
                    }
                </style>
            </head>

            <body>

<%
%>
                <form id="addsection" action="AddProductServlet" method="post">
                    <div id="formhead">
                        <h1 style="margin: 0px; text-align: center;">Add Product</h1>
                    </div>
                    <label for="">Enter Product type / Catagery</label><br>
                    <input type="text" name="protype" id="" placeholder="Enter Product type / Catagery"
                        required><br><br>
                    <input type="radio" value="male" name="gender" required>Male
                    <input type="radio" value="female" name="gender" required>Female
                    <input type="radio" value="unisex" name="gender" required>Unisex
                    <br>
                    <label for="">Enter Product Name</label><br>
                    <input type="text" name="proname" id="" placeholder="Enter Product Name" required><br><br>
                    <label for="">Enter Product Colour</label><br>
                    <input type="text" name="procolour" id="" placeholder="Enter Product colour" required><br><br>
                    <label for="">Enter Product Quantity</label><br>
                    <input type="text" name="proquantity" id="" placeholder="Enter Product Quantity" required><br><br>
                    <label for="">Enter Product Details</label><br>
                    <input type="text" name="propara" id="" placeholder="Enter Product Details" required><br><br>
                    <label for="">Enter Product Discount</label><br>
                    <input type="text" name="prodiscount" id="" placeholder="Enter Product Discount" required><br><br>
                    <label for="">Enter Product Price</label><br>
                    <input type="text" name="proprice" id="" placeholder="Enter Product Price" required><br><br>
                    <label for="">Enter Product Description</label><br>
                    <input type="text" name="prodesc" id="" placeholder="Enter Product Description" required><br><br>
                    <label for="">Enter Product img</label><br>
                    <input type="text" name="proimg" id="" placeholder="Enter image full Address" required><br>
                    <input type="submit" value="submit">
                </form>
            </body>

            </html>