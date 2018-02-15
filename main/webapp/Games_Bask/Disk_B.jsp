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
<table><tr><td style="cursor: pointer" onclick='location.href="/Servlet_1"' id="prodSt" background="Cards_imgs/diskworld.png"></td>
    <td>
        <div id=text>
            <h2 style="cursor: pointer"onclick='location.href="/Servlet_1"'><fmt:message key="Name_Disk"/></h2><b><c:out value="${sessionScope.costDisk*sessionScope.numDisk}"/>$, <c:out value="${sessionScope.numDisk}"/></b><p><fmt:message key="Inf_Disk"/></p>
        </div>
    </td>
    <td width=10px>
        <form>
        <button  id = "delBask" type = "submit" value=" " name="delDisk"></button>
        </form>
    </td>
    <td width=30px></td></tr></table>
</body>
</html>
