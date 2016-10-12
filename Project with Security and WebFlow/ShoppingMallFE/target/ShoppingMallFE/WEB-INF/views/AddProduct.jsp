<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<!-- Bootstrap -->
<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
/* Bordered form */
form {
	border: 3px #f1f1f1;
}

/* Full-width inputs */
input[type=text] {
	width: 100%;
	padding: 4px 8px;
	margin: 4px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

/* Set a style for all buttons */
button {
	background-color: #4CAF50;
	color: white;
	padding: 6px 10px;
	margin: 4px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}
</style>

<title>Add Product</title>

</head>

<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="FlyAroundTheGlobe">Fly Around The Globe</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="Home">Home</a></li>
			<li><a href="AddProduct">Add Product</a></li>
			<li><a href="AddCategory">Add Category</a></li>
			<li><a href="AddSupplier">Add Travel Agent's Details</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<c:url value="j_spring_security_logout" var="logoutUrl" />
    	<li><a href="logout?${logoutUrl}"><span class="glyphicon glyphicon-user"></span> Logout </a></li>
			<!-- <li><a href="AddUser"><span class="glyphicon glyphicon-user"></span>
					Sign Up </a></li>
			<li><a href="login"><span class="glyphicon glyphicon-log-in"></span>
					Login </a></li> -->
		</ul>
	</div>
	</nav>


	<center>
		<div class="container-fluid">
			<div style="color: teal; font-size: 30px">Product Details</div>
			<form:form action="saveproduct" modelAttribute="productMall" enctype="multipart/form-data">
				<table>
					<tr>
						<c:choose>
							<c:when test="${!empty productMallEdit.id}">
								<td><form:label path="id"> Id </form:label></td>
								<td><form:input path="id" readonly="true" /></td>
							</c:when>
							<c:otherwise>
								<%-- <td><form:label path="id"> Id</form:label></td> --%>
								<%-- <td><form:input path="id" /></td> --%>
							</c:otherwise>
						</c:choose>
					</tr>

					<tr>
						<td><form:label path="name">Name</form:label></td>
						<td><form:input path="name" value="${productMallEdit.name}" /></td>
					</tr>

					<tr>
						<td><form:label path="description">Description</form:label></td>
						<td><form:input path="description" value="${productMallEdit.description}" /></td>
					</tr>

					<tr>
						<td><form:label path="price">Price</form:label></td>
						<td><form:input path="price" value="${productMallEdit.price}"/></td>
					</tr>
					
					 <tr>
					 	<td><form:label path="categoryMall.id">Category Id</form:label></td>
					 	<td><form:select path="categoryMall.id" value="${productMallEdit.categoryMall.id}">
					 			<option value="-1">Choose a category...</option>
									<c:forEach items="${categoryMallList}" var="categoryMall">
										<option value="${categoryMall.id}">${categoryMall.cat_name}</option>
						 			</c:forEach>
						 	</form:select>
						</td>
								
					</tr>	 
						 			
					<tr>
						
					 	
					 	<td><form:label path="supplierMall.id">Supplier Id</form:label></td>
					 	<td><form:select path="supplierMall.id" value="${productMallEdit.supplierMall.id}">
					 			<option value="-1">Choose a supplier...</option>
									<c:forEach items="${supplierMallList}" var="supplierMall">
										<option value="${supplierMall.id}">${supplierMall.supp_name}</option>
						 			</c:forEach>
						 	</form:select>
						</td> 
								
					</tr>	 	
						
					
					<tr>
						<td>Pick file #1:</td>
						<td><input type="file" name="fileUpload" size="50" /></td>
					</tr>

					<c:choose>
						<c:when test="${!empty productMallEdit.id}">
							<tr>
								<td colspan="2"><button type="submit" value="UpdateProduct">Update_Product</button></td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="2"><button type="submit" value="Submit">Submit</button></td>
							</tr>

							<tr>
								<td colspan="2"><button type="button" value="Reset" onClick="this.form.reset()">Reset</button></td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</form:form>
		</div>
		<br>

		<div class="container-fluid">
			<div style="color: teal; font-size: 30px">View Product Details</div>

			<c:if test="${!empty productMallList}">

				<div class="container">
					<!-- <div class="table-responsive"> -->

					<table id="example" class="table table-responsive table-stripped table-hover"
						cellspacing="0" width="60%">
						<thead>
							<tr
								style="background-color: #595959; color: #FAEBD7; text-align: center;"
								height="40px">


								<td>Id</td>
								<td>Name</td>
								<td>Description</td>
								<td>Price</td>
								<td>Cat_Id</td>
								<td>Supp_Id</td>
								<td>Edit</td>
								<td>Delete</td>

							</tr>
						</thead>

						<tbody>
							<c:forEach items="${productMallList}" var="productMall">

								<tr class="active"
									style="background-color: #C0C0C0; color: #1a1a1a; text-align: center;"
									height="30px">

									<td><c:out value="${productMall.id}" /></td>
									<td><c:out value="${productMall.name}" /></td>
									<td><c:out value="${productMall.description}" /></td>
									<td><c:out value="${productMall.price}" /></td>
									<td><c:out value="${productMall.categoryMall.id}" /></td>
									<td><c:out value="${productMall.supplierMall.id}" /></td>
									<td><a href="Edit?id=${productMall.id}">Edit</a></td>
									<td><a href="Delete?id=${productMall.id}">Delete</a></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>

			</c:if>
		</div>
		<br>

	</center>
</body>
</html>