<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <!-- Optional JavaScript -->
        <script src="../js/script.js"></script>

        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
        <script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>


        <title>🌏 Google Maps Geolocation Example</title>

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" href="../css/style.css">


    </head>
    <body>


        <main class="googleMap">

            <input id="pac-input" class="form-control form-control-lg" type="text" placeholder="Enter a location">

            <div id="map" class="map"></div>

            <div id="card" class="card text-white bg-primary w-100 hide">
                <div class="card-header"><h3  id="placeHeader"></h3></div>
                <div class="card-body">
                    <h3>Overall Rating:
                        <c:if test="${avgRating1 == 1}">
                            <img src="../assets/toilet1.png" height="30px">
                            <img src="../assets/toiletgrey.png" height="30px">
                            <img src="../assets/toiletgrey.png" height="30px">
                            <img src="../assets/toiletgrey.png" height="30px">
                            <img src="../assets/toiletgrey.png" height="30px">
                        </c:if>
                        <c:if test="${avgRating1 == 2}">
                            <img src="../assets/toilet1.png" height="30px">
                            <img src="../assets/toilet2.png" height="30px">
                            <img src="../assets/toiletgrey.png" height="30px">
                            <img src="../assets/toiletgrey.png" height="30px">
                            <img src="../assets/toiletgrey.png" height="30px">
                        </c:if>
                        <c:if test="${avgRating1 == 3}">
                            <img src="../assets/toilet1.png" height="30px">
                            <img src="../assets/toilet2.png" height="30px">
                            <img src="../assets/toilet3.png" height="30px">
                            <img src="../assets/toiletgrey.png" height="30px">
                            <img src="../assets/toiletgrey.png" height="30px">
                        </c:if>
                        <c:if test="${avgRating1 == 4}">
                            <img src="../assets/toilet1.png" height="30px">
                            <img src="../assets/toilet2.png" height="30px">
                            <img src="../assets/toilet3.png" height="30px">
                            <img src="../assets/toilet4.png" height="30px">
                            <img src="../assets/toiletgrey.png" height="30px">
                        </c:if>
                        <c:if test="${avgRating1 == 5}">
                            <img src="../assets/toilet1.png" height="30px">
                            <img src="../assets/toilet2.png" height="30px">
                            <img src="../assets/toilet3.png" height="30px">
                            <img src="../assets/toilet4.png" height="30px">
                            <img src="../assets/toilet5.png" height="30px">
                        </c:if>
                        (${ratingCount1})
                    </h3>
                    <form class="d-inline-block" action="/allReviews" method="post">
                        <input id="hiddenId2" type="hidden" name="hiddenId" value="temp">
                        <input id="hiddenName2" type="hidden" name="hiddenName" value="temp">
                        <input id="hiddenAddress2" type="hidden" name="hiddenAddress" value="temp">
                        <button type="submit" class="btn btn-secondary">All Reviews</button>
                    </form>
                    <form class="d-inline-block" action="/newRating" method="post">
                        <input id="hiddenId" type="hidden" name="hiddenId" value="temp">
                        <input id="hiddenName" type="hidden" name="hiddenName" value="temp">
                        <input id="hiddenAddress" type="hidden" name="hiddenAddress" value="temp">
                        <button type="submit" class="btn btn-secondary">New Rating & Review</button>
                    </form>
                    <h6 id="placeAddress" class="card-text"></h6>
                    <h3 class="card-text">Recent Reviews:</h3>
                    <c:forEach begin="0" end="1" items="${allReviews1}" var="rev">
                        <p class="lead ml-5">• ${rev.review}</p>
                    </c:forEach>
                </div>
            </div>

            <!-- For displaying user's coordinate or error message. -->
            <div id="info" class="info"></div>

        </main>


        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA0m3aOQlFrqXJIKezuMbScuy9-B2CCzgQ&libraries=places&callback=initialize"></script>
    </body>
</html>