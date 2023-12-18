package com.massz.controller;

import com.massz.bean.Game;
import com.massz.service.GameService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/search")
public class SearchGameServlet extends HttpServlet {
    GameService gameService = new GameService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        String searchTerm = req.getParameter("searchTerm");
        List<Game> games = gameService.searchGamesByName(searchTerm);
        req.setAttribute("searched_games", games);
        req.getRequestDispatcher("/game_search_page.jsp").forward(req, resp);
    }
}
