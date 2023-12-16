package com.massz.controller;

import com.massz.bean.Game;
import com.massz.service.GameService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleted")
public class Back_DeleteByIdServlet extends HttpServlet {
    private GameService gameService = new GameService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        // 获取要删除的图书的ID
        int gameId = Integer.parseInt(req.getParameter("gameId"));

        Game game = new Game();
        game.setGameId(gameId);

        if (gameService.deleteGame(game)) {
            // 成功删除后，重定向到显示图书列表的页面
            resp.sendRedirect(req.getContextPath() + "/back_gamelist");
        } else {
            // 删除失败时，跳转到错误页面或其他处理方式
            resp.getWriter().println("Error deleting game");
        }
    }
}
