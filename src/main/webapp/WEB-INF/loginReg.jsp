<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="states">AL, AK, AZ, AR, CA, CO, CT, DE, FL, GA, HI, ID, IL, IN, IA, KS, KY, LA, ME, MD, MA, MI, MN, MS, MO, MT, NE, NV, NH, NJ, NM, NY, NC, ND, OH, OK, OR, PA, RI, SC, SD, TN, TX, UT, VT, VA, WA, WV, WI, WY, AS, DC, GU, MP, PR, VI</c:set>

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


        <title>Login and Registration</title>
    </head>
    <body>
        <div class="page bg-primary pt-5"  style="background-image: url('../assets/goldenbowl.png'); height: 1480px; width: 720px;">
            <div class="container-fluid">
                <div class="row mx-auto">
                    <div class="col">
                        <div class="accordion" id="accordionExample">
                            <div class="card bg-dark text-light">
                                <div class="card-header" id="headingOne">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link btn-block bg-transparent text-light" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            <h3>Login</h3>
                                        </button>
                                    </h5>
                                </div>
                                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <form action="/login" method="POST">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text border-light bg-dark text-light">Email:</span>
                                                </div>
                                                <input type="email" class="form-control" name="email" placeholder="Email">
                                            </div>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text border-light bg-dark text-light">Password:</span>
                                                </div>
                                                <input type="password" class="form-control" name="password" placeholder="Password" minlength="8" maxlength="32">
                                            </div>
                                            <button type="submit" class="btn border-light btn-dark text-light btn-lg btn-block">Login</button>
                                        </form>
                                        <c:out value="${error}" />
                                    </div>
                                </div>
                            </div>
                            <div class="card bg-dark text-light">
                                <div class="card-header" id="headingTwo">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link btn-block bg-transparent text-light collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            <h3>Register</h3>
                                        </button>
                                    </h5>
                                </div>
                                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <form:form action="/" method="POST" modelAttribute="user">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text border-light bg-dark text-light">First Name:</span>
                                                </div>
                                                <form:input type="text" class="form-control" path="first_name" placeholder="First Name" minlength="2" max_length='64'/>
                                            </div>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text border-light bg-dark text-light">Last Name:</span>
                                                </div>
                                                <form:input type="text" class="form-control" path="last_name" placeholder="Last Name" minlength="2" max_length='64'/>
                                            </div>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text border-light bg-dark text-light">Email:</span>
                                                </div>
                                                <form:input type="email" class="form-control" path="email" placeholder="Email" minlength="7"/>
                                            </div>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text border-light bg-dark text-light">Street:</span>
                                                </div>
                                                <form:input type="text" class="form-control" path="street" placeholder="Street" minlength="2" max_length='64'/>
                                            </div>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text border-light bg-dark text-light">City:</span>
                                                </div>
                                                <form:input type="text" class="form-control" path="city" placeholder="City" minlength="2" max_length='64'/>
                                            </div>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text border-light bg-dark text-light">State and Zip</span>
                                                </div>
                                                <form:select class="custom-select" id="inputGroupSelect01" path="state">
                                                    <option selected>State</option>
                                                    <c:forEach var="st" items="${states}">
                                                            <form:option value="${st}" />
                                                    </c:forEach>
                                                </form:select>
                                                <form:input type="number" class="form-control w-25" path="zip"  placeholder="Zip" minlength="5" max_length="5"/>
                                            </div>
                                            <%--<div class="input-group mb-3">--%>
                                                <%--<div class="input-group-prepend">--%>
                                                    <%--<span class="input-group-text border-light bg-dark text-light">Birthdate:</span>--%>
                                                <%--</div>--%>
                                                <%--<form:input type="date" class="form-control" path="birthdate"/>--%>
                                            <%--</div>--%>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text border-light bg-dark text-light">Create Password:</span>
                                                </div>
                                                <form:input type="password" class="form-control" path="password" placeholder="Password" minlength="8" maxlength="32"/>
                                            </div>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text border-light bg-dark text-light">Confirm Password:</span>
                                                </div>
                                                <form:input type="password" class="form-control" path="passwordConfirmation" placeholder="Password" minlength="8" maxlength="32"/>
                                            </div>
                                            <button type="submit" class="btn border-light btn-dark text-light btn-lg btn-block">Register!</button>
                                        </form:form>
                                        <form:errors path="user.*" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>