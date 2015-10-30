package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.lang.ProcessBuilder.Redirect;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conexao.MysqlConnect;
import dao.DaoCliente;
import dao.DaoModelo;
import model.Modelo;


@WebServlet("/Confirmacaocliente")
public class Confirmacaocliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
		
				
		
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String cpf = request.getParameter("cpf");
		System.out.println("nome servlet "+ cpf);
		RequestDispatcher rd = null;
		
		
		if(cpf.equals("")){
			PrintWriter w = response.getWriter();
			w.println("<option>Digite o cpf</option>");
		}else if(cpf.equals(request.getParameter("cpf"))){
		
		String nome = DaoCliente.consultacpf(cpf);
		if (nome==null){
			System.out.println("cpfinvalido");
		}else{
			rd = request.getRequestDispatcher("lojaA/logado.jsp");
			rd.forward(request, response);
        
		System.out.println("saindo nome "+ nome);
		
		
		}
		}
	    }
		
		
		
		
		
		
	

}
