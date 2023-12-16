package com.massz.controller;

import com.massz.bean.Game;
import com.massz.bean.User;
import com.massz.service.GameService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/addlibrary")
public class Front_AddLibraryServlet extends HttpServlet {
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
        int gameId = Integer.valueOf(req.getParameter("gameId"));
        System.out.println(gameId);
        user = gameService.getPlayerByName(user.getUsername());
        System.out.println("我是player" + user);

        Game game = gameService.getGameById(gameId);

        System.out.println(game.getTitle());
        System.out.println(game.getDescription());
        System.out.println(game.getPrice());
        System.out.println(game);
        req.setAttribute("playerInfo", user);
        req.setAttribute("hngames", game);
        req.setAttribute("gameId", gameId);
        req.setAttribute("getplayerid", user.getUserId());
        if( gameService.addToLibrary(user.getUserId(), game.getGameId())){
            resp.sendRedirect(req.getContextPath() + "/user_self_profile?username=" + user.getUsername());
        } else {
            RequestDispatcher dispatcher = req.getRequestDispatcher("/game_detail_page.jsp");
            dispatcher.forward(req, resp);
        }
//        ${pageContext.request.contextPath}/user_self_profile?username=${playerInfo.username}
    }
}
