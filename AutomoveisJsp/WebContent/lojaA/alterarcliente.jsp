<%@ page contentType="text/html" language="java" import="java.sql.*"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<jsp:useBean id="con" class="conexao.Conexao"/>  
<html>  
<head>  
<title>Alterar</title>  
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">  
</head>  
  
<body>  
<form name="form1" method="post" action="cliente.jsp">  
  
<jsp:setProperty name="con" property="marca" value="<%=request.getParameter("cpfField")%>"/>  
<jsp:setProperty name="con" property="modelo" value="<%=Integer.parseInt(request.getParameter("nomeField"))%>"/>  
<jsp:setProperty name="con" property="ano" value="<%=request.getParameter("rgField")%>"/>  
<jsp:setProperty name="con" property="ano" value="<%=request.getParameter("telefoneField")%>"/> 
<jsp:setProperty name="con" property="ano" value="<%=request.getParameter("ruaField")%>"/> 
<jsp:setProperty name="con" property="ano" value="<%=request.getParameter("bairroField")%>"/> 
<jsp:setProperty name="con" property="ano" value="<%=request.getParameter("numeroField")%>"/> 
<jsp:setProperty name="con" property="ano" value="<%=request.getParameter("cidadeField")%>"/>
<jsp:setProperty name="con" property="ano" value="<%=request.getParameter("nascimentoField")%>"/>
<jsp:setProperty name="con" property="ano" value="<%=request.getParameter("emailField")%>"/>

<p><strong>Tabela Cliente </strong></p>  
<table border=1 cellspacing=0 cellpadding=0 >  
  
   <tr>  
    <td width=200><strong>  
      Cpf 
   </strong></td>      
   <td width=50><strong>  
      Nome 
   </strong></td>      
   <td width=30><strong>  
      Rg 
   </strong></td> 
   <td width=50><strong>  
      Telefone
   </strong></td> 
   <td width=50><strong>  
      Rua
   </strong></td>  
   <td width=50><strong>  
      Bairro
   </strong></td>
   <td width=50><strong>  
      Numero
   </strong></td> 
   <td width=50><strong>  
      Cidade
   </strong></td> 
   <td width=50><strong>  
      Nascimento
   </strong></td>
   <td width=50><strong>  
      Email
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
               <%out.print(temp.getString("cpf"));%>  
            </td>  
             <td width=50>  
               <%out.print(temp.getString("nome"));%>  
            </td>  
             <td width=30>  
               <%out.print(temp.getString("rg"));%>  
            </td>  
            <td width=30>  
               <%out.print(temp.getString("telefone"));%>  
            </td>  
            <td width=30>  
               <%out.print(temp.getString("rua"));%>  
            </td>  
            <td width=30>  
               <%out.print(temp.getString("bairro"));%>  
            </td>  
            <td width=30>  
               <%out.print(temp.getString("numero"));%>  
            </td>  
            <td width=30>  
               <%out.print(temp.getString("cidade"));%>  
               <td width=30>  
               <%out.print(temp.getString("nascimento"));%>  
            </td>
            <td width=30>  
               <%out.print(temp.getString("email"));%>  
            </td>    
            
         </tr>  
         <%}  
      }else{  
         response.sendRedirect("http://localhost:8080/AutomoveisJsp/lojaA/cliente.jsp?status=Registro não encontrado");  
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