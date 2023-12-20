<%--
  Created by IntelliJ IDEA.
  User: Yicunxinglang
  Date: 2023/12/18
  Time: 14:08
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
                    <h1 class="welcome-text">早上好，${userInfo.username} <span
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
                <!-- 检索部分 -->
                <!-- my-5 代表上下 外边距 距离my-5 -->
                <div class="row my-5">
                    <div class="col-8 offset-2">
                        <form method="get" class="form-check-inline" id="form1">
                            <label>用户名称:</label>
                            <input type="text" name="username" style="width: 200px;"
                                   class="form-check-inline form-control" value="${param.username}"/>
                            <label>用户类型:</label>
                            <select name="userType" class="form-select form-check-inline"
                                    style="width: 200px;" id="userTypeSelect">
                                <option selected>全部</option>
                                <option value="玩家" ${param.userType == '玩家' ? 'selected' : ''}>玩家
                                </option>
                                <option value="管理员" ${param.userType == '管理员' ? 'selected' : ''}>管理员
                                </option>
                            </select>
                            <button type="submit" class="btn btn-primary text-white">查询</button>
                        </form>
                    </div>
                </div>
                <!-- 列表部分 -->
                <div class="row">
                    <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title text-info">用户统计表</h4>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                        <tr>
                                            <th>用户名称</th>
                                            <th>密码</th>
                                            <th>邮箱</th>
                                            <th>性别</th>
                                            <th>注册时间</th>
                                            <th>用户类型</th>
                                            <th>用户个人短介</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="user" items="${back_userList}">
                                            <tr>
                                                <td class="py-1">
                                                        ${user.username}
                                                </td>
                                                <td>
                                                        ${user.password}
                                                </td>
                                                <td>
                                                        ${user.email}
                                                </td>
                                                <td>
                                                        ${user.gender}
                                                </td>
                                                <td>
                                                        ${user.registrationTime}
                                                </td>
                                                <td>
                                                        ${user.userType}
                                                </td>
                                                <td>
                                                        ${user.bio}
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
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
<script>
    function setSelectedOption() {
        const userType = '<%= request.getParameter("userType") %>';
        const selectElement = document.getElementById('userTypeSelect');

        for (let i = 0; i < selectElement.options.length; i++) {
            if (selectElement.options[i].value === userType) {
                selectElement.options[i].selected = true;
                break;
            }
        }
    }

    window.onload = function () {
        setSelectedOption();
    };
</script>
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

