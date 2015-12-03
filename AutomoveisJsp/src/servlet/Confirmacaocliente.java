package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import dao.DaoCliente;

@WebServlet("/Confirmacaocliente")
public class Confirmacaocliente extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		
//		
		String cpf = request.getParameter("cpf");
		cpf=cpf.replace(" ", "");
		cpf=cpf.replace("\"", "");
 
	//System.out.println(cpf);
	
//	
//	  response.setContentType("text/html;charset=UTF-8");
//      response.getWriter().write("Success Data");
        if(cpf.equals("")){
        	PrintWriter out = response.getWriter();
    		
    		String json = "{\"retorno\" : false}";
    		
    		out.println(json);
        	
        }else{
        	String nome = DaoCliente.consultacpf(cpf);
        	System.out.println(nome);
        	if(nome==null){
    
PrintWriter out = response.getWriter();
        		
        		String json = "{\"retorno\" : false}";
        		
        		out.println(json);
    
        	}else {
        		PrintWriter out = response.getWriter();
        		
        		String json = "{\"retorno\" : true}";
        		
        		out.println(json);
        		
        	}
        }
	
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/*if (cpf.equals("")) {
			System.out.println("Digite um cpf");
		} else if (cpf.equals(request.getParameter("cpf"))) {

			String nome = DaoCliente.consultacpf(cpf);
			if (nome == null) {
				System.out.println("cpfinvalido");
			} else {*/
//				PrintWriter out = response.getWriter();
//				response.setContentType("aplication/json");
//				response.setCharacterEncoding("utf-8");
//				JSONObject json = new JSONObject();
//				json.put("retorno" , true);
//				out.print(json.toString());
				
				//w.println(( " {'retorno' :'true'} "));
				//w.println("true");
				//System.out.println("************************--------*****************************");
				//response.sendRedirect("lojaA/logado2.jsp");
				//w.close();
			//}
		//}
	}

}
