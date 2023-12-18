<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/11/30
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>阿八西商城后台 </title>
    <link rel="stylesheet" href="vendors/feather/feather.css">
    <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="vendors/typicons/typicons.css">
    <link rel="stylesheet" href="vendors/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="js/select.dataTables.min.css">
    <link rel="stylesheet" href="css/vertical-layout-light/style.css">
    <link rel="shortcut icon" href="images/favicon.png"/>
</head>
<style>
    .tips{
        color: red;
    }
</style>
<body>
<div class="container-scroller">
    <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
            <div class="me-3">
                <button class="navbar-toggler navbar-toggler align-self-center" type="button"
                        data-bs-toggle="minimize">
                    <span class="icon-menu"></span>
                </button>
            </div>
            <div>
                <a class="navbar-brand brand-logo" href="${pageContext.request.contextPath}/back_gamelist">
                    <img src="assets/images/logo.svg" alt="logo"/>
                </a>
                <a class="navbar-brand brand-logo-mini" href="${pageContext.request.contextPath}/back_gamelist">
                    <img src="images/logo-mini.svg" alt="logo"/>
                </a>
            </div>
        </div>
        <!-- 导航栏菜单区 -->
        <div class="navbar-menu-wrapper d-flex align-items-top">
            <!-- 左侧菜单 -->
            <ul class="navbar-nav">
                <li class="nav-item font-weight-semibold d-none d-lg-block ms-0">
                    <h1 class="welcome-text">早上好，${userInfo.username}  <span
                            class="text-black fw-bold" id="userType">${userInfo.userType}</span></h1>
                    <h3 class="welcome-sub-text">欢迎使用阿八西商城后台管理系统~~~ </h3>
                </li>
            </ul>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item d-none d-lg-block">
                    <div id="datepicker-popup" class="input-group date datepicker navbar-date-picker">
								<span class="input-group-addon input-group-prepend border-right">
									<span class="icon-calendar input-group-text calendar-icon"></span>
								</span>
                        <input type="text" class="form-control">
                    </div>
                </li>
                <li class="nav-item">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><i
                            class="dropdown-item-icon mdi mdi-power text-primary me-2"></i>退出登录</a>
                </li>
            </ul>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button"
                    data-bs-toggle="offcanvas">
                <span class="mdi mdi-menu"></span>
            </button>
        </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- 部分：设置面板 -->
        <div class="theme-setting-wrapper">
            <div id="settings-trigger"><i class="ti-settings"></i></div>
            <div id="theme-settings" class="settings-panel">
                <i class="settings-close ti-close"></i>
                <p class="settings-heading">侧边栏主题</p>
                <div class="sidebar-bg-options selected" id="sidebar-light-theme">
                    <div class="img-ss rounded-circle bg-light border me-3"></div>
                    浅色
                </div>
                <div class="sidebar-bg-options" id="sidebar-dark-theme">
                    <div class="img-ss rounded-circle bg-dark border me-3"></div>
                    深色
                </div>
                <p class="settings-heading mt-2">顶部栏主题</p>
                <div class="color-tiles mx-0 px-4">
                    <div class="tiles success"></div>
                    <div class="tiles warning"></div>
                    <div class="tiles danger"></div>
                    <div class="tiles info"></div>
                    <div class="tiles dark"></div>
                    <div class="tiles default"></div>
                </div>
            </div>
        </div>
        <!-- partial -->
        <!-- partial:../../partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
            <ul class="nav">
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" href="#">--%>
<%--                        <i class="mdi mdi-grid-large menu-icon"></i>--%>
<%--                        <span class="menu-title">概览</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
                <li class="nav-item nav-category">游戏</li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
                       aria-controls="ui-basic">
                        <i class="menu-icon mdi mdi-floor-plan"></i>
                        <span class="menu-title">游戏管理</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="ui-basic">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item">
                                <a class="nav-link"
                                   href="${pageContext.request.contextPath}/back_gamelist">游戏统计</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="collapse" href="#game-add" aria-expanded="false"
                       aria-controls="ui-basic">
                        <i class="menu-icon mdi mdi-arrange-bring-to-front"></i>
                        <span class="menu-title">游戏增加</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="game-add">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item">
                                <a class="nav-link"
                                   href="${pageContext.request.contextPath}/back_gameadd.jsp">游戏添加</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="collapse" href="#game-upd" aria-expanded="false"
                       aria-controls="ui-basic">
                        <i class="menu-icon mdi mdi-arrange-bring-forward"></i>
                        <span class="menu-title">游戏更改</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="game-upd">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item">
                                <a class="nav-link"
                                   href="${pageContext.request.contextPath}/back_gameedit.jsp">游戏修改</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item nav-category">玩家和用户</li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="collapse" href="#form-elements" aria-expanded="false"
                       aria-controls="form-elements">
                        <i class="menu-icon mdi mdi-card-text-outline"></i>
                        <span class="menu-title">用户概览</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="form-elements">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item">
                                <a class="nav-link"
                                   href="${pageContext.request.contextPath}/all_users">用户查询</a>
                            </li>
                        </ul>
                    </div>
                </li>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" data-bs-toggle="collapse" href="#charts" aria-expanded="false"--%>
