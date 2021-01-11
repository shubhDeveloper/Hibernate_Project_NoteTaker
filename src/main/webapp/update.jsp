<%@page import="com.note.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.note.entity.NoteEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
        integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/stylenotes.css">

    <title>NoteTaker</title>
</head>

<body class="bg">




    <div class="container-fluid p-0">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                    <a class="navbar-brand" href="#">NoteTaker</a>
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <input id="searchTxt" class="form-control me-2" type="search" placeholder="Search"
                            aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
    </div>
    
    <%
    
    int id = Integer.parseInt(request.getParameter("note_id").trim());
    Session session2 = FactoryProvider.getFactory().openSession();
	
	NoteEntity noteEntity = session2.get(NoteEntity.class, id);
 
    %>

    <div class="conteiner mt-5">
        <div class="row justify-content-center">
            <div class="col-md-7">
                <div class="mb-4">
                    <label for="exampleFormControlInput1"  class="form-label">Note Title</label>
                    <input type="text" class="form-control" value="<%= noteEntity.getTitle() %>" id="title" placeholder="Enter note title">
                </div>
                <div class="mb-0">
                    <label for="exampleFormControlTextarea1" class="form-label">Update notes</label>
                    <textarea class="form-control" id="addTxt" placeholder="Note here" rows="10"><%= noteEntity.getContent() %></textarea>
                </div>
                <a id="" href="Update?note_id=<%= noteEntity.getId() %>" class="btn mt-5 btn-primary" type="submit">Submit</a>
            </div>
        </div>
    </div>


    <script src="js/taker.js"></script>


    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"
        integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"
        integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj"
        crossorigin="anonymous"></script>
</body>

</html>