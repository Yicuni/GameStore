<%--
  Created by IntelliJ IDEA.
  User: Yicunxinglang
  Date: 2023/12/5
  Time: 22:18
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
                <a href="${pageContext.request.contextPath}/user_self_profile?username=${userInfo.username}"
                   class="text-info"
                   style="font-size: 18px;margin-right: 50px">看！那是飞机！那是${userInfo.username}！</a>
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
    <section class="Profile-header text-center">
        <div>
            <h4 class="text-info">${userInfo.username}</h4>
        </div>
        <p class="text-muted">地球村 坐标点 17,59,20,40  加入日期：
            ${RegistrationTime}
        </p>
        <p class="profile-intro text-primary" style="font-size: 16px"><span class="text-info">个性签名：</span>
            ${Bio}
        </p>
        <p class="profile-stats text-center"><span class="h4 mr-1">622</span> 个亲密无间的游戏基友<span
                class="h4 mr-1 ml-4">42</span> 张游戏截图<span class="h4 mr-1 ml-4">18</span> 条好友亲切的问候</p>
    </section>
    <section class="profile-details mb-4 pb-4">
        <div class="row">
            <div class="col-md-12 sidebar">
                <h5 class="sidebar-title text-warning mb-5" style="text-align: center">
                    您就是大名鼎鼎的游戏收藏家！！！快看看您的成就与收藏吧！</h5>
                <div class="portfolio-row">
                    <c:forEach var="gameimg" items="${all}" begin="0" end="2">
                        <div class="portfolio-item" style="width: 338px;height: 188px;margin-left: 25px">
<%--                            <input type="text" name="gameId" value="${gameimg.gameId}">--%>
                            <img src="${pageContext.request.contextPath}/file/${gameimg.filename}" alt="..."/>
                        </div>
                    </c:forEach>
                </div>
                <div class="portfolio-row">
                    <c:forEach var="gameimg" items="${all}" begin="3" end="5">
                        <div class="portfolio-item" style="width: 338px;height: 188px;margin-left: 25px">
                            <img src="${pageContext.request.contextPath}/file/${gameimg.filename}" alt="..."/>
                        </div>
                    </c:forEach>
                </div>
                <div class="portfolio-row">
                    <c:forEach var="gameimg" items="${all}" begin="6" end="8">
                        <div class="portfolio-item" style="width: 338px;height: 188px;margin-left: 25px">
                            <img src="${pageContext.request.contextPath}/file/${gameimg.filename}" alt="..."/>
                        </div>
                    </c:forEach>
                </div>
                <div class="portfolio-row">
                    <c:forEach var="gameimg" items="${all}" begin="9" end="11">
                        <div class="portfolio-item" style="width: 338px;height: 188px;margin-left: 25px">
                            <img src="${pageContext.request.contextPath}/file/${gameimg.filename}" alt="..."/>
                        </div>
                    </c:forEach>
                </div>
                <div class="portfolio-row">
                    <c:forEach var="gameimg" items="${all}" begin="12" end="14">
                        <div class="portfolio-item" style="width: 338px;height: 188px;margin-left: 25px">
                            <img src="${pageContext.request.contextPath}/file/${gameimg.filename}" alt="..."/>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>
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
