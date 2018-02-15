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
        <td colspan=2>
            <h1 align="center"><fmt:message key="rol"/></h1>
        </td>
    </tr>
    <tr height=\"100%\">
        <td width="40%">
            <c:set var="user" value="${sessionScope.userName}"/>
            <c:set var="user1" value="Liliana"/>
            <c:set var="user2" value="Nahiri"/>
            <c:if test="${user==user1}">
                <img src="imgs/lili.jpg" width="300" id = "logo">
            </c:if>
            <c:if test="${user==user2}">
                <img src="imgs/nah.jpg" width="300" id = "logo">
            </c:if>
        </td>
        <td id="content" style="background-position: left; background-size: 400px 100%">
            <h2 style=" padding-top: 20px; padding-left: 56px">${sessionScope.userName}</h2>
            <div style="text-align: center;"><h2><fmt:message key='${sessionScope.defaultParam}'/></h2></div>
        </td>
    </tr>
    <tr>
    <tr height="90"></tr>
    <tr>
    <td colspan="2">
        <table class="profBlock">
            <tr>
                <td>
                    <div class="fonts">
                        <span id="doc_time"></span>
                    </div>
                </td>
            </tr>
            <form action="#" method="POST" enctype="multipart/form-data" name="addcom" id="addcom"
                  onSubmit="return false">
                <tr>
                    <td>
                        <textarea name="text" rows="5" cols="100" id="comments" class="txt2" style="box-shadow: none; width: 740px"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button class="headButtons" id="com" name="button" type="button" value="add_comment" onclick="ajaxPost()"><div class="fonts">ddCom</div></button>
                    </td>
                </tr>
            </form>
            <tr>
                <td>
                    <div id="comments_story" class="txt2" style="height: 270px; overflow-x: hidden;">
                        <table>
                            <tr>
                                <td>
                                    ${sessionScope.fullCommHist}
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </td>
    <td width="20px"></td>
    </tr>
</table>
<script charset="utf-8">
    var addComment = function (now) {
        document.getElementById("comments_story").innerHTML = document.getElementById("comments_story").innerHTML + now + " - " + document.getElementById("comments").value + "<br>";
        document.getElementById("comments").value = "";
    }

    function ajaxPost() {
        if (document.getElementById("comments").value == "") {
            return;
        }
        var now = new Date().toUTCString();
        var params = "params=" + now + " - " + document.getElementById("comments").value;
        var request = new XMLHttpRequest();
        var url = "/login";
        request.onreadystatechange = function () {
            if ((request.readyState == 4) && (request.status == 200)) {
                addComment(now);
            }
        }
        request.open("post", url);
        request.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");
        request.send(params)
    }
</script>
<script type="text/javascript">
    function clock() {
        var d = new Date();
        var month_num = d.getMonth() + 1;
        var day = d.getDate();
        var hours = d.getHours();
        var minutes = d.getMinutes();
        var seconds = d.getSeconds();

        if (day <= 9) day = "0" + day;
        if (hours <= 9) hours = "0" + hours;
        if (minutes <= 9) minutes = "0" + minutes;
        if (seconds <= 9) seconds = "0" + seconds;

        date_time = day + " : " + month_num + " : " + d.getFullYear() +
            " &nbsp;&nbsp;&nbsp;" + hours + ":" + minutes + ":" + seconds;
        if (document.layers) {
            document.layers.doc_time.document.write(date_time);
            document.layers.doc_time.document.close();
        }
        else document.getElementById("doc_time").innerHTML = date_time;
        setTimeout("clock()", 1000);
    }
</script>
<script>
    clock();
</script>
</body>
</html>
