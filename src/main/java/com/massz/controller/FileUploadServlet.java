package com.massz.controller;

import com.massz.bean.Game;
import com.massz.service.BookService;
import com.massz.util.FileUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/fileupload")
public class FileUploadServlet extends HttpServlet {

    private BookService bookService = new BookService();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        Game file = FileUtils.uploadFile(req, resp);
        if (file != null) {
            bookService.saveBookInfo(file);
            resp.sendRedirect(req.getContextPath() + "/back_gamelist");
        } else {
            resp.getWriter().write("图书上传失败");
        }
    }
}
