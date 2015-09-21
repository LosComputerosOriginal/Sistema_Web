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
   
   </tr>  
  
  

  
 
<%      
   try {  
	  
     
       con.inserir(Integer.parseInt(request.getParameter("modelo")),
    		   request.getParameter("versaoField"),
    		   request.getParameter("corField"),
    		  Integer.parseInt(request.getParameter("anoField")), 
	    	  Integer.parseInt(request.getParameter("statusCarroField")),
    		  Float.parseFloat(request.getParameter("valorcustoField")), 
    		  Float.parseFloat(request.getParameter("valorvendaField")), 	
    		  request.getParameter("placaField"),
    		  request.getParameter("motorField"),
    		  request.getParameter("combustivelField"));			
       
     
	
                 
      con.setConsulta();  
      ResultSet temp = con.getResultado();  
      temp.next();  
        
      if(request.getParameter("modeloField").equals(temp.getString("modelo")))  
         response.sendRedirect("http://localhost:8080/AutomoveisJsp/lojaA/veiculos.jsp?status=Registro já existente");  
        
      do{  
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
               </tr>  
      <%}while (temp.next());  
     
   }catch (Exception e) {  
      e.printStackTrace();
   }  
    

%>  
</table>  
  <p> </p>  
  <p>  
    <input type="submit" name="Submit" value="voltar">  
</p>    
<p><strong>Status:  
    <input name="statusField" disabled type="text" id="statusField" size="36" value="<%=request.getParameter("modeloField")%> foi cadastrado com sucesso">  
      </strong></p>  
</form>  
</body>  
</html>  