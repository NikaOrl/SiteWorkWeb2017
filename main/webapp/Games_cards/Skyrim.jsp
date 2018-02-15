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
<jsp:useBean id="sBean" class="example.JavaBean" scope="page" />
<%
    sBean.setGameName(bundle.getString("Name_Skyrim"));
    sBean.setGameInf(bundle.getString("Inf_Skyrim"));
    sBean.setImg("Cards_imgs/skyrim.png");
    sBean.setCard("");
    sBean.setCost("33$");
    sBean.setBuy("numSkyrim");
%>

<jsp:getProperty name="sBean" property="card"/>
</html>