<%--                       aria-controls="charts">--%>
<%--                        <i class="menu-icon mdi mdi-chart-line"></i>--%>
<%--                        <span class="menu-title">玩家用户管理</span>--%>
<%--                        <i class="menu-arrow"></i>--%>
<%--                    </a>--%>
<%--                    <div class="collapse" id="charts">--%>
<%--                        <ul class="nav flex-column sub-menu">--%>
<%--                            <li class="nav-item">--%>
<%--                                <a class="nav-link"--%>
<%--                                   href="${pageContext.request.contextPath}/back_playeradd">玩家用户管理</a>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                </li>--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" data-bs-toggle="collapse" href="#tables" aria-expanded="false"--%>
<%--                       aria-controls="tables">--%>
<%--                        <i class="menu-icon mdi mdi-table"></i>--%>
<%--                        <span class="menu-title">玩家用户修改</span>--%>
<%--                        <i class="menu-arrow"></i>--%>
<%--                    </a>--%>
<%--                    <div class="collapse" id="tables">--%>
<%--                        <ul class="nav flex-column sub-menu">--%>
<%--                            <li class="nav-item">--%>
<%--                                <a class="nav-link"--%>
<%--                                   href="${pageContext.request.contextPath}/back_playerupd">玩家用户修改</a>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                </li>--%>
                <li class="nav-item nav-category">管理员管理</li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="collapse" href="#admin" aria-expanded="false"
                       aria-controls="form-elements">
                        <i class="menu-icon mdi mdi-card-text-outline"></i>
                        <span class="menu-title">管理员新增</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="admin">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item">
                                <a class="nav-link"
                                   href="${pageContext.request.contextPath}/back_register.jsp">管理员新增</a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-md-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">新增一个小小管理员~</h4>
                                <p class="card-description">
                                    请开始您的操作吧~
                                </p>
                                <form class="forms-sample" method="post"
                                      action="${pageContext.request.contextPath}/back_register">
                                    <div class="form-group">
                                        <label>管理员名称：</label>
                                        <input type="text" class="form-control" name="username"
                                               placeholder="请输入新进管理员名~" required/><br/>
                                        <span class="tips">${requestScope.usernameError}</span>
                                    </div>
                                    <div class="form-group">
                                        <label>密码</label>
                                        <input type="password" class="form-control" name="password"
                                               placeholder="请输入密码~" required/>
                                    </div>
                                    <div class="form-group">
                                        <label>邮箱地址</label>
                                        <input type="email" class="form-control" name="email"
                                               placeholder="请输入邮箱地址~" required/>
                                    </div>
                                    <div class="form-group">
                                        <label>个人信息</label>
                                        <input type="text" class="form-control" name="Bio"
                                               placeholder="请输入个人信息~" required/>
                                    </div>
                                    <div class="form-group">
                                        <label>性别：</label>
                                        <select name="gender" id="gender" class="form-select form-check-inline"
                                                style="width: 200px;">
                                            <option value="male" selected>male</option>
                                            <option value="female">female</option>
                                            <option value="unknown">unknown</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="userType">创建用户的类型为：</label>
                                        <select name="userType">
                                            <option value="管理员">管理员</option>
                                        </select>
                                    </div>
                                    <div class="row">
                                        <div class="col-3">
                                            <button type="submit" class="btn btn-primary">注册吧~</button>
                                        </div>
                                    </div>
                                </form>
                                <span class="tips">${requestScope.registrationError}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer">
                <div class="d-sm-flex justify-content-center justify-content-sm-between">
                    <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">探索无尽的游戏世界，尽在 <a
                            href="#" target="_blank">游戏狂热商城</a>，激发您的游戏激情。</span>
                    <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">保持更新，不错过任何独特的游戏体验！&nbsp;© 2023。保留所有权利。</span>
                </div>
            </footer>
        </div>
    </div>
</div>

<%--<script>--%>
<%--    // 获取用户类型的元素--%>
<%--    var userTypeElement = document.getElementById('userType');--%>

<%--    // 判断用户类型是否为0，如果是则修改内容为管理员--%>
<%--    if ('${userInfo.userType}' === '0') {--%>
<%--        userTypeElement.textContent = '管理员';--%>
<%--    }--%>
<%--</script>--%>
<script src="vendors/js/vendor.bundle.base.js"></script>
<script src="vendors/chart.js/Chart.min.js"></script>
<script src="vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script src="vendors/progressbar.js/progressbar.min.js"></script>
<script src="js/off-canvas.js"></script>
<script src="js/hoverable-collapse.js"></script>
<script src="js/template.js"></script>
<script src="js/settings.js"></script>
<script src="js/todolist.js"></script>
<script src="js/dashboard.js"></script>
<script src="js/Chart.roundedBarCharts.js"></script>
</body>
</html>
