package com.massz.controller;

import com.massz.bean.User;
import com.massz.service.BookService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/back_register")
public class Back_RegisterServlet extends HttpServlet {

    private BookService bookService = new BookService();

    /**
     * 检验用户是否存在
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    /**
     * 提交
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String gender = req.getParameter("gender");
        String email = req.getParameter("email");
        int userType = Integer.parseInt(req.getParameter("userType"));
        String bio = req.getParameter("Bio");
        // 检查用户名是否可用
        if (!bookService.isUsernameAvailable(username)) {
            req.setAttribute("usernameError", "该用户名已经被使用，请选择其他用户名。");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/back_register.jsp");
            dispatcher.forward(req, resp);
            return;
        }
        // 创建用户对象
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setGender(gender);
        user.setEmail(email);
        user.setUserType(userType);
        user.setBio(bio);
        System.out.println("userType的值：" + userType);
        // 注册用户
        if (bookService.registerUser(user)) {
            if (userType == 2) {
                // 玩家类型，可以跳转到前台首页或者其他页面
                resp.sendRedirect(req.getContextPath() + "/front_login.jsp");
            }
        } else {
            req.setAttribute("registrationError", "注册失败，请稍后再试。");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/back_register.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
