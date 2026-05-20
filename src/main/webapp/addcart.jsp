<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>

<%@ page import="java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add To Cart</title>

<style>

body{
font-family:'Segoe UI',sans-serif;
background:#f4f6f9;
height:100vh;
display:flex;
justify-content:center;
align-items:center;
}

.box{
width:420px;
background:white;
padding:50px;
border-radius:12px;
box-shadow:0 4px 15px rgba(0,0,0,0.1);
text-align:center;
}

h1{
margin-bottom:30px;
color:#111827;
}

button{
width:100%;
padding:13px;
margin-top:15px;
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

<div class="box">

<%

try{

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection c = DriverManager.getConnection(
"jdbc:oracle:thin:@//localhost:1521/XE",
"system",
"830976");

String id=request.getParameter("productId");

String name=request.getParameter("productName");

String price=request.getParameter("productPrice");


// CHECK PRODUCT ALREADY EXISTS

PreparedStatement check=c.prepareStatement(
"select quantity from cart where pid=?");

check.setString(1,id);

ResultSet rs=check.executeQuery();

if(rs.next()){

// PRODUCT EXISTS → UPDATE QUANTITY

int qty=rs.getInt(1);

qty++;

PreparedStatement update=c.prepareStatement(
"update cart set quantity=? where pid=?");

update.setInt(1,qty);

update.setString(2,id);

update.executeUpdate();

out.print("<h1>Product Quantity Updated</h1>");

}
else{

// NEW PRODUCT INSERT

String ins=
"insert into cart(pname,pid,pprice,quantity) values(?,?,?,?)";

PreparedStatement ps=c.prepareStatement(ins);

ps.setString(1,name);

ps.setString(2,id);

ps.setString(3,price);

ps.setInt(4,1);

ps.executeUpdate();

out.print("<h1>Product Added To Cart</h1>");

}

}catch(Exception e){

out.println("Error Caught : "+e);

}

%>

<form action="Display.jsp">

<button>Continue Shopping</button>

</form>

<form action="cart.jsp">

<button>View Cart</button>

</form>

</div>

</body>
</html>