package com.massz.controller;

import com.massz.bean.Game;
import com.massz.bean.User;
import com.massz.service.GameService;
import com.massz.util.FileUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/updateGame")
public class Back_UpdateGameServlet extends HttpServlet {
    private GameService gameService = new GameService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        // 获取表单提交的游戏信息
        int gameId = Integer.parseInt(req.getParameter("gameId"));
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        double price = Double.parseDouble(req.getParameter("price"));
        int salenum = Integer.parseInt(req.getParameter("saleNum"));
        String releasedate = req.getParameter("releaseDate");
        String type = req.getParameter("type");
//        String filename = req.getParameter("filename");

        Game game = new Game();
        game.setGameId(gameId);
        game.setTitle(title);
        game.setDescription(description);
        game.setPrice(price);
        game.setSaleNum(salenum);
        game.setReleaseDate(Date.valueOf(releasedate));
        game.setType(type);
//        game.setFilename(filename);

        if (gameService.updateGame(game)) {
            //更新成功
            resp.sendRedirect(req.getContextPath() + "/back_gamelist");
        } else {
            resp.getWriter().println("更新游戏失效");
        }
    }
}
