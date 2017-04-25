<%--
  Created by IntelliJ IDEA.
  User: alibct
  Date: 2017/4/25
  Time: 下午3:36
  Desc: 退出
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.removeAttribute("bloggerName");
    response.sendRedirect(request.getContextPath() + "/login");
%>
