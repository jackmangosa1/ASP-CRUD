<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="dao.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #497BF9;
            color: white;
        }
        .edit-btn, .delete-btn {
            padding: 6px 10px;
            background-color: #497BF9;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .edit-btn:hover, .delete-btn:hover {
            background-color: #497BF8;
        }
        .link{
        margin-bottom: 1rem;
        }
           .message {
         	margin: 0 auto;
         	width: 45rem;
            background-color: #497BF8;
            color: white;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<%
    String message = (String)request.getAttribute("message");
    if (message != null) {
%>
        <p class="message"><%= message %></p>
<%
    }
%>
	
    <h2>User List</h2>
    <a class="link"  href="/JSP-CRUD" >Add a New User</a>
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Sex</th>
                <th>Country</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%-- Iterate over the list of users and display each user --%>
            <%
            UserDAO userDAO = new UserDAO();
            List<User> userList = userDAO.getAllUsers();
          
       
                if(userList != null && !userList.isEmpty()) {
                    for(User user : userList) {
            %>
                        <tr>
                            <td><%= user.getName() %></td>
                            <td><%= user.getEmail() %></td>
                            <td><%= user.getSex() %></td>
                            <td><%= user.getCountry() %></td>
                            <td>
                                <form action="editUser.jsp" method="post" style="display: inline;">
                                    <input type="hidden" name="userId" value="<%= user.getId() %>">
                                    <button type="submit" class="edit-btn">Edit</button>
                                </form>
                                <form action="deleteUser" method="post" style="display: inline;">
                                    <input type="hidden" name="userId" value="<%= user.getId() %>">
                                    <button type="submit" class="delete-btn">Delete</button>
                                </form>
                            </td>
                        </tr>
            <%
                    }
                } else {
            %>
                    <tr>
                        <td colspan="5">No users found</td>
                    </tr>
                    
                  
            <% } %>
        </tbody>
    </table>
</body>
</html>
