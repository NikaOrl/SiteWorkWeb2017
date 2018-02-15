<%--
  Created by IntelliJ IDEA.
  User: XML
  Date: 05.11.2017
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table><tr><td style="cursor: pointer" onclick='location.href="/Servlet_1"' id="prodSt" background="Cards_imgs/drunk_potter.png"></td>
    <td>
        <div id=text>
            <h2 style="cursor: pointer"onclick='location.href="/Servlet_1"'><fmt:message key="Name_Hogw"/></h2><b><c:out value="${sessionScope.costHogw*sessionScope.numHogw}"/>$, <c:out value="${sessionScope.numHogw}"/></b><p><fmt:message key="Inf_Hogw"/></p>
        </div>
    </td>
    <td width=10px>
        <form>
        <button  id = "delBask" type = "submit" value=" " name="delHogw"></button>
        </form>
    </td>
    <td width=30px></td></tr></table>
</body>
</html>
