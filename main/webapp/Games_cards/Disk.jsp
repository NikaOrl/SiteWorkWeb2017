<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 05.10.2017
  Time: 1:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<jsp:useBean id="dBean" class="example.JavaBean" scope="page" />
<%
    dBean.setGameName(bundle.getString("Name_Disk"));
    dBean.setGameInf(bundle.getString("Inf_Disk"));
    dBean.setImg("Cards_imgs/diskworld.png");
    dBean.setCard("");
    dBean.setCost("25$");
    dBean.setBuy("numDisk");
%>

<jsp:getProperty name="dBean" property="card"/>
</html>
