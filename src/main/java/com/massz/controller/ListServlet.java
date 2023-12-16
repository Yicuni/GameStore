package com.massz.controller;

import com.massz.bean.Game;
import com.massz.service.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/back_gamelist")
public class ListServlet extends HttpServlet {
    private BookService bookService = new BookService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        List<Game> allGames;
        String title = req.getParameter("title");
        String type = req.getParameter("type");
        if (title == null && type == null) {
            allGames = bookService.getAllBooks();
        } else {
            allGames = bookService.getBooksByCond(title, type);
        }
        req.setAttribute("back_gameList", allGames);
        req.getRequestDispatcher("/back_gamelist.jsp").forward(req, resp);
    }
}
