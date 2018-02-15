<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
    <c:if test="${empty sessionScope.yaz}">
        <fmt:setBundle basename="loc_ru" scope="session"/>
    </c:if>
    <c:if test="${not empty param.yaz}">
        <c:set var="yaz" scope="session" value="${param.yaz}"/>
    </c:if>
    <c:if test="${not empty sessionScope.yaz}">
        <fmt:setBundle basename="loc_${sessionScope.yaz}" scope="session"/>
    </c:if>
    <title>Success</title>
    <link href="csss/all.css" rel="stylesheet"/>
</head>
<body>
<table id="headTabl">
    <tr id="head">
        <%@include file="BHeader.jsp"%>
        <form>
            <td width="200">
                <select name="yaz" class="yazi">
                    <option value="ru"><fmt:message key="ru"/> </option>
                    <option value="en"><fmt:message key="en"/></option>
                    <option value="de"><fmt:message key="de"/></option>
                </select>
                <button type = "submit" class = "langKn"><fmt:message key="lang"/></button>
            </td>
        </form>
    </tr>
</table>
<table id="osnTabl">
    <tr>
        <td colspan="3" height="50px" style="padding-bottom: 90px">
            <h1 align="center"><fmt:message key="rol"/></h1>
        </td>
    </tr>
    <tr>
        <td></td>
        <td  id="loginstyle" height="270" width="400">
            <h2 align="center" style=" padding:10px; margin: auto; font-family: MyFont4; font-size: 200%;" >Заказ оформлен!</h2>
            <h2 align="center" style=" padding:10px; margin: auto; font-family: MyFont4; font-size: 200%;" >${requestScope.succOrder}</h2>
            <form action="index.jsp">
                <button type="submit" id="buy" align="center" style="margin: auto; text-align: center; font-family: MyFont1; font-size: 200%;">Back to Game List</button>
            </form>
        </td>
        <td></td>
    </tr>
    <tr height="250"></tr>
</table>
</body>
</html>
