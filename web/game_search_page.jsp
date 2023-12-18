<%--
  Created by IntelliJ IDEA.
  User: Yicunxinglang
  Date: 2023/12/18
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <title>阿八西商城 - 尽情搜索</title>

    <!-- Vendor css -->
    <link rel="stylesheet" href="vendors/@mdi/font/css/materialdesignicons.min.css">

    <!-- Base css with customised bootstrap included -->
    <link rel="stylesheet" href="css/miri-ui-kit-free.css">

    <!-- Stylesheet for demo page specific css -->
    <link rel="stylesheet" href="css/demo.css">
</head>
<style>
    .transparent-gray-background {
        border-radius: 5px;
        background: linear-gradient(rgba(192, 192, 192, 0.8), rgba(192, 192, 192, 0.5));
    }

    body, p, ul, ol, dl, dt, h1, h2, h3, h4, h5, h6 {
        margin: 0;
        padding: 0;
    }

    ul, ol {
        list-style: none;
    }

    input {
        border: none;
        outline: none;
    }

    a {
        text-decoration: none;
    }

    .title-hover:hover {
        color: #0abfe6;
    }

    .bg-gradient-black {
        /*background-image: -webkit-gradient(linear, left top, left bottom, from(#e4e5e7), to(#999999));*/
        background-image: linear-gradient(#ffffff, #ffffff);
    }

    body {
        font-size: 16px;
    }
</style>
<body class="bg-gradient-black">
<header class="miri-ui-kit-header">
    <nav class="navbar navbar-expand-lg navbar-dark bg-transparent fixed-on-scroll">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/games">
            <img src="assets/images/logo.svg" style="width: 99px;height: 30px">
        </a>
        <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#miriUiKitNavbar"
                aria-controls="navbarSupportedContent2" aria-expanded="false" aria-label="Toggle navigation">
            <span class="mdi mdi-menu"></span>
        </button>
        <div class="collapse navbar-collapse" id="miriUiKitNavbar">
            <ul class="navbar-nav m-lg-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/games">您的商店</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/allgameslist">全部商品</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">新鲜推荐</a>
                    <div class="dropdown-menu">
                        <p class="font-weight-bolder" style="color: #0a58ca; margin-left: 10px">最热门</p>
                        <a href="#" class="dropdown-item">热销商品</a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item">热销新品</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">类别</a>
                    <div class="dropdown-menu">
                        <p class="font-weight-bolder" style="color: #0a58ca; margin-left: 10px">类型</p>
                        <a href="#" class="dropdown-item">开放世界</a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item">角色扮演</a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item">体育与竞速</a>
                    </div>
                </li>
            </ul>
            <ul class="navbar-nav my-lg-auto">
                <a href="${pageContext.request.contextPath}/user_self_profile?username=${userInfo.username}"
                   class="text-info"
                   style="font-size: 18px;margin-right: 50px">看！那是飞机！那是${userInfo.username}！</a>
                <a href="${pageContext.request.contextPath}/logout" class="text-danger"
                   style="font-size: 18px;margin-right: 50px">退出登录？</a>
            </ul>
            <ul class="navbar-nav my-lg-auto">
                <form method="get" class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/search">
                    <input class="form-control mr-sm-2" type="search" placeholder="搜索喜欢的游戏吧~"
                           aria-label="Search" name="searchTerm" required>
                    <button class="btn btn-success" type="submit">搜索</button>
                </form>
            </ul>
        </div>
    </nav>
    <div class="miri-ui-kit-header-content text-center text-white d-flex flex-column justify-content-center align-items-center">
        <img src="images/images/logo_icon.svg" alt="logo" height="78" width="78" class="mb-4">
        <h1 class="display-3 text-white">阿八西商城</h1>
        <p class="h3 font-weight-light text-white">欢迎光临阿八西商城，尽享精选好货，畅享优质购物体验！</p>
        <p class="py-3">
            <a href="#demo-content" class="btn btn-primary">开始探索阿八西商城</a>
        </p>
    </div>
</header>
<div class="container content-wrapper overflow-hidden" id="demo-content">
    <div class="container" style="padding: 0;">
        <c:if test="${not empty searched_games}">
            <h2 style="font-family: 好运藏在努力里">搜索页面</h2>
            <h4 style="font-family: 好运藏在努力里">当前页面搜索结果：</h4>
            <c:forEach var="s_games" items="${searched_games}" varStatus="status">
                <div class="d-flex mb-3 transparent-gray-background">
                    <div class="p-2 text-danger" style="margin-left: 10px;width: 31.19px;">
                        <p style="padding-top: 35px">${status.index + 1}</p>
                    </div>
                    <div class="p-2">
                        <img src="${pageContext.request.contextPath}/file/${s_games.filename}" alt="..."
                             style="width: 169px;height: 94px;padding-left: 20px">
                    </div>
                    <div class="p-2" style="font-family: 'Roboto Light';max-width: 800px;max-height: 110px;">
                        <a href="#" class="text-danger" style="text-decoration: none">
                            <a href="${pageContext.request.contextPath}/detailpage?gameId=${s_games.gameId}">${s_games.title}</a>
                        </a><br/><br/>
                        <span class="text-dark"
                              style="font-size: 16px;font-family: 好运藏在努力里">${s_games.description}</span>
                    </div>
                    <div class="ml-auto p-2"><br/><br/>$${s_games.price}</div>
                </div>
            </c:forEach>
        </c:if>
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
<script src="js/miri-ui-kit.js"></script>
</body>
</html>

