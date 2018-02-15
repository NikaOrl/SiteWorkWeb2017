<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--
  Created by IntelliJ IDEA.
  User: XML
  Date: 31.10.2017
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<html>
<c:if test="${empty sessionScope.yaz}">
    <fmt:setBundle basename="loc_ru" scope="session"/>
</c:if>
<c:if test="${not empty param.yaz}">
    <c:set var="yaz" scope="session" value="${param.yaz}"/>
</c:if>
<c:if test="${not empty sessionScope.yaz}">
    <fmt:setBundle basename="loc_${sessionScope.yaz}" scope="session"/>
</c:if>
<head>
    <title>Title</title>
    <link href="csss/all.css" rel="stylesheet"/>
</head>
<body>
<c:if test="${not empty sessionScope.userName}">
    <td width="50">
        <c:set var="user" value="${sessionScope.userName}"/>
        <c:set var="user1" value="Liliana"/>
        <c:set var="user2" value="Nahiri"/>
        <c:if test="${user==user1}">
            <input style="border: 0px; width: 45px; height: 45px;cursor: pointer; background: url(/imgs/liliph.png) no-repeat; background-size: 45px" type="button" onclick="location.href='/login'" value=" ">
        </c:if>
        <c:if test="${user==user2}">
            <input style="border: 0px; width: 45px; height: 45px; cursor: pointer; background: url(/imgs/nahph.png) no-repeat; background-size: 45px" type="button" onclick="location.href='/login'" value="">
        </c:if>
    </td>
</c:if>
<td width="130">
    <c:if test="${empty sessionScope.userName}">
        <button class="langKn" type="button" onclick="location.href='/login'"><div><fmt:message key="enter"/></div> </button>
    </c:if>
    <c:if test="${not empty sessionScope.userName}">
        <button class="langKn" type="button" onclick="location.href='/logout'"><div><fmt:message key="logout"/></div> </button>
    </c:if>
</td>
<td width="130">
    <input class = "langKn" type="button" onclick="location.href='/Basket.jsp'" value="<fmt:message key="basket"/>">
</td>
<form action="index.jsp">
    <td width="130">
        <button class = "langKn" type="submit" onclick="" name="yaz" value="${sessionScope.yaz}">
            <fmt:message key="toList"/>
        </button>
    </td>
</form>
<td width="130">
    <input class = "langKn" type="button" onclick="" value="<fmt:message key="history"/>">
</td>
<td width="130">
    <input class = "langKn" type="button" onclick="" value="L">
</td>
<td></td>
</body>
</html>
