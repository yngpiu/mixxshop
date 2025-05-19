<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>


            <!-- tag thu nhat dung de dung path, form
        tag thu hai dung de render du lieu ra bang -->
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Quản lý người dùng - Mixxshop</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
                <link rel="stylesheet" href="/css/demos.css">
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
                    crossorigin="anonymous">

                <style>
                    .ok {
                        white-space: nowrap;
                        /* Không xuống dòng */
                        overflow: hidden;
                        /* Ẩn phần văn bản vượt quá */
                    }

                    /* Khi màn hình nhỏ (ví dụ dưới 768px), giới hạn văn bản và thêm dấu ba chấm */
                    @media (max-width: 768px) {
                        .ok {
                            width: 5ch;
                            /* Giới hạn chiều rộng là 10 ký tự (có thể điều chỉnh theo nhu cầu) */
                            /* text-overflow: ellipsis; */
                            /* Hiển thị dấu "..." cho phần vượt quá */



                            /* Giới hạn chiều rộng bằng 4 ký tự */
                            white-space: nowrap;
                            /* Không xuống dòng */
                            overflow: hidden;
                            /* Ẩn phần văn bản vượt quá */
                            text-overflow: ellipsis;
                            /* Hiển thị dấu "..." cho phần vượt quá */
                        }
                    }

                    /* Khi màn hình lớn hơn 768px, hiển thị đầy đủ văn bản */
                    @media (min-width: 769px) {
                        .ok {
                            width: auto;
                            /* Hiển thị đầy đủ */
                            text-overflow: clip;
                            /* Không có dấu "..." */
                        }
                    }

                    .table-container {
                        background-color: #fff;
                        border-radius: 8px;
                        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                        overflow: hidden;
                        margin-bottom: 2rem;
                    }
                    
                    .user-table {
                        width: 100%;
                        border-collapse: collapse;
                    }
                    
                    .user-table th {
                        background-color: #f8f9fa;
                        color: #495057;
                        font-weight: 600;
                        text-transform: uppercase;
                        font-size: 0.85rem;
                        padding: 15px;
                        text-align: left;
                        border-bottom: 2px solid #dee2e6;
                    }
                    
                    .user-table td {
                        padding: 15px;
                        vertical-align: middle;
                        border-bottom: 1px solid #e9ecef;
                    }
                    
                    .user-table tr:hover {
                        background-color: #f8f9fa;
                    }
                    
                    .user-id {
                        font-weight: 600;
                        color: #495057;
                    }
                    
                    .user-email {
                        color: #007bff;
                    }
                    
                    .password-cell {
                        max-width: 200px;
                        overflow: hidden;
                        text-overflow: ellipsis;
                        white-space: nowrap;
                        color: #6c757d;
                        font-family: monospace;
                    }
                    
                    .role-badge {
                        padding: 6px 12px;
                        border-radius: 50px;
                        font-size: 0.8rem;
                        font-weight: 600;
                        display: inline-block;
                        text-align: center;
                    }
                    
                    .role-admin {
                        background-color: #cce5ff;
                        color: #004085;
                    }
                    
                    .role-user {
                        background-color: #d4edda;
                        color: #155724;
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
                    
                    .user-count {
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
                        
                        .password-cell {
                            max-width: 150px;
                        }
                    }
                    
                    @media (max-width: 768px) {
                        .user-table {
                            display: block;
                            overflow-x: auto;
                        }
                        
                        .password-cell {
                            max-width: 100px;
                        }
                    }
                </style>

            </head>


            <body>
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
                                    <a class="nav-link active" href="/table/user">
                                        <div class="sb-nav-link-icon"><i class="fa-solid fa-users"></i></div>
                                        Quản lý người dùng
                                    </a>
                                    <a class="nav-link" href="/adminProduct">
                                        <div class="sb-nav-link-icon"><i class="fa-brands fa-product-hunt"></i></div>
                                        Quản lý sản phẩm
                                    </a>
                                    <a class="nav-link" href="/adminOrder">
                                        <div class="sb-nav-link-icon"><i class="fa-regular fa-newspaper"></i></div>
                                        Quản lý đơn hàng
                                    </a>
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
                                    <h1>Quản lý người dùng</h1>
                                    <p class="user-count">Tổng số người dùng: ${users.size()}</p>
                                </div>

                                <a href="/create/user" class="btn-add">
                                    <i class="fas fa-user-plus"></i> Thêm người dùng mới
                                </a>

                                <div class="table-container">
                                    <table class="user-table">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Email</th>
                                                <th>Mật khẩu</th>
                                                <th>Phân quyền</th>
                                                <th>Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="user" items="${users}" begin="${(currentPage-1)*10}" end="${(currentPage*10)-1}">
                                                <tr>
                                                    <td class="user-id">${user.id}</td>
                                                    <td class="user-email">${user.email}</td>
                                                    <td class="password-cell">${user.password}</td>
                                                    <td>${user.roles.name}</td>
                                                    <td>
                                                        <a href="/exactly/table/${user.id}" class="btn btn-success">Xem</a>
                                                        <a href="/edit/user/${user.id}" class="btn btn-warning">Sửa</a>
                                                        <a href="/del/user/${user.id}" class="btn btn-danger">Xóa</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <!-- Pagination -->
                                <nav aria-label="Page navigation example" style="margin-top: 17px;">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item">
                                            <a class="page-link" href="#" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                        </li>

                                        <c:if test="${totalPage > 0}">
                                            <c:forEach begin="0" end="${totalPage-1}" varStatus="loop">
                                                <li class="${(loop.index+1) eq currentPage ? 'page-item active' : 'page-item'}">
                                                    <a class="page-link" href="/table/user?page=${loop.index+1}">${loop.index+1}</a>
                                                </li>
                                            </c:forEach>
                                        </c:if>

                                        <li class="page-item">
                                            <a class="page-link" href="#" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </li>
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
                    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                    crossorigin="anonymous"></script>

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