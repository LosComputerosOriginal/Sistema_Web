<%@ page contentType="text/html" language="java" import="java.sql.*"%>  
<jsp:useBean id="con" class="conexao.Conexao"/>  
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<title>Consulta</title>  
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">  
</head>  
  
<body>  
<form method="get">  
<%  
      con.setModelo(request.getParameter("modeloField"));  
      boolean testa = con.consultarDados();  
                 
      if (testa)  
      {           
         ResultSet temp = con.getResultado();  
         response.sendRedirect("http://localhost:8080/AutomoveisJsp/lojaA/veiculos.jsp?status=Consulta efetuada com sucesso&modelo="+  
            temp.getString("modelo")+"&ano="+temp.getString("ano")+"&marca="+temp.getString("marca")+"&placa="+temp.getString("placa")+"&valorcusto="+temp.getString("valorcusto")+"&valorvenda="+temp.getString("valorvenda"));  
      }else{  
         response.sendRedirect("http://localhost:8080/AutomoveisJsp/lojaA/veiculos.jsp?status=Registro não encontrado");  
      }  
           
              
%>  
</form>  
</body>  
</html> 