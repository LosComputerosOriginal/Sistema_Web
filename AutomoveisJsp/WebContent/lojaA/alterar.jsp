<%@ page contentType="text/html" language="java" import="java.sql.*"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<jsp:useBean id="con" class="conexao.Conexao"/>  
<html>  
<head>  
<title>Alterar</title>  
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">  
</head>  
  
<body>  
<form name="form1" method="post" action="pessoa.jsp">  
  
<jsp:setProperty name="con" property="marca" value="<%=request.getParameter("nomeField")%>"/>  
<jsp:setProperty name="con" property="modelo" value="<%=Integer.parseInt(request.getParameter("idadeField"))%>"/>  
<jsp:setProperty name="con" property="ano" value="<%=request.getParameter("sexoField")%>"/>  
<p><strong>Tabela Veiculos </strong></p>  
<table border=1 cellspacing=0 cellpadding=0 >  
  
   <tr>  
    <td width=200><strong>  
      Nome  
   </strong></td>      
   <td width=50><strong>  
      Idade  
   </strong></td>      
   <td width=30><strong>  
      Sexo  
   </strong></td>  
   </tr>  
  
  
<%      
   try {  
  
      boolean testa = con.alterarDados();  
                 
      if (con.alterarDados())  
      {           
         con.setConsulta();  
         ResultSet temp = con.getResultado();  
        
         while (temp.next()){  
         %>  
         <tr>  
             <td width=200>  
               <%out.print(temp.getString("marca"));%>  
            </td>  
             <td width=50>  
               <%out.print(temp.getString("modelo"));%>  
            </td>  
             <td width=30>  
               <%out.print(temp.getString("ano"));%>  
            </td>  
         </tr>  
         <%}  
      }else{  
         response.sendRedirect("http://localhost:8080/AutomoveisJsp/lojaA/veiculos.jsp?status=Registro não encontrado");  
      }     
   }catch (Exception e) {  
      e.printStackTrace();  
   }  
     
%>  
</table>  
  <p>  
    <input type="submit" name="Submit" value="voltar">  
</p>    
<p><strong>Status:  
    <input name="statusField" disabled type="text" id="statusField" size="36" value="<%=request.getParameter("nomeField")%> foi alterado com sucesso">  
      </strong></p>  
</form>  
</body>  
</html>  