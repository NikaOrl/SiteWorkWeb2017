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
<jsp:useBean id="hBean" class="example.JavaBean" scope="page" />
<%
    hBean.setGameName(bundle.getString("Name_Hogw"));
    hBean.setGameInf(bundle.getString("Inf_Hogw"));
    hBean.setImg("Cards_imgs/drunk_potter.png");
    hBean.setCard("");
    hBean.setCost("58$");
    hBean.setBuy("numHogw");
%>

<jsp:getProperty name="hBean" property="card"/>
</html>
