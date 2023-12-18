package com.massz.controller;

import com.massz.bean.User;
import com.massz.service.GameService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/front_register")
public class Front_RegisterServlet extends HttpServlet {

    private GameService gameService = new GameService();

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
        String registrationTime = req.getParameter("registrationTime");;
        String Bio = req.getParameter("Bio");

        // 检查用户名是否可用
        if (!gameService.isUsernameAvailable(username)) {
            req.setAttribute("usernameError", "该用户名已经被使用，请选择其他用户名。");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/front_register.jsp");
            dispatcher.forward(req, resp);
            return;
        }

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setGender(gender);
        user.setEmail(email);
        user.setRegistrationTime(registrationTime);
        user.setBio(Bio);

        // 注册用户
        if (gameService.registerPlayer(user)) {
            resp.sendRedirect(req.getContextPath() + "/front_login.jsp");
        } else {
            req.setAttribute("registrationError", "注册失败，请稍后再试。");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/front_register.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
