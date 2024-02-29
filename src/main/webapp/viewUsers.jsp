<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
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
    </style>
</head>
<body>
    <h2>User List</h2>
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
                List<User> userList = (List<User>)request.getAttribute("userList");
                if(userList != null && !userList.isEmpty()) {
                    for(User user : userList) {
            %>
                        <tr>
                            <td><%= user.getName() %></td>
                            <td><%= user.getEmail() %></td>
                            <td><%= user.getSex() %></td>
                            <td><%= user.getCountry() %></td>
                            <td>
                                <form action="editUser" method="post" style="display: inline;">
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
                        <td colspan="5"></td>
                    </tr>
                    
                      <tr>
                            <td>Jack</td>
                            <td>Mangosa</td>
                            <td>Male</td>
                            <td>USA</td>
                            <td>
                                <form action="editUser" method="post" style="display: inline;">
                                    <input type="hidden" name="userId" value=''>
                                    <button type="submit" class="edit-btn">Edit</button>
                                </form>
                                <form action="deleteUser" method="post" style="display: inline;">
                                    <input type="hidden" name="userId" value="">
                                    <button type="submit" class="delete-btn">Delete</button>
                                </form>
                            </td>
                        </tr>
            <% } %>
        </tbody>
    </table>
    <a href="/">Add New User</a>
</body>
</html>
