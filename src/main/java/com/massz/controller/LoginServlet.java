package com.massz.controller;

import com.massz.bean.User;
import com.massz.service.GameService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/front_login")
public class LoginServlet extends HttpServlet {
    private GameService gameService = new GameService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        //获取前端传递的参数
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String userType = req.getParameter("userType");
        String rm = req.getParameter("rm");
        HttpSession session = req.getSession();
        System.out.println("是否记住密码：" + rm);
        System.out.println("用户名：" + username + ",密码：" + password);

        User u = gameService.checkPlayer(username, password, userType);

        // 处理登录结果
        if (u != null) {
            // 登录成功
            if (userType.equals("玩家")) {
                //此时校验通过，跳转到列表页面
                User user = new User();
                user.setUsername(username);
                user.setPassword(password);
                user.setUserType(userType);
                session.setAttribute("userInfo", user);

                if ("on".equals(rm)) {
                    //记住密码
                    Cookie c1 = new Cookie("username", username);
                    c1.setPath(req.getContextPath());
                    c1.setMaxAge(3600);

                    Cookie c2 = new Cookie("password", password);
                    c2.setPath(req.getContextPath());
                    c2.setMaxAge(3600);

                    resp.addCookie(c1);
                    resp.addCookie(c2);
                } else {
                    Cookie[] cookies = req.getCookies();
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("username") || cookie.getName().equals("password")) {
                            cookie.setMaxAge(0);
                            resp.addCookie(cookie);
                        }
                    }
                }
                // 玩家类型，跳转到前台首页
                resp.sendRedirect(req.getContextPath() + "/games");
            } else if (userType.equals("管理员")) {
                //此时校验通过，跳转到列表页面
                User user = new User();
                user.setUsername(username);
                user.setPassword(password);
                user.setUserType(userType);
                session.setAttribute("userInfo", user);

                if ("on".equals(rm)) {
                    //记住密码
                    Cookie c1 = new Cookie("username", username);
                    c1.setPath(req.getContextPath());
                    c1.setMaxAge(3600);

                    Cookie c2 = new Cookie("password", password);
                    c2.setPath(req.getContextPath());
                    c2.setMaxAge(3600);

                    resp.addCookie(c1);
                    resp.addCookie(c2);
                } else {
                    Cookie[] cookies = req.getCookies();
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("username") || cookie.getName().equals("password")) {
                            cookie.setMaxAge(0);
                            resp.addCookie(cookie);
                        }
                    }
                }
                // 管理员类型，跳转到后台首页
                resp.sendRedirect(req.getContextPath() + "/back_gamelist");
            }
        } else {
            // 登录失败
            req.setAttribute("errMsg", "无效的用户名或密码。请重试。");
            req.getRequestDispatcher("/front_login.jsp").forward(req, resp);
        }
    }
}
