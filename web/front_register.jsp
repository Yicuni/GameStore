<%--
  Created by IntelliJ IDEA.
  User: Yicunxinglang
  Date: 2023/12/3
  Time: 23:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <title>阿八西商城 - 注册</title>

    <!-- Vendor css -->
    <link rel="stylesheet" href="vendors/@mdi/font/css/materialdesignicons.min.css">

    <!-- Base css with customised bootstrap included -->
    <link rel="stylesheet" href="css/miri-ui-kit-free.css">

    <!-- Stylesheet for demo page specific css -->
    <link rel="stylesheet" href="css/demo.css">
</head>
<style>
    .tips {
        font-size: 14px;
        color: red;
    }
</style>
<body class="login-page">
<header class="miri-ui-kit-header header-no-bg-img header-navbar-only">
    <nav class="navbar navbar-expand-lg navbar-dark bg-transparent">
        <div class="container">
            <a class="navbar-brand" href="index.html"><img src="assets/images/logo.svg" alt="logo"
                                                           style="width: 99px;height: 30px"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#miriUiKitNavbar"
                    aria-controls="navbarSupportedContent2" aria-expanded="false" aria-label="Toggle navigation">
                <span class="mdi mdi-menu"></span>
            </button>

            <div class="collapse navbar-collapse" id="miriUiKitNavbar">
                <div class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="mdi mdi-page-layout-body"></i>注册页面改进建议</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-icon icon-fb" href="#"><i class="mdi mdi-qqchat"></i></a>
                        <a class="nav-link nav-icon icon-twitter" href="#"><i class="mdi mdi-wechat"></i></a>
                    </li>
                </div>
            </div>
        </div>
    </nav>
</header>
<div class="card login-card" style="width: 30rem;height: 40rem; border-radius: 30px;">
    <div class="card-body">
        <h3 class="text-center text-white font-weight-light mb-4">请注册</h3>
        <form method="post" action="${pageContext.request.contextPath}/front_register">
            <div class="form-group">
                <input type="text" placeholder="账号" class="form-control" name="username" id="uname" required/>
                <span class="tips">${requestScope.usernameError}</span>
            </div>
            <div class="form-group">
                <input type="password" placeholder="密码" class="form-control" name="password" required/>
            </div>
            <div class="form-group">
                <input type="datetime-local" class="form-control" name="registrationTime" id="regist" required/>
            </div>
            <div class="form-group">
                <input type="text" placeholder="自我介绍" class="form-control" name="Bio" id="selfspeech" required/>
            </div>
            <div class="form-group">
                <input type="email" placeholder="邮箱" class="form-control" name="email" id="email" required/>
            </div>
            <div class="form-group">
                <select name="gender" id="gender" class="form-select form-check-inline form-control" placeholder="性别">
                    <option value="male" selected>male</option>
                    <option value="female">female</option>
                    <option value="unknown">unknown</option>
                </select>
            </div>
            <input type="submit" value="注册" class="btn btn-danger btn-block mb-3">
            <div class="row">
                <div class="col-9" style="margin-left: 20px">
                    <p class="text-end text-white">已有账号？去<a
                            href="${pageContext.request.contextPath}/front_login.jsp" class="text-warning">登录</a></p>
                </div>
            </div>
            <span class="tips">${requestScope.registrationError}</span>
        </form>
    </div>
</div>
<footer>
    <div class="container">
        <nav class="navbar navbar-dark bg-transparent navbar-expand d-block d-sm-flex text-center">
            <span class="navbar-text text-info">发现全新游戏世界，尽在 <a
                    href="#" class="text-warning" target="_blank">阿八西商城</a>，释放你的游戏激情。</span>
            <div class="navbar-nav ml-auto justify-content-center">
                <a href="#" class="nav-link text-info">客服支持</a>
                <a href="#" class="nav-link text-info">服务条款</a>
                <a href="#" class="nav-link text-info">隐私政策</a>
            </div>
        </nav>
    </div>
</footer>
<script src="vendors/jquery/dist/jquery.min.js"></script>
<script src="vendors/popper.js/dist/umd/popper.min.js"></script>
<script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>
