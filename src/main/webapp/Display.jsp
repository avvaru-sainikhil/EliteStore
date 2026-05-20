<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>

<%@ page import="java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI',sans-serif;
}

body{
background:#f4f6f9;
padding:40px;
}

.header{
display:flex;
justify-content:space-between;
align-items:center;
margin-bottom:40px;
}

h1{
color:#111827;
}

.cartbtn{
padding:12px 22px;
background:#111827;
color:white;
text-decoration:none;
border-radius:8px;
transition:0.3s;
}

.cartbtn:hover{
background:#374151;
}

.container{
display:grid;
grid-template-columns:repeat(auto-fit,minmax(280px,1fr));
gap:30px;
}

.card{
background:white;
padding:30px;
border-radius:12px;
box-shadow:0 4px 12px rgba(0,0,0,0.08);
transition:0.3s;
}

.card:hover{
transform:translateY(-5px);
}

.name{
font-size:22px;
font-weight:bold;
margin-bottom:15px;
color:#111827;
}

.info{
color:#6b7280;
margin-bottom:10px;
}

.price{
font-size:24px;
font-weight:bold;
margin:20px 0;
color:#111827;
}

button{
width:100%;
padding:12px;
border:none;
border-radius:8px;
background:#111827;
color:white;
font-size:15px;
cursor:pointer;
transition:0.3s;
}

button:hover{
background:#374151;
}

</style>
</head>

<body>

<div class="header">

<h1>Available Products</h1>

<a href="cart.jsp" class="cartbtn">
View Cart
</a>

</div>

<div class="container">

<%

try{

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection c = DriverManager.getConnection(
"jdbc:oracle:thin:@//localhost:1521/XE",
"system",
"830976");

String disp="select distinct * from product";

PreparedStatement ps=c.prepareStatement(disp);

ResultSet rs = ps.executeQuery();

while(rs.next()){

%>

<div class="card">

<div class="name">
<%= rs.getString(1) %>
</div>

<div class="info">
Product ID : <%= rs.getString(2) %>
</div>

<div class="price">
₹ <%= rs.getString(3) %>
</div>

<form action="addcart.jsp" method="post">

<input type="hidden"
name="productId"
value="<%= rs.getString(2) %>">

<input type="hidden"
name="productName"
value="<%= rs.getString(1) %>">

<input type="hidden"
name="productPrice"
value="<%= rs.getString(3) %>">

<button>Add To Cart</button>

</form>

</div>

<%

}

}catch(Exception e){

out.println("Error Caught "+e);

}

%>

</div>

</body>
</html>