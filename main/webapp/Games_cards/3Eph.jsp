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
<jsp:useBean id="eBean" class="example.JavaBean" scope="page" />
<%
    eBean.setGameName(bundle.getString("Name_3Eph"));
    eBean.setGameInf(bundle.getString("Inf_3Eph"));
    eBean.setImg("Cards_imgs/lotr.png");
    eBean.setCard("");
    eBean.setCost("33$");
    eBean.setBuy("num3Eph");
%>

<jsp:getProperty name="eBean" property="card"/>
</html>
