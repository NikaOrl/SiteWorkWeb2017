<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.Locale,java.util.HashMap,java.util.ResourceBundle" %>
<html>
<%
    String lang = request.getParameter("yaz");

    if(lang == null){
        lang = "ru";
    }
    Locale locale = new Locale(lang, "");
    ResourceBundle bundle = ResourceBundle.getBundle("loc",locale);
    String dropDownList="";
    response.setContentType("text/html; charset=utf-8");
    if(new String(lang).equals("en") == true){
        dropDownList =
                "                            <option value=\"en\">" + bundle.getString("en") + "</option>\n" +
                        "                            <option value=\"ru\">" + bundle.getString("ru") + "</option>\n" +
                        "                            <option value=\"de\">" + bundle.getString("de") + "</option>\n";
    }
    if(new String(lang).equals("ru") == true){
        dropDownList =
                "                            <option value=\"ru\">" + bundle.getString("ru") + "</option>\n" +
                        "                            <option value=\"en\">" + bundle.getString("en") + "</option>\n" +
                        "                            <option value=\"de\">" + bundle.getString("de") + "</option>\n";
    }
    if(new String(lang).equals("de") == true){
        dropDownList =
                "                            <option value=\"de\">" + bundle.getString("de") + "</option>\n" +
                        "                            <option value=\"en\">" + bundle.getString("en") + "</option>\n" +
                        "                            <option value=\"ru\">" + bundle.getString("ru") + "</option>\n";

    }
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="csss/all.css" rel="stylesheet"/>
    <title>Games</title>
    <script>
        function itemsChanged(){
            var value = document.getElementById("fil").value;
            var x = document.getElementsByClassName("all");
            var i;
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            x = document.getElementsByClassName(value);
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "block";
            }
            document.cookie = value;
        }
    </script>
    <style>
        #buyList
        {
            cursor: pointer;
            background: url(<%=bundle.getString("JoinL")%>) no-repeat;
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
<table id="headTabl">
    <tr id="head">
        <%@include file="header.jsp"%>
        <td align="right" width="240">
            <select name="fil" id="fil" class="yazi">
                <option value="all"><%=bundle.getString("all")%></option>
                <option value="poligon"><%=bundle.getString("poligon")%></option>
                <option value="baza"><%=bundle.getString("baza")%></option>
            </select>
            <button class = "langKn" onclick="itemsChanged()"><%=bundle.getString("Filt")%></button>
        </td>
        <form>
            <td width="200">
                <select name="yaz" class="yazi"><%=dropDownList%></select>
                <button type = "submit" class = "langKn"><%=bundle.getString("lang")%></button>
            </td>
        </form>
    </tr>
</table>
<table id="osnTabl">
    <tr>
        <td  colspan=4>
            <h1 align="center"><%=bundle.getString("rol")%></h1>
        </td>
    </tr>
    <tr class="prod">
        <td>
            <div class="all poligon">
                <%@include file="Games_cards/Skyrim.jsp"%>
            </div>
        </td>
    </tr>
    <tr class="prod">
        <td>
            <div class="all poligon">
                <%@include file="Games_cards/Disk.jsp"%>
            </div>
        </td>
    </tr>
    <tr class="prod">
        <td>
            <div class="all baza">
                <%@include file="Games_cards/Hogw.jsp"%>
            </div>
        </td>
    </tr>
    <tr class="prod">
        <td>
            <div class="all poligon">
                <%@include file="Games_cards/3Eph.jsp"%>
            </div>
        </td>
    </tr>
    <tr height="32"></tr>
</table>
<div id="footer"><p>Работа Орловой Вероники mishaminion.nika@gmail.com</p></div>
<script>
    document.getElementById("fil").value = document.cookie;
    itemsChanged();
</script>
</body>
</html>