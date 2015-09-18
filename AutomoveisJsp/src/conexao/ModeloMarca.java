package conexao;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ModeloMarca
 */
@WebServlet("/ModeloMarca")
public class ModeloMarca extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModeloMarca() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String marca = request.getParameter("marca");
		
		int id = Integer.parseInt(marca);
		
		try {
		ResultSet set =  MysqlConnect.db.query("");
			/*
			 * Modelo m = 
			 * 
			 * */
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		String option1 = "";
		
		if(marca.equalsIgnoreCase("Chevrolet")){
		
		for(int i = 0; i<4; i++){
		option1 += "<option value=' " + (i + 1) + "'> Item " + (i + 1)  + "</option>" ;
		
		
		
		}
		}else if(marca.equalsIgnoreCase("Ford")){
			for(int i = 0; i<4; i++){
				option1 += "<option value=' " + (i + 1) + "'> FORD  " + (i + 1)  + "</option>" ;
		}
		}		
		
		PrintWriter w = response.getWriter();
		
		w.println(option1);
		
		
		System.out.println(marca + "Do Servlet");
//		if(marca.equals("Ford") ){
//			response.getWriter().write("Ka");
//		}else{
//			response.getWriter().write("Qualquer Coisa");
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
