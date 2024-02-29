package web;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.User;
import dao.UserDAO;

@WebServlet("/editUser")
public class EditUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve user ID from the request
        Long userId = Long.parseLong(request.getParameter("userId"));
        
        // Retrieve user details from the database using the user ID
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserById(userId);
        
        // Pass user details to the editUser.jsp page for editing
        request.setAttribute("user", user);
        request.getRequestDispatcher("/editUser.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve user details from the form submission
        Long userId = Long.parseLong(request.getParameter("userId"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String sex = request.getParameter("sex");
        String country = request.getParameter("country");
        
        // Create a new User object with the updated details
       
        User updatedUser = new User(userId, password, name, email, sex, country);
        
        // Update the user details in the database
        UserDAO userDAO = new UserDAO();
        boolean success = userDAO.updateUser(updatedUser);
        
        // Redirect back to the user list page with a feedback message
        if (success) {
            request.setAttribute("message", "User updated successfully!");
        } else {
            request.setAttribute("message", "Failed to update user.");
        }
        request.getRequestDispatcher("/viewUsers.jsp").forward(request, response);
    }
}
