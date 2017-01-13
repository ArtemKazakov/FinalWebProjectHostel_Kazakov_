<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 08.01.2017
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<f:setLocale value="${requestScope.selectedLanguage}"/>
<f:setBundle basename="locale" var="locale"/>
<f:message bundle="${locale}" key="locale.siteName" var="siteName"/>
<f:message bundle="${locale}" key="locale.mainPage" var="mainPage"/>
<f:message bundle="${locale}" key="locale.login" var="login"/>
<f:message bundle="${locale}" key="locale.password" var="password"/>
<f:message bundle="${locale}" key="locale.loginButton" var="loginButton"/>
<f:message bundle="${locale}" key="locale.logoutButtom" var="logoutButton"/>
<f:message bundle="${locale}" key="locale.signupButton" var="signupButton"/>
<f:message bundle="${locale}" key="locale.account" var="accountButton"/>
<f:message bundle="${locale}" key="locale.rooms" var="rooms"/>
<f:message bundle="${locale}" key="locale.seatsNumber" var="seatsNumber"/>
<f:message bundle="${locale}" key="locale.perdayCost" var="perdayCost"/>
<f:message bundle="${locale}" key="locale.serverError" var="serverError"/>
<f:message bundle="${locale}" key="locale.checkInDate" var="chekInDate"/>
<f:message bundle="${locale}" key="locale.daysNumber" var="daysNumber"/>
<f:message bundle="${locale}" key="locale.requestType" var="requestType"/>
<f:message bundle="${locale}" key="locale.payment" var="payment"/>
<f:message bundle="${locale}" key="locale.requestStatus" var="requestStatus"/>
<f:message bundle="${locale}" key="locale.reservation" var="reservation"/>
<f:message bundle="${locale}" key="locale.fullPayment" var="fullPayment"/>
<f:message bundle="${locale}" key="locale.clients" var="clients"/>
<f:message bundle="${locale}" key="locale.requests" var="requests"/>
<f:message bundle="${locale}" key="locale.personalInformation" var="personalInformation"/>
<f:message bundle="${locale}" key="locale.client" var="client"/>
<f:message bundle="${locale}" key="locale.administrator" var="administrator"/>
<f:message bundle="${locale}" key="locale.schedule" var="schedule"/>
<f:message bundle="${locale}" key="locale.deleteButton" var="deleteButton"/>
<f:message bundle="${locale}" key="locale.acceptButton" var="acceptButton"/>
<f:message bundle="${locale}" key="locale.rejectButton" var="rejectButton"/>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${siteName}</title>
    <link rel="shortcut icon" href="../../img/hostel_icon.png" type="image/png">
    <link rel="stylesheet" href="../../css/bootstrap.css">
    <link rel="stylesheet" href="../../css/style.css">
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="Controller?command=mainPage">${mainPage}</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="Controller?command=viewRoomsList">${rooms}</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:if test="${sessionScope.userId == null}">
                    <li>
                        <form class="navbar-form" action="Controller" method="post">
                            <input type="hidden" name="command" value="log_in"/>
                            <div class="form-group">
                                <input type="text" name="logInFormLogin" placeholder="${login}" class="form-control">
                            </div>
                            <div class="form-group">
                                <input type="password" name="logInFormPassword" placeholder="${password}"
                                       class="form-control">
                            </div>
                            <button type="submit" class="btn btn-success">${loginButton}</button>
                        </form>
                    </li>
                    <li><a href="Controller?command=registration"><span
                            class="glyphicon glyphicon-user"></span> ${signupButton}</a></li>
                </c:if>
                <c:if test="${sessionScope.userId != null}">
                    <li>
                        <form class="navbar-form navbar-right" action="Controller" method="post">
                            <input type="hidden" name="command" value="log_out"/>
                            <button type="submit" class="btn btn-success">${logoutButton}</button>
                        </form>
                    </li>
                    <li><a href="Controller?command=userAccount"><span
                            class="glyphicon glyphicon-user"></span> ${accountButton}</a></li>
                </c:if>
                <c:if test='${requestScope.selectedLanguage eq "EN"}'>
                    <li>
                        <form class="navbar-form" id="change-language-ru" action="Controller?command=changeLanguage"
                              method="post"><input type="hidden" name="changeLanguage" value="RU">
                            <button type="submit" class="btn btn-danger">RU</button>
                        </form>
                    </li>
                </c:if>
                <c:if test='${requestScope.selectedLanguage eq "RU"}'>
                    <li>
                        <form class="navbar-form" id="change-language-en" action="Controller?command=changeLanguage"
                              method="post">
                            <input type="hidden" name="changeLanguage" value="EN">
                            <button type="submit" class="btn btn-danger">EN</button>
                        </form>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <br>
    <ul class="nav nav-tabs">
        <li>
            <a href="Controller?command=userAccount">${personalInformation}</a>
        </li>
        <li><a href="Controller?command=viewUsersList">${clients}</a></li>
        <li class="active"><a href="Controller?command=viewRequestsList">${requests}</a></li>
        <li><a href="Controller?command=viewScheduleRecords">${schedule}</a></li>
    </ul>

    <c:if test="${param.serviceError}">
        <br>
        <br>
        <div class="alert alert-danger fade in">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                ${serverError}
        </div>
    </c:if>
    <br>
    <table class="table table-striped">
        <tr>
            <th></th>
            <th>${client}</th>
            <th>${administrator}</th>
            <th>${seatsNumber}</th>
            <th>${chekInDate}</th>
            <th>${daysNumber}</th>
            <th>${requestType}</th>
            <th>${payment}</th>
            <th>${requestStatus}</th>
        </tr>
        <c:forEach var="rentalRequest" items="${requestScope.requestsList}">
            <tr>
                <td>
                    <c:if test="${rentalRequest.accepted == null}">
                        <a href="Controller?command=editRequest&requestId=${rentalRequest.id}&requestStatus=1"
                           class="btn btn-default">${acceptButton}</a>
                        <a href="Controller?command=editRequest&requestId=${rentalRequest.id}&requestStatus=0"
                           class="btn btn-default">${rejectButton}</a>
                    </c:if>
                    <a href="Controller?command=deleteRequest&requestId=${rentalRequest.id}"
                       class="btn btn-default">${deleteButton}</a>
                </td>
                <td>
                    <a href="Controller?command=viewUser&clientId=${rentalRequest.client.id}">${rentalRequest.client.login}</a>
                </td>
                <td>${rentalRequest.administrator.login}</td>
                <td>${rentalRequest.seatsNumber}</td>
                <td>${rentalRequest.checkInDate}</td>
                <td>${rentalRequest.daysStayNumber}</td>
                <td><c:if test="${rentalRequest.fullPayment == true}">${fullPayment}</c:if> <c:if
                        test="${rentalRequest.fullPayment == false}">${reservation}</c:if></td>
                <td>${rentalRequest.payment}</td>
                <td><span
                        class="glyphicon <c:if test="${rentalRequest.accepted == null}">glyphicon-refresh</c:if> <c:if test="${rentalRequest.accepted == true}">glyphicon-ok</c:if> <c:if test="${rentalRequest.accepted == false}">glyphicon-remove</c:if> "></span>
                </td>
            </tr>
        </c:forEach>
    </table>

    <hr>

    <footer>
        <p>&copy; 2016 ${siteName}</p>
    </footer>
</div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>

