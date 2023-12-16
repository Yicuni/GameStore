package com.massz.controller;

import com.massz.bean.Game;
import com.massz.bean.User;
import com.massz.service.GameService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/user_self_profile")
public class Front_SelfProfilerServlet extends HttpServlet {
    private GameService gameService = new GameService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("userInfo");

        List<Game> gameslist;
        user = gameService.getPlayerByName(user.getUsername());
        gameslist = gameService.getOwnedGames(user.getUserId());
        System.out.println("获取到的RegistrationTime：" + user.getRegistrationTime());
        System.out.println("获取到当前的Bio：" + user.getBio());
        req.setAttribute("Bio", user.getBio());
        req.setAttribute("RegistrationTime", user.getRegistrationTime());
        req.setAttribute("all", gameslist);
        req.getRequestDispatcher("/user_self_page.jsp").forward(req, resp);
    }
}
