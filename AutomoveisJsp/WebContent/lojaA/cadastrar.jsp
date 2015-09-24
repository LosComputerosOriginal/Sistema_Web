<%@page import="java.io.PrintStream"%>
<%@page import="javax.sound.midi.SysexMessage"%>
<%@ page contentType="text/html" language="java" import="java.sql.*"%>  
<jsp:useBean id="con" class="services.VeiculoServices"/>  
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<title>Cadastrar</title>  
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">  
</head>  
  
<body>  



<form name="form1" method="post" action="veiculos.jsp">  
  
<p><strong>Tabela Veiculos </strong></p>  
<table border=1 cellspacing=0 cellpadding=0 >  
  
   <tr>  
   
   <td width=100><strong>  
      Cod Veiculo 
   </strong></td>      
    <td width=200><strong>  
      Marca 
   </strong></td>      
   <td width=100><strong>  
      Versão 
   </strong></td>      
   <td width=100><strong>  
     Placa
   </strong></td>
   <td width=60><strong>  
      Cor  
   </strong></td>  
   <td width=60><strong>  
      Ano 
   </strong></td>  
   <td width=100><strong>  
      Valor Custo  
   </strong></td>
   <td width=100><strong>  
      Valor Venda  
   </strong></td>  
   <td width=100><strong>  
      Combustível  
   </strong></td>  
   <td width=100><strong>  
     Motor
   </strong></td>  
    <td width=100><strong>  
     Status
   </strong></td>    
   
   </tr>  
  
  

  <%
  
  con.inserir(Integer.parseInt(request.getParameter("modelo")),
		   request.getParameter("versaoField"),
		   request.getParameter("corField"),
		  Integer.parseInt(request.getParameter("anoField")), 
   	      0,
		  Float.parseFloat(request.getParameter("valorcustoField")), 
		  Float.parseFloat(request.getParameter("valorvendaField")), 	
		  request.getParameter("placaField"),
		  request.getParameter("motorField"),
		  request.getParameter("combustivelField"));			
  
  
  try{
	  con.setConsulta();  
      ResultSet temp = con.getResultado();  
      
      while (temp.next()){  
          %>  
         <tr>  
       <td width=30>  
               <%out.print(temp.getString("id"));%>  
         </td> 
          <td width=200>  
               <%out.print(temp.getString("nome_modelo"));%>  
         </td>  
          <td width=50>  
               <%out.print(temp.getString("versao"));%>  
         </td>
         
         <td width=50>  
               <%out.print(temp.getString("placa"));%>  
         </td> 
           
          <td width=30>  
               <%out.print(temp.getString("cor"));%>  
         </td>  
           <td width=30>  
               <%out.print(temp.getString("ano"));%>  
         </td> 
           <td width=30>  
               <%out.print(temp.getString("valorcusto"));%>  
         </td> 
           <td width=30>  
               <%out.print(temp.getString("valorvenda"));%>  
         </td>
       
          <td width=30>  
               <%out.print(temp.getString("combustivel"));%>  
         </td> 
         
          <td width=30>  
               <%out.print(temp.getString("motor"));%>  
         </td> 
                
          <td width=30>  
               <%
               int stat = Integer.parseInt(temp.getString("status"));
               
               System.out.println(stat);
               
               if(stat == 0){
            	   out.print("Em estoque");
               }else{
            	   out.print("Vendido");
               }
               
               %>  
         </td> 
          <%}  
	  
	  
  }catch(Exception e){
	  e.printStackTrace();
  }
  
  
  %>
 


  
</table>  
  <p> </p>  
  <p>  
    <input type="submit" name="Submit" value="voltar">  
</p>    
 <p><strong>Status:  
    <input name="statusField" disabled type="text" id="statusField" size="36" value="<%=request.getParameter("placaField")%> foi cadastrado com sucesso">  
      </strong></p>  
</form>  
</body>  
</html>  