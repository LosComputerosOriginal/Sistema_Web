<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Login</title>
<style>
body {background-color : orange}
body {color:blue}

</style>
</head>
<body>
<br></br>
 <div align="center"><img src="/AutomoveisJsp/imagens/logo.png" alt="Automoveis" width="320" height="120" /></div> 
<form method="post" action="validaLogin.do">

<div align="center"><h2>
<br></br>
    <tr>
        <td >Usuário</td>
        <td><input type="text" name="username" /></td>
    </tr>
    </h2>
    </div>
    <tr>
    <div align="center"><h2>
        <td>Senha</td>
        <td><input type="password" name="password" /></td>
        </h2></div>
    </tr>
    <tr>
    <div align="center">
        <td><input type="submit" value="Login" /></td>
        </div>
    </tr>
   
    

 
</form>
 
</body>
</html>