<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta title="order">
    <script src="//api-maps.yandex.ru/2.1/?lang=en_US" type="text/javascript"></script>
    <script src="//yandex.st/jquery/2.2.3/jquery.min.js" type="text/javascript"></script>
    <c:set var="pageb" scope="session" value="${'blist'}"/>
    <c:remove var="pagef" scope="session"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order</title>
    <link href="csss/all.css" rel="stylesheet"/>
    <c:if test="${empty sessionScope.yaz}">
        <fmt:setBundle basename="loc_ru" scope="session"/>
    </c:if>
    <c:if test="${not empty param.yaz}">
        <c:set var="yaz" scope="session" value="${param.yaz}"/>
    </c:if>
    <c:if test="${not empty sessionScope.yaz}">
        <fmt:setBundle basename="loc_${sessionScope.yaz}" scope="session"/>
    </c:if>
    <script src="order/ordershop.js"></script>
    <script src="order/orderhome.js"></script>
    <!--<script src="order/placemarks.js"></script>-->
    <style>
        #map {
            height: 480px;
            width: 1200px;
            margin-top: 7px;
            margin-left: 60px;
            align-content: center;
            border: 5px #c6a978;
            border-style: double;
        }
        /*.send{*/
        /*width: 185px;*/
        /*background-color: #f792e8;*/
        /*}*/
        /*.send:hover{*/
        /*cursor: pointer;*/
        /*background-color: rgba(247,146,232,0.96);*/
        /*}*/
        #suggest {
            width: 1000px;
            height: 30px;
            background-color: #c6a978;
            color: #000000;
            margin-left: 60px;
        }
        /*.btn {*/
        /*background-color: rgba(255, 163, 232, 0.7);*/
        /*color: #731d56;*/
        /*font-family: 'Dotf1', Arial;*/
        /*font-size: 16px;*/
        /*}*/
        /*.btn:hover {*/
        /*cursor: pointer;*/
        /*background-color: rgba(177, 175, 247, 0.96);*/
        /*}*/
        /*.dropdown-menu {*/
        /*list-style-type: none;*/
        /*margin-top: 0;*/
        /*line-height: 20px;*/
        /*padding-top: 10px;*/
        /*padding-left: 0;*/
        /*background-color: rgba(247, 136, 182, 0.32);*/
        /*color: #201473;*/
        /*font-size: 16px;*/
        /*}*/
        /*.elemul:hover {*/
        /*background-color: rgba(247,146,232,0.96);*/
        /*cursor: pointer;*/
        /*}*/
    </style>
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
        <td>
            <h1 align="center"><fmt:message key="rol"/></h1>
        </td>
    </tr>
    <tr>
        <td style="width: 100%" colspan="6">
            <table style="margin: auto; align-content: center;">
                <tr>
                    <td colspan="2">
                        <div id="map"></div>
                    </td>
                </tr>
                <tr>
                    <form name="suggest" action="/doOrder" method="get">
                        <td>
                            <input  type="text" name="address" id="suggest" class='input' placeholder="Address"/>
                        </td>
                        <td>
                            <%--<input class="send" id = "buy" type="button" value="<fmt:message key="oformZ"/>" onclick="location.href='/doOrder'" style="background-size: 220px 35px; width: 220px; height: 35px; font-size: 160%;">--%>
                                <button id = "buy" type="submit" class="send"><div><fmt:message key="oformZ"/></div></button>
                        </td>
                    </form>
                </tr>
                <tr height="64"></tr>

            </table>
        </td>
    </tr>
</table>
</body>
</html>