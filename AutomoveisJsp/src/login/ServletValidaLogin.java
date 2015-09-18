package login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Usuario;
import dao.DaoUsuario;
 


public class ServletValidaLogin extends HttpServlet {
 
    private static final long serialVersionUID = 7633293501883840556L;
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
                         throws ServletException, IOException{
 
        HttpSession session = request.getSession(); //obtem a sessao do usuario, caso exista
 
        Usuario user = null;
        String login_form = request.getParameter("username"); // Pega o Login vindo do formulario
        String senha_form = request.getParameter("password"); //Pega a senha vinda do formulario
 
        try {
            DaoUsuario dao = new DaoUsuario(); //cria uma instancia do DAO usuario
            user = dao.getUsuario(login_form, senha_form);
        }
        catch ( Exception e ){
 
        }
 
        //se nao encontrou usuario no banco, redireciona para a pagina de erro!
        if ( user == null ) {
            session.invalidate();
            request.getRequestDispatcher("login.jsp" ).forward(request, response);
        }
        else{
            //se o dao retornar um usuario, coloca o mesmo na sessao
            session.setAttribute("user", user);
            request.getRequestDispatcher("lojaA/logado.jsp" ).forward(request, response);
        }
 
    }
 
}