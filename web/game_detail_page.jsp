<%--
  Created by IntelliJ IDEA.
  User: Yicunxinglang
  Date: 2023/12/5
  Time: 23:27
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
    <title>Miri UI Kit - Profile</title>

    <!-- Vendor css -->
    <link rel="stylesheet" href="vendors/@mdi/font/css/materialdesignicons.min.css">

    <!-- Base css with customised bootstrap included -->
    <link rel="stylesheet" href="css/miri-ui-kit-free.css">

    <!-- Stylesheet for demo page specific css -->
    <link rel="stylesheet" href="css/demo.css">
</head>
<body>
<header class="miri-ui-kit-header header-navbar-only header-bg-2">
    <nav class="navbar navbar-expand-lg navbar-dark bg-transparent fixed-on-scroll">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/games">
            <img src="assets/images/logo.svg" alt="logo" style="width: 99px;height: 30px">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#miriUiKitNavbar"
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
                <a href="${pageContext.request.contextPath}/user_self_profile?username=${playerInfo.username}"
                   class="text-info"
                   style="font-size: 18px;margin-right: 50px">看！那是飞机！那是${playerInfo.username}！</a>
                <a href="${pageContext.request.contextPath}/logout" class="text-danger"
                   style="font-size: 18px;margin-right: 50px">退出登录？</a>
            </ul>
            <ul class="navbar-nav my-lg-auto">
                <form class="form-inline my-2 my-lg-0" action="index.html">
                    <input class="form-control mr-sm-2" type="search" placeholder="搜索喜欢的游戏吧~"
                           aria-label="Search">
                    <button class="btn btn-success" type="submit">搜索</button>
                </form>
            </ul>
        </div>
    </nav>
</header>
<div class="container">
    <!-- 导航栏 -->
    <%--    <nav class="navbar navbar-expand-lg navbar-light bg-light">--%>
    <%--        <a class="navbar-brand" href="#">Steam</a>--%>
    <%--        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"--%>
    <%--                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">--%>
    <%--            <span class="navbar-toggler-icon"></span>--%>
    <%--        </button>--%>
    <%--        <div class="collapse navbar-collapse" id="navbarNav">--%>
    <%--            <ul class="navbar-nav">--%>
    <%--                <li class="nav-item active">--%>
    <%--                    <a class="nav-link" href="#">首页 <span class="sr-only">(current)</span></a>--%>
    <%--                </li>--%>
    <%--                <li class="nav-item">--%>
    <%--                    <a class="nav-link" href="#">游戏</a>--%>
    <%--                </li>--%>
    <%--                <li class="nav-item">--%>
    <%--                    <a class="nav-link" href="#">关于</a>--%>
    <%--                </li>--%>
    <%--            </ul>--%>
    <%--        </div>--%>
    <%--    </nav>--%>

    <!-- 游戏封面区域 -->
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-6">
                <img src="${pageContext.request.contextPath}/file/${hngames.filename}" class="img-fluid" alt="游戏封面">
            </div>
            <div class="col-md-6">
                <div class="container-fluid">
                    <h2 class="mt-1">${hngames.title}</h2>
                    <p class="mt-3">游戏类型：${hngames.type}</p>
                    <p class="mt-3">发布日期：${hngames.releaseDate}</p>
                    <p class="mt-3">标签：生存、动作</p>
                    <p class="mt-3">评分：暂无</p>
                    <a href="${pageContext.request.contextPath}/addlibrary?gameId=${hngames.gameId}&playerId=${getplayerid}" class="btn btn-primary text-white mt-3" style="text-decoration: none">立刻购买！</a>
                </div>
            </div>
        </div>
    </div>

    <!-- 游戏描述区域 -->
    <div class="container mt-4">
        <h3>游戏描述</h3>
        <p>${hngames.description}</p>
        <p>主要特点：</p>
        <ul>
            <li>好玩</li>
            <li>有趣</li>
        </ul>
    </div>

    <!-- 评论区域 -->
    <%--    <div class="container mt-4">--%>
    <%--        <h3>玩家评论</h3>--%>
    <%--        <div class="media">--%>
    <%--            <img src="user-avatar.jpg" class="mr-3" alt="用户头像">--%>
    <%--            <div class="media-body">--%>
    <%--                <h5 class="mt-0">玩家1</h5>--%>
    <%--                <p>这是一个很棒的游戏，画面精美，玩法有趣。</p>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--        <div class="media mt-4">--%>
    <%--            <img src="user-avatar.jpg" class="mr-3" alt="用户头像">--%>
    <%--            <div class="media-body">--%>
    <%--                <h5 class="mt-0">玩家2</h5>--%>
    <%--                <p>游戏的叙事非常吸引人，值得一玩。</p>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>
</div>
<footer>
    <div class="container">
        <nav class="navbar navbar-light bg-transparent navbar-expand footer-navbar d-block d-sm-flex text-center">
            <span class="navbar-text">&copy; BootstrapDash. All rights reserved.</span>
            <div class="navbar-nav ml-auto justify-content-center">
                <a href="#" class="nav-link">Support</a>
                <a href="#" class="nav-link">Terms</a>
                <a href="#" class="nav-link">Privacy</a>
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
