<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
        <script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>


        <title>All Reviews</title>
    </head>
    <body>
        <div class="jumbotron jumbotron-fluid text-white bg-primary w-100">
            <div class="container">
                <h1 class="display-4">${hiddenName}</h1>
                <h6>${hiddenAddress}</h6>
                <a class="btn btn-secondary" href="/dashboard" role="button">Back to Map</a>
                <a class="btn btn-secondary" href="/logout" role="button">Logout!</a>
                <h1>All Reviews</h1>
                <h3>Overall Rating:
                    <c:if test="${avgRating == 1}">
                        <img src="../assets/toilet1.png" height="30px">
                        <img src="../assets/toiletgrey.png" height="30px">
                        <img src="../assets/toiletgrey.png" height="30px">
                        <img src="../assets/toiletgrey.png" height="30px">
                        <img src="../assets/toiletgrey.png" height="30px">
                    </c:if>
                    <c:if test="${avgRating == 2}">
                        <img src="../assets/toilet1.png" height="30px">
                        <img src="../assets/toilet2.png" height="30px">
                        <img src="../assets/toiletgrey.png" height="30px">
                        <img src="../assets/toiletgrey.png" height="30px">
                        <img src="../assets/toiletgrey.png" height="30px">
                    </c:if>
                    <c:if test="${avgRating == 3}">
                        <img src="../assets/toilet1.png" height="30px">
                        <img src="../assets/toilet2.png" height="30px">
                        <img src="../assets/toilet3.png" height="30px">
                        <img src="../assets/toiletgrey.png" height="30px">
                        <img src="../assets/toiletgrey.png" height="30px">
                    </c:if>
                    <c:if test="${avgRating == 4}">
                        <img src="../assets/toilet1.png" height="30px">
                        <img src="../assets/toilet2.png" height="30px">
                        <img src="../assets/toilet3.png" height="30px">
                        <img src="../assets/toilet4.png" height="30px">
                        <img src="../assets/toiletgrey.png" height="30px">
                    </c:if>
                    <c:if test="${avgRating == 5}">
                        <img src="../assets/toilet1.png" height="30px">
                        <img src="../assets/toilet2.png" height="30px">
                        <img src="../assets/toilet3.png" height="30px">
                        <img src="../assets/toilet4.png" height="30px">
                        <img src="../assets/toilet5.png" height="30px">
                    </c:if>
                (${ratingCount})</h3>
            </div>
            <table class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Rating</th>
                        <th scope="col">Review</th>
                        <th scope="col">User</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${allReviews}" var="rev">
                        <tr>
                            <th scope="row">${rev.rating}</th>
                            <td>${rev.review} </td>
                            <td>${rev.user.email}</td>
                            <td>Delete</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>