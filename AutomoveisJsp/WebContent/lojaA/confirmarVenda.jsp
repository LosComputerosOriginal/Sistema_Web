<%@page import="java.io.PrintStream"%>
<%@page import="javax.sound.midi.SysexMessage"%>
<%@ page contentType="text/html" language="java" import="java.sql.*"%>  
<jsp:useBean id="con" class="services.VeiculoServices"/>
<jsp:useBean id="con2" class="services.clienteservices"/>  
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<title>Cadastrar</title> 
<script type = "text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js">
  </script>
  <script type="text/javascript">
  function confirmacpf(callbackfn) {
	  var cpf = $("#cpfField").val();
	  
      var Success = false;
      $.ajax({
    	  
          type: "POST",
          url: "http://localhost:9090/AutomoveisJsp/Confirmacaocliente",
          dataType: "json",
          data: {cpf:JSON.stringify(cpf)},
  
          success: function (data) {
              callbackfn(data)
          },
          error: function (textStatus, errorThrown) {
              callbackfn("Cpf invalido")
          }

      });
   } 


   function Callback(data)
   {
     //alert(data.retorno);
      console.log(data.retorno);
     if(data.retorno == true){
     habilitaBotao();
     }else if(data.retorno == false){
    	 alert(data);
     }
   
     
   }	 
  </script>
  
  <script type="text/javascript">
  function habilitaBotao(){
	  $("#vendaconcluida").prop("disabled", false);
	   }
  </script>
  
  
  
  <script type="text/javascript">
  function Confirmarvenda(Callbackfn) {
	  var cpf = $("#cpfField").val();
	  var  CodCarro = $("#idVeiculo").val();
	  alert(CodCarro);
	  
      var Success = false;
      $.ajax({
    	  
          type: "POST",
          url: "http://localhost:9090/AutomoveisJsp/confirmarvenda",
          dataType: "json",
          data: {cpf:JSON.stringify(cpf), CodCarro:JSON.stringify(CodCarro)},
         
          success: function (data) {
              callbackfn(data)
          },
          error: function (textStatus, errorThrown) {
              callbackfn("Cpf invalido")
          }

      });
   } 
  </script>
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
  
		
  
  
  try{
	  con.setConsultaVeiculoVenda(request.getParameter("idveiculo"));  
      ResultSet temp = con.getResultado();  
      
      while (temp.next()){  
          %>  
         <tr>  
       <td width=30>  
               <%out.print(temp.getString("id"));%><input type="hidden" name="idVeiculo" id="idVeiculo" value="<%out.print(temp.getString("id"));%>"  />
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
               
              //out.Println(stat);
               
               if(stat == 0){
            	   out.print("Em estoque");
               }else{
            	   out.print("Vendido");
               }
               
               
         
          }  
	  
	  
  }catch(Exception e){
	  e.printStackTrace();
  }
  
  
  %>
 </table>


      
     
      
 
</form>  
<form name="cadastro" method="post" >  
<%
String cpf = request.getParameter("cpf");
String status = request.getParameter("status");
String nome = request.getParameter("nome");

 %>
    <p>
         <strong>CPF:</strong>    
        <input name="cpf" type="text" id="cpfField" size="12" value="<%=(cpf==null)?"":cpf%> "/>     </p>
        <input  id="confirmacadastro" type="button" onClick="confirmacpf(Callback)" name="bt1" value="Confirmar Cadastro" />
        <input id="vendaconcluida" type="button" onClick="Confirmarvenda(Callback)" name="bt2" disabled value="Confirmar venda" />
        <input  id="habilitar" type="button" onClick='habilitaBotao()'> 
        
   
    <p> <strong>Status:  
   <input name="statusField" disabled type="text" id="statusField" size="46" value="<%=(status==null)?"":status%>">  
      </strong></p>
      
      </form>
<button  id="home"class="btn btn-primary"  onclick="location.href='vender.jsp'">Voltar</button>


</body>  
</html>  