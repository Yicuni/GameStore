<%--
  Created by IntelliJ IDEA.
  User: Yicunxinglang
  Date: 2023/12/2
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <title>阿八西商城</title>

    <!-- Vendor css -->
    <link rel="stylesheet" href="vendors/@mdi/font/css/materialdesignicons.min.css">

    <!-- Base css with customised bootstrap included -->
    <link rel="stylesheet" href="css/miri-ui-kit-free.css">

    <!-- Stylesheet for demo page specific css -->
    <link rel="stylesheet" href="css/demo.css">
</head>
<style>
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

    .bg-gradient-black {
        background-image: -webkit-gradient(linear, left top, left bottom, from(#e4e5e7), to(#252631));
        background-image: linear-gradient(#FFFFFF, #FFFFFF);
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
                <a href="${pageContext.request.contextPath}/user_self_profile?username=${userInfo.username}&id=${getplayerid}"
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
    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
        <p class="text-danger" style="font-family: 好运藏在努力里;font-size: 25px;font-weight: bolder;">
            精选和推荐
        </p>
        <div class="carousel-inner" style="max-height: 625px;border-radius: 10px">
            <div class="carousel-item active">
                <c:forEach var="all" items="${allgames}" begin="0" end="0">
                    <a href="${pageContext.request.contextPath}/${path}/games" style="text-decoration: none">
                        <img src="${pageContext.request.contextPath}/file/${all.filename}"
                             style="width: 1110px;height: 625px;cursor: pointer" class="d-block w-100"
                             alt=""/>
                    </a>
                </c:forEach>
            </div>
            <c:forEach var="all" items="${allgames}" begin="1">
                <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/file/${all.filename}"
                         style="width: 1110px;height: 625px" class="d-block w-100"
                         alt=""/>
                </div>
            </c:forEach>
        </div>
        <button class="carousel-control-prev"
                style="background-color: #a1a3a6;border: 1px solid #ffffff;color: #ffffff;"
                type="button" data-target="#carouselExampleCaptions" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </button>
        <button class="carousel-control-next"
                style="background-color: #a1a3a6;border: 1px solid #ffffff;color: #ffffff;" type="button"
                data-target="#carouselExampleCaptions" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </button>
    </div>
    <div class="container" style="padding: 100px 0 0;">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="home-tab" data-toggle="tab" data-target="#新品与热门商品"
                        type="button"
                        role="tab" aria-controls="home" aria-selected="true">新品与热门商品
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="profile-tab" data-toggle="tab" data-target="#热销商品" type="button"
                        role="tab" aria-controls="profile" aria-selected="false">热销商品
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="contact-tab" data-toggle="tab" data-target="#即将推出" type="button"
                        role="tab" aria-controls="contact" aria-selected="false">即将推出
                </button>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <!--     新品与热门商品分割线 ！！！       -->
            <div class="tab-pane fade show active" id="新品与热门商品" role="tabpanel" aria-labelledby="profile-tab">
                <c:forEach var="hotnewgames" items="${hotnewgameslist}">
                    <div class="card mb-3">
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                <img src="${pageContext.request.contextPath}/file/${hotnewgames.filename}" alt="..."
                                     style="width: 338px;height: 188px">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body overflow-auto" style="max-height: 188px">
                                    <h3 class="card-title text-danger">
                                        <a href="${pageContext.request.contextPath}/detailpage?gameId=${hotnewgames.gameId}">${hotnewgames.title}</a>
                                    </h3>
                                    <div class="overflow-hidden">
                                        <p class="card-text">${hotnewgames.description}</p>
                                        <p class="card-text">${hotnewgames.price}</p>
                                        <p class="card-text">${hotnewgames.releaseDate}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!--     热销商品分割线 ！！！       -->
            <div class="tab-pane fade" id="热销商品" role="tabpanel" aria-labelledby="profile-tab">
                <c:forEach var="hotsale" items="${hotsalelist}">
                    <div class="card mb-3">
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                <img src="${pageContext.request.contextPath}/file/${hotsale.filename}" alt="..."
                                     style="width: 338px;height: 188px">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body overflow-auto" style="max-height: 188px">
                                    <h3 class="card-title text-danger">
                                        <a href="${pageContext.request.contextPath}/detailpage?gameId=${hotsale.gameId}">${hotsale.title}</a>
                                    </h3>
                                    <div class="overflow-hidden">
                                        <p class="card-text">${hotsale.description}</p>
                                        <p class="card-text">${hotsale.price}</p>
                                        <p class="card-text">${hotsale.releaseDate}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!--     即将推出分割线 ！！！       -->
            <div class="tab-pane fade" id="即将推出" role="tabpanel" aria-labelledby="contact-tab">
                <c:forEach var="upcominggames" items="${upcominggamelist}">
                    <div class="card mb-3">
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                <img src="${pageContext.request.contextPath}/file/${upcominggames.filename}" alt="..."
                                     style="width: 338px;height: 188px">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body overflow-auto" style="max-height: 188px">
                                    <h3 class="card-title text-danger">
                                            ${upcominggames.title}
                                    </h3>
                                    <div class="overflow-hidden">
                                        <p class="card-text">${upcominggames.description}</p>
                                        <p class="card-text">${upcominggames.price}</p>
                                        <p class="card-text">${upcominggames.releaseDate}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
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
