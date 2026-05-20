<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI',sans-serif;
}

body{
background:#f4f6f9;
height:100vh;
}

.navbar{
height:70px;
background:#111827;
display:flex;
align-items:center;
padding-left:40px;
color:white;
font-size:28px;
font-weight:bold;
}

.container{
display:flex;
justify-content:center;
gap:40px;
margin-top:120px;
}

.card{
width:320px;
background:white;
padding:40px;
border-radius:12px;
box-shadow:0 4px 15px rgba(0,0,0,0.1);
text-align:center;
transition:0.3s;
}

.card:hover{
transform:translateY(-5px);
}

h1{
margin-bottom:20px;
color:#111827;
}

p{
color:#6b7280;
margin-bottom:30px;
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

<div class="navbar">

Elite Store

</div>

<div class="container">

<div class="card">

<h1>Products</h1>

<p>
Browse all available products in the store.
</p>

<form action="Display.jsp">

<button>View Products</button>

</form>

</div>

<div class="card">

<h1>Shopping Cart</h1>

<p>
View all items added to your cart.
</p>

<form action="cart.jsp">

<button>View Cart</button>

</form>

</div>

</div>

</body>
</html>