<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta title="login">
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
        <td colspan="2" height="50px" style="padding-bottom: 90px">
            <h1 align="center"><fmt:message key="rol"/></h1>
        </td>
    </tr>

    <tr>
        <td  id="loginstyle" height="270">
            <form action="j_security_check" method="post" name="loginForm">
                <table style="margin: auto; padding-top: 20px">
                    <tr>
                        <td colspan="2" height="50px">
                            <h2 align="center" style="font-size: 230%"><fmt:message key="enter"/></h2>
                        </td>
                    </tr>
                    <tr >
                        <td>
                            <label><div style="font-family: MyFont1; font-size: 200%;"><fmt:message key="logi"/></div></label>
                        </td>
                        <td>
                            <input type="text" style="padding: 5px; font-size: 16px; background-color: rgba(255,236,227,0.35)" name="j_username" placeholder="<fmt:message key="logi"/>"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><div style="font-family: MyFont1; font-size: 200%;"><fmt:message key="pass"/></div></label>
                        </td>
                        <td>
                            <input type="password" style="padding: 5px; color: #0e108d; font-size: 16px; background-color: rgba(255,236,227,0.35)" name="j_password" placeholder="<fmt:message key="pass"/>"/>
                        </td>
                    </tr>
                    <tr height="20"></tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" id="buy" value="<fmt:message key="enter" />"/>
                        </td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
    <tr height="250"></tr>
</table>
</body>
</html>