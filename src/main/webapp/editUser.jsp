<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="dao.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        form {
            width: 50%;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
      
          h2 {
            text-align: center;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="password"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            background-color: #497BF9;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #497BF8;
        }
    </style>
</head>
<body>
    <h2>Edit User</h2>
     <% 
        // Retrieve user ID from the request
        String userId = request.getParameter("userId");
        if (userId != null) {
            // Fetch user data based on the user ID
            UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserById(Long.parseLong(userId));

            // Populate the edit form with user data
            if (user != null) {
    %>
    <form action="editUser" method="post">
        <input type="hidden" name="userId" value="<%= user.getId() %>">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= user.getName()%>" required>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" value="<%= user.getPassword() %>" required>
        
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" value="<%= user.getEmail() %>" required>
        
        <label for="sex">Sex:</label>
        <select id="sex" name="sex" required>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
        </select>
        
        <label for="country">Country:</label>
        <input type="text" id="country" name="country" value="<%= user.getCountry() %>" required>
        
        <input type="submit" value="Update">
    </form>
    
    <%
            } else {
                out.println("User not found");
            }
        } else {
            out.println("User ID not provided");
        }
    %>
</body>
</html>
