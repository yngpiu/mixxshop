<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Quản lý sản phẩm - Mixxshop</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <style>
                    .table-container {
                        background-color: #fff;
                        border-radius: 8px;
                        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                        overflow: hidden;
                        margin-bottom: 2rem;
                    }
                    
                    .product-table {
                        width: 100%;
                        border-collapse: collapse;
                    }
                    
                    .product-table th {
                        background-color: #f8f9fa;
                        color: #495057;
                        font-weight: 600;
                        text-transform: uppercase;
                        font-size: 0.85rem;
                        padding: 15px;
                        text-align: left;
                        border-bottom: 2px solid #dee2e6;
                    }
                    
                    .product-table td {
                        padding: 15px;
                        vertical-align: middle;
                        border-bottom: 1px solid #e9ecef;
                    }
                    
                    .product-table tr:hover {
                        background-color: #f8f9fa;
                    }
                    
                    .product-id {
                        font-weight: 600;
                        color: #495057;
                    }
                    
                    .btn-action {
                        padding: 5px 15px;
                        border-radius: 4px;
                        margin-right: 5px;
                        border: none;
                        color: white !important;
                        text-decoration: none;
                        display: inline-block;
                        transition: all 0.3s;
                    }
                    
                    .btn-view {
                        background-color: #007bff;
                    }
                    
                    .btn-edit {
                        background-color: #6c757d;
                    }
                    
                    .btn-delete {
                        background-color: #dc3545;
                    }
                    
                    .btn-add {
                        background-color: #28a745;
                        color: white;
                        text-decoration: none;
                        padding: 8px 16px;
                        border-radius: 4px;
                        display: inline-block;
                        margin-bottom: 20px;
                        transition: all 0.3s;
                    }
                    
                    .btn-action:hover, .btn-add:hover {
                        opacity: 0.85;
                        color: white;
                    }
                    
                    .page-header {
                        background-color: #fff;
                        border-radius: 8px;
                        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
                        padding: 20px;
                        margin-bottom: 20px;
                    }
                    
                    .page-header h1 {
                        color: #343a40;
                        font-weight: 600;
                        margin-bottom: 5px;
                    }
                    
                    .product-count {
                        font-weight: normal;
                        color: #6c757d;
                        font-size: 1rem;
                    }
                    
                    .pagination {
                        margin-top: 20px;
                    }
                    
                    .pagination .page-link {
                        color: #3CB815;
                        border-radius: 4px;
                        margin: 0 3px;
                    }
                    
                    .pagination .page-item.active .page-link {
                        background-color: #3CB815;
                        border-color: #3CB815;
                        color: white;
                    }
                    
                    .pagination .page-link:hover:not(.active) {
                        background-color: #e9ecef;
                    }
                    
                    .pagination .page-item.disabled .page-link {
                        color: #6c757d;
                    }
                    
                    @media (max-width: 992px) {
                        .btn-action {
                            padding: 4px 10px;
                            font-size: 0.85rem;
                        }
                    }
                    
                    @media (max-width: 768px) {
                        .product-table {
                            display: block;
                            overflow-x: auto;
                        }
                    }
                </style>
            </head>

            <body class="sb-nav-fixed">
                <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
                    <!-- Navbar Brand-->
                    <a class="navbar-brand ps-3" href="/">Mixxshop</a>
                    <!-- Sidebar Toggle-->
                    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                            class="fas fa-bars"></i></button>
                    <!-- Navbar Search-->
                    <div
                        style="display: flex; justify-content: center; align-items: center; margin-top: 1.5%; margin-left: 33%;">
                        <p style="color: aliceblue;">Hi, ${currentUserLogin}</p>
                    </div>
                    <!-- Navbar-->

                </nav>
                <div id="layoutSidenav">
                    <div id="layoutSidenav_nav">
                        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                            <div class="sb-sidenav-menu">
                                <div class="nav">
                                    <div class="sb-sidenav-menu-heading">Cơ bản</div>
                                    <a class="nav-link" href="/adminDash">
                                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                        Dashboard
                                    </a>
                                    <a class="nav-link" href="/table/user">
                                        <div class="sb-nav-link-icon"><i class="fa-solid fa-users"></i></div>
                                        Quản lý người dùng
                                    </a>
                                    <a class="nav-link active" href="/adminProduct">
                                        <div class="sb-nav-link-icon"><i class="fa-brands fa-product-hunt"></i></div>
                                        Quản lý sản phẩm
                                    </a>
                                    <a class="nav-link" href="/adminOrder">
                                        <div class="sb-nav-link-icon"><i class="fa-regular fa-newspaper"></i></div>
                                        Quản lý đơn hàng
                                    </a>
                                    <!-- <div class="sb-sidenav-menu-heading">Interface</div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Layouts
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a> -->
                                    <!-- <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="layout-static.html">Static Navigation</a>
                                <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
                            </nav>
                        </div> -->
                                    <!-- <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages"
                            aria-expanded="false" aria-controls="collapsePages">
                            <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                            Pages
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a> -->
                                    <!-- <div class="collapse" id="collapsePages" aria-labelledby="headingTwo"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                    data-bs-target="#pagesCollapseAuth" aria-expanded="false"
                                    aria-controls="pagesCollapseAuth">
                                    Authentication
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne"
                                    data-bs-parent="#sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="login.html">Login</a>
                                        <a class="nav-link" href="register.html">Register</a>
                                        <a class="nav-link" href="password.html">Forgot Password</a>
                                    </nav>
                                </div>
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                    data-bs-target="#pagesCollapseError" aria-expanded="false"
                                    aria-controls="pagesCollapseError">
                                    Error
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne"
                                    data-bs-parent="#sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="401.html">401 Page</a>
                                        <a class="nav-link" href="404.html">404 Page</a>
                                        <a class="nav-link" href="500.html">500 Page</a>
                                    </nav>
                                </div>
                            </nav>
                        </div>
                        <div class="sb-sidenav-menu-heading">Addons</div>
                        <a class="nav-link" href="charts.html">
                            <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                            Charts
                        </a>
                        <a class="nav-link" href="tables.html">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                            Tables
                        </a> -->
                                </div>
                                <div class="nav">
                                    <div class="sb-sidenav-menu-heading">Khác</div>
                                    <a class="nav-link" href="/cmtCus">
                                        <div class="sb-nav-link-icon"><i class="fa-solid fa-house-user"></i></i></div>
                                        Phản hồi khách hàng
                                    </a>
                                </div>
                            </div>
                            <div class="sb-sidenav-footer">
                                <div class="small">Logged in as:</div>
                                Start Bootstrap
                            </div>
                        </nav>
                    </div>
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <div class="page-header">
                                    <h1>Quản lý sản phẩm</h1>
                                    <p class="product-count">Tổng số sản phẩm: ${products.size()}</p>
                                </div>

                                <a href="/create/product" class="btn-add">
                                    <i class="fas fa-plus"></i> Thêm sản phẩm mới
                                </a>

                                <div class="table-container">
                                    <table class="product-table">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Tên sản phẩm</th>
                                                <th>Hãng</th>
                                                <th>Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${products}" var="product">
                                                <tr>
                                                    <td class="product-id">${product.id}</td>
                                                    <td>${product.name}</td>
                                                    <td>${product.factory}</td>
                                                    <td>
                                                        <a href="/showDetail/${product.id}" class="btn-action btn-view">
                                                            <i class="fas fa-eye"></i> Xem
                                                        </a>
                                                        <a href="/editProduct/${product.id}" class="btn-action btn-edit">
                                                            <i class="fas fa-edit"></i> Sửa
                                                        </a>
                                                        <a href="/del/product/${product.id}" class="btn-action btn-delete">
                                                            <i class="fas fa-trash"></i> Xóa
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <nav aria-label="Page navigation">
                                    <ul class="pagination justify-content-center">
                                        <c:if test="${currentPages > 1}">
                                            <li class="page-item">
                                                <a class="page-link" href="/adminProduct?page=${currentPages-1}">Trước</a>
                                            </li>
                                        </c:if>
                                        
                                        <c:forEach begin="1" end="${totalPages}" var="i">
                                            <li class="page-item ${currentPages == i ? 'active' : ''}">
                                                <a class="page-link" href="/adminProduct?page=${i}">${i}</a>
                                            </li>
                                        </c:forEach>
                                        
                                        <c:if test="${currentPages < totalPages}">
                                            <li class="page-item">
                                                <a class="page-link" href="/adminProduct?page=${currentPages+1}">Sau</a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </nav>
                            </div>
                        </main>
                        <footer class="py-4 bg-light mt-auto">
                            <div class="container-fluid px-4">
                                <div class="d-flex align-items-center justify-content-between small">
                                    <div class="text-muted">Copyright &copy; Your Website 2023</div>
                                    <div>
                                        <a href="#">Privacy Policy</a>
                                        &middot;
                                        <a href="#">Terms &amp; Conditions</a>
                                    </div>
                                </div>
                            </div>
                        </footer>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/chart-area-demo.js"></script>
                <script src="/js/chart-bar-demo.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/datatables-simple-demo.js"></script>
            </body>

            </html>