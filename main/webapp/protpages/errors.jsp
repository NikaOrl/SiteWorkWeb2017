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
    <link href="../csss/all.css" rel="stylesheet"/>
</head>
<body>
<table id="headTabl">
    <tr id="head">
        <%@include file="../BHeader.jsp"%>
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
        <td colspan="2" height="50px">
            <h1 align="center"><fmt:message key="error"/></h1>
        </td>
    </tr>
</table>
</body>
</html>
