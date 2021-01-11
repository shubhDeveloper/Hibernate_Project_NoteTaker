<%@page import="com.note.entity.NoteEntity"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.note.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/stylenotes.css">

<title>NoteTaker</title>
</head>

<body class="bg">
	<div class="container-fluid p-0">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01"
					aria-controls="navbarTogglerDemo01" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
					<a class="navbar-brand" href="#">NoteTaker</a>
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">Home</a></li>
					</ul>
					<div class="d-flex">

						<input id="searchTxt" class="form-control me-2" type="text"
							placeholder="note title" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</div>
				</div>
			</div>
		</nav>
	</div>
	<form class="d-flex" action="SaveNotesServlet" method="post">
		<div class="container my-5">
			<div class="row ">
				<div class="col-md-6 mt-3">
					<div class="mb-4">
						<label for="exampleFormControlInput1" class="form-label">Note
							Title</label> <input type="text" name="title" class="form-control"
							id="title" placeholder="Enter note title">
					</div>
					<div class="mb-0">
						<label for="exampleFormControlTextarea1" name="title"
							class="form-label">Enter notes</label>
						<textarea class="form-control" name="content" id="addTxt"
							placeholder="Note here" rows="9"></textarea>
					</div>
					<button id="addbtn" class="btn mt-5 btn-outline-success"
						type="submit" href="index.jsp">Submit</button>

				</div>

				<div class="col-md-6  ">
					<div class="display-6 mt-0 text-center mb-5">
						Your notes
						<hr>
					</div>
					<div id="notes" class="row row-cols-1 row-cols-md-3 g-4 overflow-scroll" style="height: 520px">
						<%
						Session s = FactoryProvider.getFactory().openSession();
						Query q = s.createQuery("from NoteEntity");
						List<NoteEntity> list = q.list();
						for (NoteEntity note : list) {
							/* System.out.println(note.getId()+" : "+note.getTitle()+ " : "+note.getContent()); */
						%>


						<div class="col-md-12">
							<div
								class="card bg-primary p-2 text-white h-100 overflow-hidden">
								<!-- <span class="text-center"><i class = "fa fa-user" style="font-size: 50px"></i></span> -->
								<div class="card-body">
									<h5 class="card-title"><%=note.getTitle()%></h5>
									<p class="card-text"><%=note.getContent()%></p>	
									
									
								<a href="DeleteServlet?note_id=<%= note.getId()%>" class="btn btn-dark text-white">Delete</a>
								<a href="update.jsp?note_id=<%= note.getId()%>" class="btn btn-dark text-white">Update</a>
									<li href="#" class="text-white" style="margin-left: 365px"><%=note.getAddedDate() %></li>
								</div>
								
								
								
								
							</div>
						</div>


						<%
						}
						%>

					</div>
				</div>

			</div>
	</form>


	<!-- 
    <script src="js/jsdeliver.js"></script> -->
	<!-- <script src="js/Events.js"></script> -->
	<!-- <script src="js/storage.js"></script> -->
	<!-- <script src="js/formData.js"></script> -->
	<!-- <script src="js/taker.js"></script> -->


	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"
		integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"
		integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj"
		crossorigin="anonymous"></script>
</body>

</html>