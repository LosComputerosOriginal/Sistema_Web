<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style>
body{background-color: steelblue}
body {color : lightcyan}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Logado</title>
</head>
<body>
 <div align="center">
<c:choose>
    <c:when test="${ user eq null }">
        <jsp:forward page="login.jsp" />
    </c:when>
    <c:otherwise>
            <p>Bem-vindo ${ user.nome }</p>
    </c:otherwise>
 
</c:choose>

<button  id="home"class="btn btn-primary"  onclick="location.href='veiculos.jsp'">Cadastro Veiculos</button>
<button  id="home"class="btn btn-primary"  onclick="location.href='listarparavenda.jsp'">Efetuar Venda</button>
<button  id="logout"class="btn btn-primary"  onclick="location.href='logout.jsp'">Sair do sistema</button>
<button  id="logout"class="btn btn-primary"  onclick="location.href='cliente.jsp'">Cadastrar cliente</button>

</div>
</body>
</html>