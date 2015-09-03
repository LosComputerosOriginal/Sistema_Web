<%@ page contentType="text/html" language="java" import="java.sql.*"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<jsp:useBean id="con" class="conexao.Conexao"/>  
<html>  
<head>  
<title>Untitled Document</title>  
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">  
</head>  
  
<body>  
<form name="form1" method="post" action="veiculos.jsp">  
  
<p><strong>Tabela Veiculo </strong></p>  
<table border=1 cellspacing=0 cellpadding=0 >  
  
   <tr>  
<td width=100><strong>  
      Cod Veiculo 
   </strong></td>      
    <td width=200><strong>  
      Marca 
   </strong></td>      
   <td width=100><strong>  
      Modelo 
   </strong></td>      
   <td width=60><strong>  
      Ano  
   </strong></td>  
   <td width=60><strong>  
      Placa 
   </strong></td>  
   <td width=100><strong>  
      Valor Custo  
   </strong></td>
   <td width=100><strong>  
      Valor Venda  
   </strong></td>  
  
  
<%      
   try {  
      con.setConsulta();  
      ResultSet temp = con.getResultado();  
        
      while (temp.next()){  
      %>  
      <tr>  
       <td width=30>  
               <%out.print(temp.getString("cod_veiculo"));%>  
         </td> 
          <td width=200>  
               <%out.print(temp.getString("marca"));%>  
         </td>  
          <td width=50>  
               <%out.print(temp.getString("modelo"));%>  
         </td>  
          <td width=30>  
               <%out.print(temp.getString("ano"));%>  
         </td>  
           <td width=30>  
               <%out.print(temp.getString("placa"));%>  
         </td> 
           <td width=30>  
               <%out.print(temp.getString("valorcusto"));%>  
         </td> 
           <td width=30>  
               <%out.print(temp.getString("valorvenda"));%>  
         </td> 
      <%}  
     
   }catch (Exception e) {  
      e.printStackTrace();  
   }  
     
%>  
</table>  
  <p>  
    <input type="submit" name="Submit" value="voltar">  
</p>  
</form>  
</body>  
</html>  