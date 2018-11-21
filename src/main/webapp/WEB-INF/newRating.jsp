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


        <script>
            $(document).ready(function () {

                var flag = true;

                /* toilet one */

                $('.img1')
                    .mouseover(function () {
                        if (flag) {
                            $(this).attr("src", "../assets/toilet1.png");
                        }
                    })
                    .mouseout(function () {
                        if (flag) {
                            $(this).attr("src", "../assets/toiletgrey.png");
                        }
                    });

                /* toilet two */

                $('.img2')
                    .mouseover(function () {
                        if (flag) {
                            $(this).attr("src", "../assets/toilet2.png");
                            $('.img1').attr("src", "../assets/toilet1.png");
                        }
                    })
                    .mouseout(function () {
                        if (flag) {
                            $(this).attr("src", "../assets/toiletgrey.png");
                            $('.img1').attr("src", "../assets/toiletgrey.png");
                        }
                    });

                /* toilet three */

                $('.img3')
                    .mouseover(function () {
                        if (flag) {
                            $(this).attr("src", "../assets/toilet3.png");
                            $('.img2').attr("src", "../assets/toilet2.png");
                            $('.img1').attr("src", "../assets/toilet1.png");
                        }
                    })
                    .mouseout(function () {
                        if (flag) {
                            $(this).attr("src", "../assets/toiletgrey.png");
                            $('.img2').attr("src", "../assets/toiletgrey.png");
                            $('.img1').attr("src", "../assets/toiletgrey.png");
                        }
                    });

                /* toilet four */

                $('.img4')
                    .mouseover(function () {
                        if (flag) {
                            $(this).attr("src", "../assets/toilet4.png");
                            $('.img3').attr("src", "../assets/toilet3.png");
                            $('.img2').attr("src", "../assets/toilet2.png");
                            $('.img1').attr("src", "../assets/toilet1.png");
                        }
                    })
                    .mouseout(function () {
                        if (flag) {
                            $(this).attr("src", "../assets/toiletgrey.png");
                            $('.img3').attr("src", "../assets/toiletgrey.png");
                            $('.img2').attr("src", "../assets/toiletgrey.png");
                            $('.img1').attr("src", "../assets/toiletgrey.png");
                        }
                    });

                /* toilet five */

                $('.img5')
                    .mouseover(function () {
                        if (flag) {
                            $(this).attr("src", "../assets/toilet5.png");
                            $('.img4').attr("src", "../assets/toilet4.png");
                            $('.img3').attr("src", "../assets/toilet3.png");
                            $('.img2').attr("src", "../assets/toilet2.png");
                            $('.img1').attr("src", "../assets/toilet1.png");
                        }
                    })
                    .mouseout(function () {
                        if (flag) {
                            $(this).attr("src", "../assets/toiletgrey.png");
                            $('.img4').attr("src", "../assets/toiletgrey.png");
                            $('.img3').attr("src", "../assets/toiletgrey.png");
                            $('.img2').attr("src", "../assets/toiletgrey.png");
                            $('.img1').attr("src", "../assets/toiletgrey.png");
                        }
                    });

                /* set flag if clicked */
                $('.img1').click(function () {
                    document.getElementById('rating').value = 1;
                    $('.img5').attr("src", "../assets/toiletgrey.png");
                    $('.img4').attr("src", "../assets/toiletgrey.png");
                    $('.img3').attr("src", "../assets/toiletgrey.png");
                    $('.img2').attr("src", "../assets/toiletgrey.png");
                    $(this).attr("src", "../assets/toilet1.png");
                    flag = false;
                });

                $('.img2').click(function () {
                    document.getElementById('rating').value = 2;
                    $('.img5').attr("src", "../assets/toiletgrey.png");
                    $('.img4').attr("src", "../assets/toiletgrey.png");
                    $('.img3').attr("src", "../assets/toiletgrey.png");
                    $(this).attr("src", "../assets/toilet2.png");
                    $('.img1').attr("src", "../assets/toilet1.png");
                    flag = false;
                });

                $('.img3').click(function () {
                    document.getElementById('rating').value = 3;
                    $('.img5').attr("src", "../assets/toiletgrey.png");
                    $('.img4').attr("src", "../assets/toiletgrey.png");
                    $(this).attr("src", "../assets/toilet3.png");
                    $('.img2').attr("src", "../assets/toilet2.png");
                    $('.img1').attr("src", "../assets/toilet1.png");
                    flag = false;
                });

                $('.img4').click(function () {
                    document.getElementById('rating').value = 4;
                    $('.img5').attr("src", "../assets/toiletgrey.png");
                    $(this).attr("src", "../assets/toilet4.png");
                    $('.img3').attr("src", "../assets/toilet3.png");
                    $('.img2').attr("src", "../assets/toilet2.png");
                    $('.img1').attr("src", "../assets/toilet1.png");
                    flag = false;
                });

                $('.img5').click(function () {
                    document.getElementById('rating').value = 5;
                    $(this).attr("src", "../assets/toilet5.png");
                    $('.img4').attr("src", "../assets/toilet4.png");
                    $('.img3').attr("src", "../assets/toilet3.png");
                    $('.img2').attr("src", "../assets/toilet2.png");
                    $('.img1').attr("src", "../assets/toilet1.png");
                    flag = false;
                });



            });
        </script>




        <title>New Rating/Review</title>
    </head>
    <body>

    <audio id="flush" src="../assets/flush.mp3" type="audio/ogg"></audio>


        <div class="jumbotron jumbotron-fluid text-white bg-primary w-100">
            <div class="container text-white bg-primary w-100">
                <h1>${hiddenName}</h1>
                <h3>${hiddenAddress}</h3>
                <a class="btn btn-secondary" href="/dashboard" role="button">Back to Map</a>
                <a class="btn btn-secondary" href="/logout" role="button">Logout!</a>
                <h2>New Rating/Review:</h2>
            </div>
            <div class="container text-white bg-primary w-75">
                <form:form id="target" action="/createRating" method="post" modelAttribute="newRating">
                    <div class="form-group">
                        <form:hidden class="form-control" path="place_id" value="${hiddenId}"/>
                        <form:hidden id="rating" class="form-control" path="rating" value=""/>
                    </div>
                    <div class="form-group">
                        <img src="../assets/toiletgrey.png" height="75px" alt="toilet" class="img1">
                        <img src="../assets/toiletgrey.png" height="75px" alt="toilet" class="img2">
                        <img src="../assets/toiletgrey.png" height="75px" alt="toilet" class="img3">
                        <img src="../assets/toiletgrey.png" height="75px" alt="toilet" class="img4">
                        <img src="../assets/toiletgrey.png" height="75px" alt="toilet" class="img5">
                    </div>
                    <div class="form-group">
                        <form:label for="review" path="review">Review</form:label>
                        <form:textarea class="form-control" id="review" path="review" rows="3" />
                    </div>
                    <button type="submit" id="start" class="btn btn-secondary btn-block">Submit</button>
                </form:form>
                <form:errors path="rating.*" />
            </div>
        </div>


        <script>
            var flush = $('#flush')[0];
            var flag1 = true;
            $(document).on('submit', '#target', function()  {
                if (flag1) {
                    flush.play();
                    flush.addEventListener('ended', function () {
                        flag1 = false;
                        return $('form#target').submit();
                    });
                    return false;
                }
            });
        </script>
    </body>
</html>
