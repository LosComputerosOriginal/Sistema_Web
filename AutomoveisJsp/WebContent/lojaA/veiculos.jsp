
<%@ page contentType="text/html"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   

<html>  
<head>  
<title>Tabela Veiculos</title>  
  
  <script type = "text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js">
  </script>
  
  
 
  <%--Função Java script que recebe o valor dos selects, passa para o servlet(ModeloMarca), e usa os 
  dados recebidos para popular outro select 
  
   --%> 
  <script type="text/javascript">
  function carregaModelos(){
	  <%--Variável que recebe a chave primária do valor selecionado no select--%> 
	  var marca = $( "#marcaSelect" ).val();
	  console.log(marca)
	  
	  <%--Passa pelo get para o servlet a variável marca e recebe os dados para prencher o outro select--%>
	  
	  $.ajax({
		  url:"http://localhost:8080/AutomoveisJsp/ModeloMarca?marca=" + marca
	  }).done(function(data){
		console.log(data);
		$( "#modeloSelect" ).children().remove();
		 $( "#modeloSelect" ).append(data); 
	  });
  }
  
  
  </script>
  
  
  
  
<script>  
  
function enviar(par){  
     
   if (par == 'cadastrar'){  
     
      if (document.cadastro.marcaSelect.value == ''){  
         document.cadastro.statusField.value = 'Preencha o campo marca';  
      }else if (document.cadastro.modeloSelect.value == ''){  
         document.cadastro.statusField.value = 'Preencha o campo Modelo'; 
      }else if (document.cadastro.anoField.value == ''){  
          document.cadastro.statusField.value = 'Preencha o campo Ano'; 
      }else if (document.cadastro.placaField.value == ''){  
          document.cadastro.statusField.value = 'Preencha o campo Placa'; 
      }else if (document.cadastro.valorcustoField.value == ''){  
          document.cadastro.statusField.value = 'Preencha o campo Valor Custo'; 
      }else if (document.cadastro.valorvendaField.value == ''){  
          document.cadastro.statusField.value = 'Preencha o campo Valor Venda'; 
         }else {  
         document.cadastro.action='cadastrar.jsp';  
         document.cadastro.submit();  
      }  
  
   } else if (par == 'consultar'){  
  
      if (document.cadastro.modeloSelect.value == ''){  
         document.cadastro.statusField.value = 'Preencha o campo modelo';  
      }else {  
         document.cadastro.action='consultar.jsp';  
         document.cadastro.submit();  
      }  
  
   } else if (par == 'alterar'){  
	   if (document.cadastro.marcaSelect.value == ''){  
	         document.cadastro.statusField.value = 'Preencha o campo marca';  
	      }else if (document.cadastro.modeloSe.value == ''){  
	         document.cadastro.statusField.value = 'Preencha o campo Modelo'; 
	      }else if (document.cadastro.anoField.value == ''){  
	          document.cadastro.statusField.value = 'Preencha o campo Ano'; 
	      }else if (document.cadastro.placaField.value == ''){  
	          document.cadastro.statusField.value = 'Preencha o campo Placa'; 
	      }else if (document.cadastro.valorcustoField.value == ''){  
	          document.cadastro.statusField.value = 'Preencha o campo Valor Custo'; 
	      }else if (document.cadastro.valorvendaField.value == ''){  
	          document.cadastro.statusField.value = 'Preencha o campo Valor Venda'; 
      }else {  
         document.cadastro.action='alterar.jsp';  
         document.cadastro.submit();  
      }  
   } else if (par == 'excluir'){  
  
      if (document.cadastro.placaField.value == ''){  
         document.cadastro.statusField.value = 'Preencha o campo placa';  
      }else {  
         document.cadastro.action='excluir.jsp';  
         document.cadastro.submit();  
      }  
   } else if (par == 'listar'){  
      document.cadastro.action='listar.jsp';  
      document.cadastro.submit();  
   }  
}  
  
</script>  
  
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">  
<style type="text/css" >  
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
String status = request.getParameter("status");
String modelo = request.getParameter("modelo");
String placa = request.getParameter("placa");
String ano = request.getParameter("ano");
String valorcusto = request.getParameter("valorcusto");
String valorvenda = request.getParameter("valorvenda");
String idModelo = request.getParameter("modeloSelect");
System.out.println(idModelo);
String cor = request.getParameter("cor");
String combustivel = request.getParameter("combustivel");
String motor = request.getParameter("motor");
String versao = request.getParameter("versao");
//int ano = Integer.parseInt((String)request.getParameter("ano"));
//Float valorcusto = Float.parseFloat((String)request.getParameter("valorcusto"));
//Float valorvenda = Float.parseFloat((String)request.getParameter("valorvenda"));

%>  
  
  
<body>  








<form name="cadastro" method="get" >  
  
<table width="472" border="0" align="center">  
  <tr>  
    <td width="458" height="70" bgcolor="#6699FF"><p align="left" class="style3"> Cadastro Veiculos </p>  
    </td>  
  </tr>  
  <tr>  
    <td height="177" bgcolor="#6699FF" align="center"><p>
     <strong>Marca :</strong>  
        
        <jsp:useBean id="obj" class="dao.DaoMarca" scope="page"/>


<select id = "marcaSelect" name = "marca" onChange = "carregaModelos()">
    <option>Selecione a marca</option>
    <c:forEach var="item" items="${obj.getItems()}">
     
     <option value="${item.id}">${item.descricao}</option>
   		
    </c:forEach>
</select>

       
         
         <strong>Modelo :</strong>  
       <select id = "modeloSelect" name = "modelo">
    <option >Selecione a marca primeiro</option>
</select>
       
       
       <p><strong>Placa:</strong> 
        <input name="placaField" type="text" id="placaField" size="4" value="<%=(placa==null)?"":placa%>">
         <strong>Ano:</strong>              
        <input name="anoField" type="text" id="anoField" size="4" value="<%=(ano==null)?"":ano%>"> 
           <p> <strong>Valor Custo:</strong>
        <input name="valorcustoField" type="text" id="valorcustoField" size="8" value="<%=(valorcusto==null)?"":valorcusto%>">
            <strong>Valor Venda:</strong>    
        <input name="valorvendaField" type="text" id="valorvendaField" size="8" value="<%=(valorvenda==null)?"":valorvenda%>"> 
          </p>
  
              <strong>Cor:</strong>    
        <input name="corField" type="text" id="corField" size="8" value="<%=(cor==null)?"":cor%>">
        
         <strong>Status Carro:</strong>    
        <input name="statusCarroField" type="text" id="statusCarroField" size="8" value="<%=(status==null)?"":cor%>">
              <p>
         <strong>Combustivel:</strong>    
        <input name="combustivelField" type="text" id="combustivelField" size="8" value="<%=(combustivel==null)?"":combustivel%>">     
              
              <strong>Motor:</strong>    
        <input name="motorField" type="text" id="motorField" size="8" value="<%=(motor==null)?"":motor%>">
              </p>
              
              <p>
              <strong>Versão:</strong>    
        <input name="versaoField" type="text" id="versaoField" size="8" value="<%=(versao==null)?"":versao%>">
              
              </p>

   </td>  
  </tr>  
  <tr>  
    <td height="101" bgcolor="#6699FF" align="center"><p>   
        <input type="button" onClick="enviar('cadastrar')" name="bt1" value="cadastrar">  
        <input type="button" onClick="enviar('consultar')" name="bt2" value="consultar">  
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