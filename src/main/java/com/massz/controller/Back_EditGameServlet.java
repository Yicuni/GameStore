package com.massz.controller;

import com.massz.bean.Game;
import com.massz.service.GameService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editGame")
public class Back_EditGameServlet extends HttpServlet {
    private GameService gameService = new GameService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        // 获取要修改的游戏的ID
        int gameId = Integer.parseInt(req.getParameter("gameId"));

        Game game = gameService.getGameById(gameId);

        req.setAttribute("game", game);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/back_gameedit.jsp?gameId=" + game.getGameId());
        dispatcher.forward(req, resp);
    }
}
