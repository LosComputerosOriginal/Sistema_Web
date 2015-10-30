<%@page import="java.io.PrintStream"%>
<%@page import="javax.sound.midi.SysexMessage"%>
<%@ page contentType="text/html" language="java" import="java.sql.*"%>  
<jsp:useBean id="con" class="services.clienteservices"/>  
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<title>Cadastrar</title>  
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">  
</head>  
  
<body>  



<form name="form1" method="post" action="cliente.jsp">  
  
<p><strong>tabela cliente</strong></p>  
<table border=1 cellspacing=0 cellpadding=0 >  
  
   <tr>  
   
   <td width=100><strong>  
     id
   </strong></td>      
    <td width=200><strong>  
   cpf
   </strong></td>      
   <td width=100><strong>  
      nome
   </strong></td>      
   <td width=100><strong>  
    rg
   </strong></td>
   <td width=60><strong>  
telefone
   </strong></td>  
   <td width=60><strong>  
      rua
   </strong></td>  
   <td width=100><strong>  
     bairro
   </strong></td>
   <td width=100><strong>  
      numero 
   </strong></td>  
   <td width=100><strong>  
     cidade
   </strong></td>  
   <td width=100><strong>  
     nascimento
   </strong></td>  
    <td width=100><strong>  
     email
   </strong></td>    
   
   </tr>  
  
  

  <%
  
        // con.inserirClientes(Integer.parseInt(request.getParameter("id")),
		 //Integer.parseInt(request.getParameter("cpfField")),
		 //request.getParameter("nomeField"),
		 //Integer.parseInt(request.getParameter("rgField")), 
  // 	     request.getParameter("telefoneField"), 
	//	 request.getParameter("ruaField"), 	
		// request.getParameter("bairroField"),
		 //Integer.parseInt(request.getParameter("numeroField")),
		 //request.getParameter("cidadeField"),	
         //request.getParameter("nascimentoField"),	
         //request.getParameter("emailField"));		
try{  
  con.inserirClientes(request.getParameter("cpfField"), request.getParameter("nomeField"), 
		  Integer.parseInt(request.getParameter("rgField")), request.getParameter("telefoneField"),
		  request.getParameter("ruaField"), request.getParameter("bairroField"),
		  Integer.parseInt(request.getParameter("numeroField")), request.getParameter("cidadeField"),
		  request.getParameter("nascimentoField"),request.getParameter("emailField"));
  
}catch(Exception e){
  e.printStackTrace();
}

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
             <%out.print(temp.getString("cpf"));%>  
       </td>  
        <td width=50>  
             <%out.print(temp.getString("nome"));%>  
       </td>
       
       <td width=50>  
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
       </td> 
       
        <td width=30>  
             <%out.print(temp.getString("nascimento"));%>  
       </td> 
        <td width=30>  
             <%out.print(temp.getString("email"));%>  
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
  
</form>  
</body>  
</html>  