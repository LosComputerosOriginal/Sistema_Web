<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" 
  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" 
  content="text/html; charset=UTF-8" />
<title>Logout Automoveis</title>

</head>
<body>
<br>
</br>

<div align="center">

<%  
    session.invalidate();  
    response.sendRedirect(request.getContextPath()+"/login.jsp");  
      
%> 



<a href="${pageContext.request.contextPath}/logout">Sim</a>
<a href="logado2.jsp">Nao</a>
</div>
</body>
</html>
