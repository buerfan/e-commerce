<%@page import="model.CategoryModel"%>
<%@page import="model.ProductModel"%>
<%@page import="model.OrdersModel"%>
<%@page import="model.DeliveryPersonModel"%>
<%@page import="model.SellerModel"%>
<%@page import="model.CustomerModel"%>
<%@page import="java.util.List"%>
<%@page import="dao.DBData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/admin.css">
<link rel="stylesheet" href="./css/menubar.css">
<link
	href="https://fonts.googleapis.com/css?family=Poppins&display=swap"
	rel="stylesheet">
<title>Home</title>
</head>
<body>
	<!-- Navbar -->
	<div id="navbar">

		<div class="logo">KachaBazar.com</div>
		<div class="search">
			<input class="search-box" placeholder="Type to search"> <input
				type="submit" class="search-button" value="Search">
		</div>
		<div class="menu-items">
			<a class="active" href="javascript:void(0)">Home</a> <a href="">Profile</a>
			<a href="">Notification</a>
		</div>
	</div>
	<!-- Navbar End -->
	<!-- Side Bar -->

<div class="wrapper-box">
		<div class="side-bar">
			<h2>Menu</h2>
			<ul>
				<li class="options-div" id="order"><a class="options"
					href="#order">Orders</a>
					<div class="sub-menu">
						<a href="./orders?action=view">Inventory Orders</a> <a
							href="seller_orders.jsp">Seller Orders</a>
					</div></li>
				<li class="options-div" id="product"><a class="options"
					href="#product">Products</a>
					<div class="sub-menu">
						<a href="./products?action=new">Add Products</a> <a
							href="./products?action=view">View Products</a>
					</div></li>
				<li class="options-div" id='category'><a class="options"
					href="#category">Category</a>
					<div class="sub-menu">
						<a href="./categories?action=new">Add Category</a> <a
							href="Category.jsp">View Category</a> 
					</div></li>

				<li class="options-div" id="subcat"><a class="options"
					href="#subcat">Sub-Category</a>
					<div class="sub-menu">
						<a class="options"
							href="./subcategories?action=new&page=admin">Add Sub-category</a> <a
							href="./subcategories?action=view&page=admin">View Sub-category</a>
					</div></li>

				<li class="options-div" id="sellers"><a class="options"
					href="#sellers">Sellers</a>
					<div class="sub-menu">
						<a href="./sellers?action=new&page=admin">Add Sellers</a> <a
							href="./sellers?action=view&page=admin">View Sellers</a>
					</div></li>
				<li class="options-div"><a class="options"
					href="./customers?action=view&page=admin">Customers</a></li>
				<li class="options-div" id="deliverer"><a class="options"
					href="#deliverer">Delivery Persons</a>
					<div class="sub-menu">
						<a href="./deliveries?action=add&page=admin">Add Deliverers</a> <a
							href="./deliveries?action=view&page=admin">View Deliverers</a>
					</div></li>

				<li class="options-div" id="area"><a class="options"
					href="#area">Areas</a>
					<div class="sub-menu">
						<a href="./areas?action=divPage&page=admin">Division</a> <a
							href="./areas?action=disPage&page=admin">District</a> <a
							href="./areas?action=upaPage&page=admin">Upazilla</a> <a
							href="./areas?action=uniPage&page=admin">Union</a>
					</div></li>
					
				<li class="options-div" id="subadmin"><a class="options"
					href="view-sub-admin.jsp">Sub Admin</a>
					
					</li>

			</ul>
		</div>
	</div>
<!-- Side Bar End -->

<!-- Category table -->

	<div class="container-box big">
		<table align="center">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Description</th>
				<th>Image</th>
				<th colspan="2">Action</th>

			</tr>

			<%
				DBData db = new DBData();
				List<CategoryModel> categoryModels = db.getAllCategories();
				request.setAttribute("categories", categoryModels);
			%>


			<c:forEach items="${categories}" var="category">
				<tr>
					<td>${category.categoryId}</td>
					<td>${category.categoryName}</td>
					<td>${category.categoryDescription}</td>
					<td><img alt=""
						src="./getimage?id=${category.categoryId}&action=category"
						width="200px" height="120px"></td>
					<td><a class="blue-button small"
						href="/ecommerce/categories?action=update&id=${category.categoryId}">Update</a>
					</td>
					<td><a
						onclick="return confirm('Are you sure you want to delete this item?');"
						class="red-button small"
						href="/ecommerce/categories?action=delete&id=${category.categoryId}">Delete</a>
					</td>
				</tr>
			</c:forEach>

		</table>
	</div>

	<!-- Category table end -->

</body>
</html>