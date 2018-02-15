<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
    <c:set var="pageb" scope="session" value="${'blist'}"/>
    <c:remove var="pagef" scope="session"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="csss/all.css" rel="stylesheet"/>
    <title>Basket</title>

    <c:if test="${empty sessionScope.yaz}">
        <fmt:setBundle basename="loc_ru" scope="session"/>
    </c:if>
    <c:if test="${not empty param.yaz}">
        <c:set var="yaz" scope="session" value="${param.yaz}"/>
    </c:if>
    <c:if test="${not empty sessionScope.yaz}">
        <fmt:setBundle basename="loc_${sessionScope.yaz}" scope="session"/>
    </c:if>

    <style>
        #delBask
        {
            cursor: pointer;
            background: url(<fmt:message key="NihachuB"/>) no-repeat;
            background-size: 40px 190px;
            background-position:left;
            border: 0px;
            width: 40px;
            height: 190px;
            color: #d4bf9c;
            font-size: 40%;
            margin-top: 5px;
        }
    </style>
</head>
<body>
<c:if test="${empty sessionScope.sess}">
    <c:set var="sess" scope="session" value="${0}" />

    <c:set var="num3Eph" scope="session" value="${0}" />
    <c:set var="numDisk" scope="session" value="${0}" />
    <c:set var="numHogw" scope="session" value="${0}" />
    <c:set var="numSkyrim" scope="session" value="${0}" />

    <c:set var="cost3Eph" scope="session" value="${33}" />
    <c:set var="costDisk" scope="session" value="${25}" />
    <c:set var="costHogw" scope="session" value="${58}" />
    <c:set var="costSkyrim" scope="session" value="${33}" />

    <c:set var="total_cost" scope="session" value="${0}" />
</c:if>

<c:set var="sess" scope="session" value="${sessionScope.sess + 1}" />

<c:if test="${not empty param.num3Eph}">
    <c:set var="num3Eph" scope="session" value="${sessionScope.num3Eph + 1}" />
    <c:set var="total_cost" scope="session" value="${sessionScope.total_cost + sessionScope.cost3Eph}" />
    <c:redirect url = "Basket.jsp"/>
</c:if>
<c:if test="${not empty param.del3Eph}">
    <c:set var="num3Eph" scope="session" value="${sessionScope.num3Eph - 1}" />
    <c:set var="total_cost" scope="session" value="${sessionScope.total_cost - sessionScope.cost3Eph}" />
    <c:redirect url = "Basket.jsp"/>
</c:if>

<c:if test="${not empty param.numDisk}">
    <c:set var="numDisk" scope="session" value="${sessionScope.numDisk + 1}" />
    <c:set var="total_cost" scope="session" value="${sessionScope.total_cost + sessionScope.costDisk}" />
    <c:redirect url = "Basket.jsp"/>
</c:if>
<c:if test="${not empty param.delDisk}">
    <c:set var="numDisk" scope="session" value="${sessionScope.numDisk - 1}" />
    <c:set var="total_cost" scope="session" value="${sessionScope.total_cost - sessionScope.costDisk}" />
    <c:redirect url = "Basket.jsp"/>
</c:if>

<c:if test="${not empty param.numHogw}">
    <c:set var="numHogw" scope="session" value="${sessionScope.numHogw + 1}" />
    <c:set var="total_cost" scope="session" value="${sessionScope.total_cost + sessionScope.costHogw}" />
    <c:redirect url = "Basket.jsp"/>
</c:if>
<c:if test="${not empty param.delHogw}">
    <c:set var="numHogw" scope="session" value="${sessionScope.numHogw - 1}" />
    <c:set var="total_cost" scope="session" value="${sessionScope.total_cost - sessionScope.costHogw}" />
    <c:redirect url = "Basket.jsp"/>
</c:if>

<c:if test="${not empty param.numSkyrim}">
    <c:set var="numSkyrim" scope="session" value="${sessionScope.numSkyrim + 1}" />
    <c:set var="total_cost" scope="session" value="${sessionScope.total_cost + sessionScope.costSkyrim}" />
    <c:redirect url = "Basket.jsp"/>
</c:if>
<c:if test="${not empty param.delSkyrim}">
    <c:set var="numSkyrim" scope="session" value="${sessionScope.numSkyrim - 1}" />
    <c:set var="total_cost" scope="session" value="${sessionScope.total_cost - sessionScope.costSkyrim}" />
    <c:redirect url = "Basket.jsp"/>
</c:if>

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
        <td colspan=2>
            <h1 align="center"><fmt:message key="basket"/></h1>
        </td>
    </tr>
    <tr class="prod">
        <td colspan=2>
            <div id="skyrim" style="display: none">
                <%@include file="Games_Bask/Skyrim_B.jsp"%>
            </div>
        </td>
    </tr>
    <tr class="prod">
        <td colspan=2>
            <div id="disk" style="display: none">
                <%@include file="Games_Bask/Disk_B.jsp"%>
            </div>
        </td>
    </tr>
    <tr class="prod">
        <td colspan=2>
            <div id="hogw" style="display: none">
                <%@include file="Games_Bask/Hogw_B.jsp"%>
            </div>
        </td>
    </tr>
    <tr class="prod">
        <td colspan=2>
            <div id="3eph" style="display: none">
                <%@include file="Games_Bask/3Eph_B.jsp"%>
            </div>
        </td>
    </tr>
    <tr>

            <td>
                <div id="zak1" style="display: none;">
                <h2><fmt:message key="Sum"/>: <c:out value="${sessionScope.total_cost}"/>$</h2>
                </div>
            </td>
            <td style=" text-align: right;">
                <div id="zak2" style="display: none;">
                    <c:if test="${empty sessionScope.userName}">
                        <button id = "buy" type="button" onclick="location.href='/login'"><div><fmt:message key="oformZ"/></div> </button>
                    </c:if>
                    <c:if test="${not empty sessionScope.userName}">
                        <input id = "buy" type="button" value="<fmt:message key="oformZ"/>" onclick="location.href='/order'">
                    </c:if>
                </div>
            </td>

    </tr>
    <tr height="90"></tr>
</table>

<c:if test="${sessionScope.num3Eph > 0}">
    <script>
        var y1 = document.getElementById("zak1");
        y1.style.display = "block";
        var y2 = document.getElementById("zak2");
        y2.style.display = "block";
        var x = document.getElementById("3eph");
        x.style.display = "block";
    </script>
</c:if>

<c:if test="${sessionScope.numDisk > 0}">
    <script>
        var y1 = document.getElementById("zak1");
        y1.style.display = "block";
        var y2 = document.getElementById("zak2");
        y2.style.display = "block";
        var x = document.getElementById("disk");
        x.style.display = "block";
    </script>
</c:if>

<c:if test="${sessionScope.numHogw > 0}">
    <script>
        var y1 = document.getElementById("zak1");
        y1.style.display = "block";
        var y2 = document.getElementById("zak2");
        y2.style.display = "block";
        var x = document.getElementById("hogw");
        x.style.display = "block";
    </script>
</c:if>

<c:if test="${sessionScope.numSkyrim > 0}">
    <script>
        var y1 = document.getElementById("zak1");
        y1.style.display = "block";
        var y2 = document.getElementById("zak2");
        y2.style.display = "block";
        var x = document.getElementById("skyrim");
        x.style.display = "block";
    </script>
</c:if>
</body>
</html>
