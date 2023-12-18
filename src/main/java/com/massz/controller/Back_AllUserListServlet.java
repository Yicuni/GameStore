package com.massz.controller;

import com.massz.bean.User;
import com.massz.service.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/all_users")
public class Back_AllUserListServlet extends HttpServlet {
    BookService bookService = new BookService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        List<User> allUsers;
        String username = req.getParameter("username");
        String userType = req.getParameter("userType");
        if (username == null && userType == null) {
            allUsers = bookService.getAllUsers();
        } else {
            allUsers = bookService.getUsersByCond(username, userType);
        }
        System.out.println(allUsers);
        req.setAttribute("back_userList", allUsers);
        req.getRequestDispatcher("/back_userlist.jsp").forward(req, resp);
    }
}
