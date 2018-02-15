<%--
  Created by IntelliJ IDEA.
  User: kruglik
  Date: 21.10.17
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<html>
<head>
    <link href="csss/all.css" rel="stylesheet"/>
    <title>History</title>
    <meta charset="utf-8">
    <style>
        .strings{
            padding:10px; margin: auto; font-family: MyFont4; font-size: 200%;
        }
        /*.del {*/
            /*background-color: #7b88e1;*/
        /*}*/
        /*.del:hover{*/
            /*background-color: #e19ac9;*/
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
    <tr><td height="100px"></td></tr>
    <tr>
        <td width="100px"></td>
        <td>
            <h2 align="center" style=" padding:10px; margin: auto; font-family: MyFont4; font-size: 200%;" >
            ${requestScope.fullHistory}
        </h2>
        </td>
    </tr>
    <tr>
        <td width="4px"></td>
        <td>
            <form action="/history">
                <button type="submit" id="buy" name="del" value="del"><h2 align="center" style=" padding:10px; margin: auto; font-family: MyFont4; font-size: 80%;" >Delete</h2></button>
            </form>
        </td>
    </tr>
</table>
</body>
</html>
