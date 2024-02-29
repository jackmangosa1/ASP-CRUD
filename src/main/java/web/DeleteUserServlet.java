package web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import dao.UserDAO;

/**
 * Servlet implementation class DeleteUserServlet
 */
@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  Long userId = Long.parseLong(request.getParameter("userId"));

	        // Perform deletion
	        UserDAO userDAO = new UserDAO();
	        boolean success = userDAO.deleteUser(userId);

	        // Set feedback message
	        if (success) {
	            request.setAttribute("message", "User deleted successfully!");
	        } else {
	            request.setAttribute("message", "Failed to delete user.");
	        }

	        // Forward back to the user list page with feedback message
	        request.getRequestDispatcher("/viewUsers.jsp").forward(request, response);
	}

}
