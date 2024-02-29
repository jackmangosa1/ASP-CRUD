package web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import model.User;
import dao.UserDAO;
/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/user")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String sex = request.getParameter("sex");
        String country = request.getParameter("country");

        User user = new User(name, password, email, sex, country);
        UserDAO userDAO = new UserDAO();

        userDAO.saveUser(user);

        request.setAttribute("message", "User registered successfully!");

        // Forward the request back to the registration form
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

   

}
