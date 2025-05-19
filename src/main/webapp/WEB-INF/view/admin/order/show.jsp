<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="" />
                    <meta name="author" content="" />
                    <title>Quản lý đơn hàng - Mixxshop</title>
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
                        
                        .order-table {
                            width: 100%;
                            border-collapse: collapse;
                        }
                        
                        .order-table th {
                            background-color: #f8f9fa;
                            color: #495057;
                            font-weight: 600;
                            text-transform: uppercase;
                            font-size: 0.85rem;
                            padding: 15px;
                            text-align: left;
                            border-bottom: 2px solid #dee2e6;
                        }
                        
                        .order-table td {
                            padding: 15px;
                            vertical-align: middle;
                            border-bottom: 1px solid #e9ecef;
                        }
                        
                        .order-table tr:hover {
                            background-color: #f8f9fa;
                        }
                        
                        .order-id {
                            font-weight: 600;
                            color: #495057;
                        }
                        
                        .status-badge {
                            padding: 6px 12px;
                            border-radius: 50px;
                            font-size: 0.8rem;
                            font-weight: 600;
                            display: inline-block;
                            text-align: center;
                        }
                        
                        .status-pending {
                            background-color: #fff3cd;
                            color: #856404;
                        }
                        
                        .status-delivering {
                            background-color: #cce5ff;
                            color: #004085;
                        }
                        
                        .status-finish {
                            background-color: #d4edda;
                            color: #155724;
                        }
                        
                        .btn-action {
                            padding: 5px 15px;
                            border-radius: 4px;
                            margin-right: 5px;
                            border: none;
                            color: white;
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
                        
                        .btn-action:hover {
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
                        
                        .order-count {
                            font-weight: normal;
                            color: #6c757d;
                            font-size: 1rem;
                        }
                        
                        /* Pagination styling - Updated to green theme */
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
                        
                        /* Mobile responsive */
                        @media (max-width: 992px) {
                            .btn-action {
                                padding: 4px 10px;
                                font-size: 0.85rem;
                            }
                        }
                        
                        @media (max-width: 768px) {
                            .order-table {
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
                        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"
                            href="#!"><i class="fas fa-bars"></i></button>
                        <!-- Navbar Search-->
                        <div class="d-flex align-items-center ms-auto me-3">
                            <p class="text-light mb-0">Hi, ${currentUserLogin}</p>
                        </div>
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
                                        <a class="nav-link" href="/adminProduct">
                                            <div class="sb-nav-link-icon"><i class="fa-brands fa-product-hunt"></i>
                                            </div>
                                            Quản lý sản phẩm
                                        </a>
                                        <a class="nav-link active" href="/adminOrder">
                                            <div class="sb-nav-link-icon"><i class="fa-regular fa-newspaper"></i></div>
                                            Quản lý đơn hàng
                                        </a>
                                    </div>
                                    <div class="nav">
                                        <div class="sb-sidenav-menu-heading">Khác</div>
                                        <a class="nav-link" href="/cmtCus">
                                            <div class="sb-nav-link-icon"><i class="fa-solid fa-house-user"></i></i>
                                            </div>
                                            Phản hồi khách hàng
                                        </a>
                                    </div>
                                </div>
                                <div class="sb-sidenav-footer">
                                    <div class="small">Đăng nhập với:</div>
                                    Admin
                                </div>
                            </nav>
                        </div>
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <div class="page-header">
                                        <h1 class="mt-2">Quản lý đơn hàng <span class="order-count">(${oders.size()} đơn hàng)</span></h1>
                                        <ol class="breadcrumb mb-0">
                                            <li class="breadcrumb-item"><a href="/adminDash">Dashboard</a></li>
                                            <li class="breadcrumb-item active">Đơn hàng</li>
                                        </ol>
                                    </div>

                                    <div class="table-container">
                                        <table class="order-table">
                                            <thead>
                                                <tr>
                                                    <th>Mã đơn</th>
                                                    <th>Khách hàng</th>
                                                    <th>Tổng giá trị</th>
                                                    <th>Trạng thái</th>
                                                    <th>Thao tác</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${oders}" var="oder">
                                                    <tr>
                                                        <td><span class="order-id">#${oder.id}</span></td>
                                                        <td>${oder.receiverName}</td>
                                                        <td><fmt:formatNumber type="number" value="${oder.totalPrice}" /> VND</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${oder.status eq 'Pending'}">
                                                                    <span class="status-badge status-pending">Đang chờ</span>
                                                                </c:when>
                                                                <c:when test="${oder.status eq 'Delivering'}">
                                                                    <span class="status-badge status-delivering">Đang giao</span>
                                                                </c:when>
                                                                <c:when test="${oder.status eq 'Finish'}">
                                                                    <span class="status-badge status-finish">Hoàn tất</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="status-badge">${oder.status}</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <a href="/admin/order/detail/${oder.id}" class="btn-action btn-view">
                                                                <i class="fas fa-eye"></i> Xem
                                                            </a>
                                                            <a href="/admin/order/update/${oder.id}" class="btn-action btn-edit">
                                                                <i class="fas fa-edit"></i> Sửa
                                                            </a>
                                                            <a href="/admin/order/del/${oder.id}" class="btn-action btn-delete">
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
                                            <c:if test="${currentPage < 2}">
                                                <li class="page-item disabled">
                                                    <span class="page-link">Trước</span>
                                                </li>
                                            </c:if>
                                            <c:if test="${currentPage > 1}">
                                                <li class="page-item">
                                                    <a class="page-link" href="/adminOrder?page=${currentPage-1}">Trước</a>
                                                </li>
                                            </c:if>

                                            <c:if test="${totalPage > 0}">
                                                <c:set var="startPage" value="${(currentPage - 2 > 0) ? currentPage - 2 : 1}" />
                                                <c:set var="endPage" value="${(startPage + 4 < totalPage) ? startPage + 4 : totalPage}" />
                                                
                                                <c:if test="${startPage > 1}">
                                                    <li class="page-item">
                                                        <a class="page-link" href="/adminOrder?page=1">1</a>
                                                    </li>
                                                    <c:if test="${startPage > 2}">
                                                        <li class="page-item disabled">
                                                            <span class="page-link">...</span>
                                                        </li>
                                                    </c:if>
                                                </c:if>
                                                
                                                <c:forEach begin="${startPage}" end="${endPage}" varStatus="loop">
                                                    <li class="${(loop.index) eq currentPage ? 'page-item active' : 'page-item'}">
                                                        <a class="page-link" href="/adminOrder?page=${loop.index}">${loop.index}</a>
                                                    </li>
                                                </c:forEach>
                                                
                                                <c:if test="${endPage < totalPage}">
                                                    <c:if test="${endPage < totalPage - 1}">
                                                        <li class="page-item disabled">
                                                            <span class="page-link">...</span>
                                                        </li>
                                                    </c:if>
                                                    <li class="page-item">
                                                        <a class="page-link" href="/adminOrder?page=${totalPage}">${totalPage}</a>
                                                    </li>
                                                </c:if>
                                            </c:if>

                                            <c:if test="${currentPage >= totalPage}">
                                                <li class="page-item disabled">
                                                    <span class="page-link">Sau</span>
                                                </li>
                                            </c:if>
                                            <c:if test="${currentPage < totalPage}">
                                                <li class="page-item">
                                                    <a class="page-link" href="/adminOrder?page=${currentPage+1}">Sau</a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </nav>
                                </div>
                            </main>
                            <footer class="py-4 bg-light mt-auto">
                                <div class="container-fluid px-4">
                                    <div class="d-flex align-items-center justify-content-between small">
                                        <div class="text-muted">Copyright &copy; Mixxshop 2024</div>
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
                </body>

                </html>