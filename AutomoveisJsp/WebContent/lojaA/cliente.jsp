
<%@ page contentType="text/html"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   

<html>  
<head>  
<title>Tabela Cliente</title>  
  
  <script type = "text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js">
  </script>
  

  
  
<script>  
  
function enviar(par){  
     <%
        
     %>
      if (par == 'cadastrar'){  
      if (document.cadastro.cpfField.value == ''){  
    	  document.cadastro.statusField.value = 'Preencha o campo CPF'; 
      }else if (document.cadastro.nomeField.value == ''){  
         document.cadastro.statusField.value = 'Preencha o campo Nome'; 
      }else if (document.cadastro.rgField.value == ''){  
          document.cadastro.statusField.value = 'Preencha o campo rg'; 
      }else if (document.cadastro.telefoneField.value == ''){  
          document.cadastro.statusField.value = 'Preencha o campo telefone'; 
      }else if (document.cadastro.ruaField.value == ''){  
          document.cadastro.statusField.value = 'Preencha o campo rua';
      }else if (document.cadastro.bairroField.value == ''){  
          document.cadastro.statusField.value = 'Preencha o campo bairro'; 
      }else if (document.cadastro.numeroField.value == ''){  
          document.cadastro.statusField.value = 'Preencha o campo numero'; 
      }else if (document.cadastro.cidadeField.value == ''){  
          document.cadastro.statusField.value = 'Preencha o campo cidade'; 
      }else if (document.cadastro.nascimentoField.value == ''){  
          document.cadastro.statusField.value = 'Preencha o campo nascimento';
      }else if (document.cadastro.emailField.value == ''){  
          document.cadastro.statusField.value = 'Preencha o campo email'; 
          
         }else {  
         document.cadastro.action='cadastrarcliente.jsp';  
         document.cadastro.submit();  
      }  
  
   } else if (par == 'consultar'){  
	      if (document.cadastro.cpfSelect.value == ''){  
         document.cadastro.statusField.value = 'Preencha o cpf';  
      }else {  
         document.cadastro.action='consultarcliente.jsp';  
         document.cadastro.submit();  
      }  
   }
  

}
</script>  
  
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">  
<style type="text/css" >
body {background-color : #4682B4}
body {color: lightcyan}  
<!--  
.style3 {   font-size: 28px;  
   font-weight: bold;  
}  
-->  
</style>  
</head>  
  
<%  
//String nome = request.getParameter("nome");  
//String idade = request.getParameter("idade");  
//String sexo = request.getParameter("sexo");  
String nome = request.getParameter("nome");
String cpf = request.getParameter("cpf");
String rg =request.getParameter("rg");
String numero =request.getParameter("numero");
String cidade = request.getParameter("cidade");
String bairro = request.getParameter("bairro");
String email = request.getParameter("email");
String status = request.getParameter("status");
String nascimento = request.getParameter("nascimento");
String telefone = request.getParameter("telefone");
String rua = request.getParameter("rua");

//int ano = Integer.parseInt((String)request.getParameter("ano"));
//Float valorcusto = Float.parseFloat((String)request.getParameter("valorcusto"));
//Float valorvenda = Float.parseFloat((String)request.getParameter("valorvenda"));

%>  
  
  
<body>  



<form name="cadastro" method="get" >  
  
<table width="472" border="0" align="center">  
  <tr>  
    <td width="458" height="70" bgcolor="#4682B4"><p align="left" class="style3"> Cadastro cliente </p>  
    </td>  
  </tr>  
  <tr>  
    <td height="177" bgcolor="#4682B4" align="center"><p>
   


      
       
 
       
       <p><strong>cpf:</strong> 
       <input name="cpfField" type="text" id="cpfField" size="4" value="<%=(cpf==null)?"":cpf%>">
               <strong>nome:</strong>              
        <input name="nomeField" type="text" id="nomeField" size="4" value="<%=(nome==null)?"":nome%>"> 
           <p> <strong>rg:</strong>
        <input name="rgField" type="text" id="rgField" size="8" value="<%=(rg==null)?"":rg%>">
            <strong>telefone:</strong>    
        <input name="telefoneField" type="text" id="telefoneField" size="8" value="<%=(telefone==null)?"":telefone%>"> 
          </p>
  
              <strong>Rua:</strong>    
        <input name="ruaField" type="text" id="ruaField" size="8" value="<%=(rua==null)?"":rua%>">
                               <p>
         <strong>bairro:</strong>    
        <input name="bairroField" type="text" id="bairroField" size="8" value="<%=(bairro==null)?"":bairro%>">     
              
              <strong>numero:</strong>    
        <input name="numeroField" type="text" id="numeroField" size="8" value="<%=(numero==null)?"":numero%>">
              </p>
                      <p>
              <strong>cidade:</strong>    
        <input name="cidadeField" type="text" id="cidadeField" size="8" value="<%=(cidade==null)?"":cidade%>">
              
              </p>
              <p>
              <strong>nasicmento:</strong>    
        <input name="nascimentoField" type="text" id="nascimentoField" size="8" value="<%=(nascimento==null)?"":nascimento%>">
              
              </p>
              <p>
              <strong>email:</strong>    
        <input name="emailField" type="text" id="emailField" size="8" value="<%=(email==null)?"":email%>">
              
              </p>
   </td>  
  </tr> 
  <tr>  
    <td height="101" bgcolor="#4682B4" align="center"><p>   
        <input type="button" onClick="enviar('cadastrar')" name="bt1" value="cadastrar">  
        <input type="button" onClick="enviar('alterar')" name="bt3" value="alterar">  
        <input type="button" onClick="enviar('excluir')" name="bt4" value="excluir">  
        <input type="button" onClick="enviar('listar')" name="bt5" value="listar">  
      </p>  
      <p> <strong>Status:  
   <input name="statusField" disabled type="text" id="statusField" size="46" value="<%=(status==null)?"":status%>">  
      </strong></p>  
         </td>
       </tr>  
  </table> 
</form> 
<br>
<div align="center">
<button  id="home" class="btn btn-primary"  onclick="location.href='logado2.jsp'">Inicio do Sistema</button>
<button  id="logout"class="btn btn-primary"  onclick="location.href='logout.jsp'">Sair do Sistema</button> 
</div>
</body>  
</html>  