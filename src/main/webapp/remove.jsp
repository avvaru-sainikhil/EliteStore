<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remove Product</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI',sans-serif;
}

body{
height:100vh;
display:flex;
justify-content:center;
align-items:center;
background:#f4f6f9;
}

.container{
width:450px;
background:white;
padding:50px;
border-radius:12px;
box-shadow:0 4px 15px rgba(0,0,0,0.1);
text-align:center;
}

h1{
color:#111827;
margin-bottom:30px;
font-size:32px;
}

p{
color:#6b7280;
margin-bottom:30px;
font-size:16px;
}

button{
width:100%;
padding:13px;
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

<div class="container">

<%

try{

String did=request.getParameter("productId");

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection c = DriverManager.getConnection(
"jdbc:oracle:thin:@//localhost:1521/XE",
"system",
"830976");


// CHECK CURRENT QUANTITY

PreparedStatement check=c.prepareStatement(
"select quantity from cart where pid=?");

check.setString(1,did);

ResultSet rs=check.executeQuery();

if(rs.next()){

int qty=rs.getInt(1);

if(qty>1){

// DECREASE QUANTITY

PreparedStatement update=c.prepareStatement(
"update cart set quantity=? where pid=?");

update.setInt(1,qty-1);

update.setString(2,did);

update.executeUpdate();

out.print("<h1>Quantity Decreased</h1>");

}
else{

// REMOVE PRODUCT COMPLETELY

PreparedStatement del=c.prepareStatement(
"delete from cart where pid=?");

del.setString(1,did);

del.executeUpdate();

out.print("<h1>Product Removed</h1>");

}

}

}catch(Exception e){

out.println("Error Caught : "+e);

}

%>

<p>
Cart updated successfully.
</p>

<form action="cart.jsp">

<button>Back To Cart</button>

</form>

</div>

</body>
</html>