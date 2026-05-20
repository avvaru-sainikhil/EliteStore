<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>

<%@ page import="java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CART</title>

<style>

body{
font-family:'Segoe UI',sans-serif;
background:#f4f6f9;
padding:40px;
}

h1{
text-align:center;
margin-bottom:30px;
color:#111827;
}

table{
width:90%;
margin:auto;
border-collapse:collapse;
background:white;
box-shadow:0 4px 12px rgba(0,0,0,0.1);
border-radius:10px;
overflow:hidden;
}

th{
background:#111827;
color:white;
padding:15px;
}

td{
padding:15px;
text-align:center;
border-bottom:1px solid #ddd;
}

tr:hover{
background:#f9fafb;
}

button{
padding:10px 18px;
border:none;
border-radius:6px;
background:#dc2626;
color:white;
cursor:pointer;
transition:0.3s;
}

button:hover{
background:#b91c1c;
}

.total{
margin-top:30px;
text-align:center;
font-size:28px;
font-weight:bold;
color:#111827;
}

.back{
margin-top:30px;
text-align:center;
}

.back button{
background:#111827;
}

.back button:hover{
background:#374151;
}

</style>

</head>

<body>

<h1>Your Cart</h1>

<table>

<tr>

<th>Product Name</th>

<th>Product ID</th>

<th>Price</th>

<th>Quantity</th>

<th>Total</th>

<th>Remove</th>

</tr>

<%

int total=0;

try{

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection c = DriverManager.getConnection(
"jdbc:oracle:thin:@//localhost:1521/XE",
"system",
"830976");

String disp="select * from cart";

PreparedStatement ps=c.prepareStatement(disp);

ResultSet rs = ps.executeQuery();

while(rs.next()){

int qty=rs.getInt(4);

int price=Integer.parseInt(rs.getString(3));

int subtotal=price*qty;

total+=subtotal;

%>

<tr>

<td><%= rs.getString(1) %></td>

<td><%= rs.getString(2) %></td>

<td>₹ <%= price %></td>

<td><%= qty %></td>

<td>₹ <%= subtotal %></td>

<td>

<form action="remove.jsp" method="post">

<input type="hidden"
name="productId"
value="<%= rs.getString(2) %>">

<button>Remove</button>

</form>

</td>

</tr>

<%

}

}catch(Exception e){

out.println("Error Caught : "+e);

}

%>

</table>

<div class="total">

Grand Total : ₹ <%= total %>

</div>

<div class="back">

<form action="Display.jsp">

<button>Continue Shopping</button>

</form>

</div>

</body>
</html>