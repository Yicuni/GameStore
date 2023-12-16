package com.massz.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class Filter implements javax.servlet.Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("-----进入过滤器1------");
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        String[] whiteList = {"/vendors", "/css", "/fonts", "/scss",
                "/assets", "/file", "/front_login", "/front_login.jsp", "/bootstrap", "/images", "/js",
                "/front_register", "/front_register.jsp"};
        String requestURI = req.getRequestURI();
        System.out.println("requestURI" + requestURI);
        for (String whiteName : whiteList) {
            if (requestURI.contains(whiteName)) {
                filterChain.doFilter(servletRequest, servletResponse);
                return;
            }
        }
        HttpSession session = req.getSession();
        Object userInfo = session.getAttribute("userInfo");
        if (userInfo != null) {
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            resp.sendRedirect(req.getContextPath() + "/front_login.jsp");
        }
    }
}
