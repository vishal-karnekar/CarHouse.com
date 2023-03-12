<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=neon|outline|emboss|shadow-multiple">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=fire">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
.nav-link{
 color:white;

}
.nabar-brand{
  font-family: "Sofia", sans-serif;
  }
body{
 background:#D2FAFF ;
 }
table, th, td {
  border: 1px solid black;
  text-align: center;
  
}
.nabar-brand{
  font-family: "Sofia", sans-serif;
  }
* {
	box-sizing: border-box
}
/* Add padding to containers */
.container {
	padding: 16px;
}

/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	display: inline-block;
	border: none;
	background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
	background-color: #ddd;
	outline: none;
}

/* Overwrite default styles of hr */
hr {
	border: 2px solid #63B100;
	margin-bottom: 25px;
}
h2{
font-family:sans-serif;
}
.card-text{
font-family:sans-serif;
}
</style>
</head>
<body>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>\
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql"%>

<!-- Navbar start -->
<nav class="navbar navbar-expand-lg navbar-light bg-primary">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand fw-bolder font-effect-neon border-bottom border-danger border-5 rounded-pill" href="#">CarHouse.com</a>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link fw-bold font-effect-emboss" href="index.html">Home</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold font-effect-emboss" href="UsedCars.html">Used Car's</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold font-effect-emboss" href="AboutUs.html">About Us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold font-effect-emboss " href="Login.html">Login_Here</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold font-effect-emboss" href="Register.html">Register_Here</a>
        </li>
      </ul>
      <a class="btn btn-outline-danger fw-bold" href="#" role="button">Log Out</a>
 
    </div>
  </div>
</nav>
<!-- Navbar end -->

<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost/batch12" user="root" password=""/>
<sql:query dataSource="${db}" var="rs">
select * from car;
</sql:query>

<div class="table-responsive d-flex justify-content-center mb-2">
<table class="table table-danger caption-top" >
 <caption>Your Order List</caption>

<tr>
<th>Id</th>
<th>Customer Name</th>
<th>Car Name</th>
<th>Color</th>
<th>Email</th>
<th>Address</th>
<th>Pincode</th>
<th>Mobile-No</th>

</tr>

<c:forEach var="table" items="${rs.rows}">
<tr>
<td><c:out value="${table.id}"/></td>
<td><c:out value="${table.Name}"/></td>
<td><c:out value="${table.Car_Name}"/></td>
<td><c:out value="${table.Color}"/></td>
<td><c:out value="${table.Email}"/></td>
<td><c:out value="${table.Address}"/></td>
<td><c:out value="${table.Pin_Code}"/></td>
<td><c:out value="${table.Mobile_No}"/></td>
</tr>
</c:forEach>
</table>
</div>

<!--Update  -->
	<div class="fluid container">
		<form action=Updser method="post">
			<fieldset>
				<legend>Update Your Order !!</legend>
				<hr>
				<label for="name"><b>Your Order ID</b></label> <input type="text" placeholder="Enter Your Order ID" name="id" required>
				<label for="name"><b>Update Name</b></label> <input type="text" placeholder="Enter Your Name" name="firstname" required>
				<label for="cname"><b>Update Car Name</b></label> <input type="text" placeholder="Enter Updated Car Name" name="carname" required>
				<label for="color"><b>Change Color</b></label> <input type="text" placeholder="Enter Changed Color" name="color" required>
				<label for="email"><b>Update Email</b></label> <input type="text" placeholder="Update Your Email" name="email" required>
				<label for="add"><b>Update Address</b></label> <input type="text" placeholder="Update Your Address"name="address" required>
				<label for="pin"><b>Update Pincode</b></label> <input type="text" placeholder="Update Your Pincode" name="pincode"required>
				<label for="pin"><b>Update Mobile-No</b></label> <input type="text" placeholder="Update Your Mobile_No" name="mobile_no" required>
				<hr>
				<input type="submit" value="Submit" style="margin-left: 70px;">
				
			</fieldset>
		</form>
	</div>

	<!-- footer -->
    <footer class="text-white text-center text-lg-start bg-primary">
    <!-- Grid container -->
    <div class="container p-4">
      <!--Grid row-->
      <div class="row mt-4">
        <!--Grid column-->
        <div class="col-lg-4 col-md-12 mb-4 mb-md-0">
          <h5 class="text-uppercase mb-4 fw-bold">carhouse.com</h5>
  
          <p>
          The offer that we make based on the car details you fill will be final and binding.
          </p>
  
          <p>
           CarHouse.com offers you a great choice and value for your money on your used car purchase.
          </p>
  
         
        </div>
        <!--Grid column-->
  
        <!--Grid column-->
        <div class="col-lg-4 col-md-6 mb-4 mb-md-0">
  
          <ul class="fa-ul" style="margin-left: 1.65em;">
            <li class="mb-3">
              <span class="fa-li"><i class="fas fa-home"></i></span><span class="ms-2">Magarpatta City, Pune, Maharashtra</span>
            </li>
            <li class="mb-3">
              <span class="fa-li"><i class="fas fa-envelope"></i></span><span class="ms-2">admine@gmail.com</span>
            </li>
            <li class="mb-3">
              <span class="fa-li"><i class="fas fa-phone"></i></span><span class="ms-2">+91 9818818181</span>
            </li>
            <li class="mb-3">
              <span class="fa-li"><i class="fas fa-print"></i></span><span class="ms-2">+91 8888188181</span>
            </li>
          </ul>
          
           <div class="mt-4">
            <!-- Facebook -->
            <a type="button" class="btn btn-floating btn-primary btn-lg"><i class="fab fa-facebook-f"></i></a>
            <!-- Dribbble -->
            <a type="button" class="btn btn-floating btn-primary btn-lg"><i class="fab fa-dribbble"></i></a>
            <!-- Twitter -->
            <a type="button" class="btn btn-floating btn-primary btn-lg"><i class="fab fa-twitter"></i></a>
            <!-- Google + -->
            <a type="button" class="btn btn-floating btn-primary btn-lg"><i class="fab fa-google-plus-g"></i></a>
            <!-- Linkedin -->
          </div>
        </div>
        <!--Grid column-->
  
        <!--Grid column-->
        <div class="col-lg-4 col-md-6 mb-4 mb-md-0">
          <h5 class="text-uppercase mb-4 fw-bold">Opening hours</h5>
  
          <table class="table text-center text-white">
            <tbody class="font-weight-normal">
              <tr>
                <td>Mon - Thu:</td>
                <td>8am - 9pm</td>
              </tr>
              <tr>
                <td>Fri - Sat:</td>
                <td>8am - 1am</td>
              </tr>
              <tr>
                <td>Sunday:</td>
                <td>9am - 10pm</td>
              </tr>
            </tbody>
          </table>
        </div>
        <!--Grid column-->
      </div>
      <!--Grid row-->
    </div>
    <!-- Grid container -->
  
    <!-- Copyright -->
    <div class="text-center p-1" style="background-color: rgba(0, 0, 0, 0.2);">
      © 2022 Copyright:
      <a class="text-white" href=>Carhouse.com</a>
      <p class="mb-0">Design And Developed By- Vishal Karnekar.
    </div>
    <!-- Copyright -->
  </footer>


</body>
</html>