<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>Mixxshop - Cửa Hàng</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/js/client/lightbox.min.css" rel="stylesheet">
                    <link href="/js/client/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/css/client/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/css/client/style.css" rel="stylesheet">
                    <style>
                        .dropbtn {
                            background-color: #4CAF50;
                            color: white;
                            padding: 16px;
                            font-size: 16px;
                            border: none;
                            cursor: pointer;
                        }

                        .dropdown {
                            position: relative;
                            display: inline-block;
                        }

                        .dropdown-content {
                            display: none;
                            position: absolute;
                            right: 0;
                            background-color: #f9f9f9;
                            min-width: 200px;
                            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                            z-index: 100;
                        }

                        .dropdown-content a {
                            color: black;
                            padding: 12px 16px;
                            text-decoration: none;
                            display: block;
                        }

                        .dropdown-content a:hover {
                            background-color: #f1f1f1
                        }

                        .dropdown:hover .dropdown-content {
                            display: block;
                        }

                        .dropdown:hover .dropbtn {
                            background-color: #3e8e41;
                        }

                        /* Shop Page Specific Styles */
                        .filter-card {
                            border-radius: 10px;
                            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
                            margin-bottom: 20px;
                            overflow: hidden;
                        }

                        .filter-header {
                            background-color: #3CB815;
                            color: white;
                            padding: 12px 15px;
                            font-weight: 600;
                            font-size: 16px;
                        }

                        .filter-body {
                            padding: 15px;
                            background-color: #fff;
                        }

                        .filter-option {
                            margin-bottom: 10px;
                            display: flex;
                            align-items: center;
                        }

                        .filter-option label {
                            margin-left: 10px;
                            margin-bottom: 0;
                            cursor: pointer;
                        }

                        .product-card {
                            transition: all 0.3s ease;
                            margin-bottom: 25px;
                        }

                        .product-card:hover {
                            transform: translateY(-5px);
                            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
                        }

                        .pagination {
                            margin-top: 30px;
                        }

                        .pagination a {
                            color: #3CB815;
                            padding: 8px 16px;
                            text-decoration: none;
                            margin: 0 4px;
                            border-radius: 4px;
                        }

                        .pagination a.active {
                            background-color: #3CB815;
                            color: white;
                        }

                        .pagination a:hover:not(.active) {
                            background-color: #ddd;
                        }
                        
                        .search-box {
                            margin-bottom: 20px;
                        }
                        
                        .btn-filter-apply {
                            background-color: #3CB815;
                            color: white;
                            border: none;
                            padding: 10px;
                            border-radius: 5px;
                            width: 100%;
                            margin-top: 15px;
                            transition: all 0.3s;
                        }
                        
                        .btn-filter-apply:hover {
                            background-color: #2d9710;
                        }
                    </style>
                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->


                    <!-- Navbar start -->
                    <div class="container-fluid fixed-top">
                        <div class="container topbar bg-primary d-none d-lg-block">
                            <div class="d-flex justify-content-between">
                                <div class="top-info ps-2">
                                    <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a
                                            href="#" class="text-white">Tiền Hải, Thái Bình</a></small>
                                    <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#"
                                            class="text-white">qlinhphan@gmail.com</a></small>
                                </div>
                                <div class="top-link pe-2">
                                    <a href="#" class="text-white"><small class="text-white mx-2">Buy Like You
                                            Want</small></a>
                                </div>
                            </div>
                        </div>
                        <div class="container px-0">
                            <nav class="navbar navbar-light bg-white navbar-expand-xl">
                                <a href="/" class="navbar-brand">
                                    <h1 class="text-primary display-6">LaptopShop</h1>
                                </a>
                                <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#navbarCollapse">
                                    <span class="fa fa-bars text-primary"></span>
                                </button>
                                <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                                    <div class="navbar-nav mx-auto">
                                        <a href="/" class="nav-item nav-link">Trang Chủ</a>
                                        <a href="/buy" class="nav-item nav-link active">Cửa Hàng</a>
                                    </div>
                                    <div class="d-flex m-3 me-0">
                                        <c:if test="${not empty pageContext.request.userPrincipal}">
                                            <a href="/cart" class="position-relative me-4 my-auto">
                                                <i class="fa fa-shopping-bag fa-2x"></i>
                                                <span
                                                    class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                                                    style="top: -5px; left: 15px; height: 20px; min-width: 20px;">${SumCarts}</span>
                                            </a>
                                            <div class="dropdown">
                                                <a href="#" class="my-auto dropbtn" style="display: flex; border-radius: 17px;">
                                                    <i class="fas fa-user fa-2x"></i>
                                                </a>
                                                <div class="dropdown-content">
                                                    <div class="p-3 border-bottom">
                                                        <div class="d-flex align-items-center mb-2">
                                                            <img src="/images/avatar/${ud.avatar}" alt="" style="width: 40px; height: 40px; border-radius: 50%; object-fit: cover;">
                                                            <span class="ms-2 fw-bold">${pageContext.request.userPrincipal.name}</span>
                                                        </div>
                                                    </div>
                                                    <a href="/overView"><i class="fas fa-user-cog me-2"></i> Quản Lý Tài Khoản</a>
                                                    <a href="/purcharseHist"><i class="fas fa-history me-2"></i> Lịch Sử Mua Hàng</a>
                                                    <div class="p-2 border-top">
                                                        <form action="/logout" method="post" class="m-0">
                                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                            <button type="submit" class="btn btn-danger btn-sm w-100"><i class="fas fa-sign-out-alt me-2"></i> Đăng Xuất</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>

                                        <c:if test="${empty pageContext.request.userPrincipal}">
                                            <a href="/login" class="btn btn-primary rounded-pill px-3 d-flex align-items-center">
                                                <i class="fas fa-sign-in-alt me-2"></i> Đăng nhập
                                            </a>
                                        </c:if>
                                    </div>
                                </div>
                            </nav>
                        </div>
                    </div>
                    <!-- Navbar End -->


                    <!-- Modal Search Start -->
                    <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog modal-fullscreen">
                            <div class="modal-content rounded-0">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body d-flex align-items-center">
                                    <div class="input-group w-75 mx-auto d-flex">
                                        <input type="search" class="form-control p-3" placeholder="keywords"
                                            aria-describedby="search-icon-1">
                                        <span id="search-icon-1" class="input-group-text p-3"><i
                                                class="fa fa-search"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal Search End -->


                    <!-- Single Page Header start -->
                    <div class="container-fluid page-header py-5">
                        <h1 class="text-center text-white display-6">Shop</h1>
                        <ol class="breadcrumb justify-content-center mb-0">
                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
                            <li class="breadcrumb-item active text-white">Shop</li>
                        </ol>
                    </div>
                    <!-- Single Page Header End -->


                    <!-- Fruits Shop Start-->
                    <div class="container-fluid fruite py-5">
                        <div class="container py-5">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <div class="col-xl-3">
                                            <div class="input-group w-100 mx-auto d-flex">
                                                <input id="search-input" type="search" class="form-control p-3" placeholder="Tìm Kiếm" aria-describedby="search-icon-1">
                                                <button id="search-button" type="button" class="btn btn-primary">
                                                    <i class="fa fa-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <div class="col-lg-3">
                                            <div class="row g-4">
                                                <div class="col-lg-12">
                                                    <div class="mb-3">
                                                        <h4>Hãng Sản Xuất</h4>
                                                        <ul class="list-unstyled fruite-categorie">
                                                            <div id="nameFilter">
                                                                <div style="display: flex; justify-content: space-between;">
                                                                    <li>
                                                                        <div class="d-flex align-items-center fruite-name">
                                                                            <a href="#">Apple</a>
                                                                            <span style="display: flex; margin-left: 1%;">
                                                                                <input class="form-check-input" type="checkbox" value="APPLE" id="flexCheckDefault" />
                                                                            </span>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="d-flex align-items-center fruite-name">
                                                                            <a href="#">Asus</a>
                                                                            <span style="display: flex; margin-left: 1%;">
                                                                                <input class="form-check-input" type="checkbox" value="ASUS" id="flexCheckDefault" />
                                                                            </span>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="d-flex align-items-center fruite-name">
                                                                            <a href="#">Lenovo</a>
                                                                            <span style="display: flex; margin-left: 1%;">
                                                                                <input class="form-check-input" type="checkbox" value="LENOVO" id="flexCheckDefault" />
                                                                            </span>
                                                                        </div>
                                                                    </li>
                                                                </div>
                                                                <div style="display: flex; justify-content: space-between;">
                                                                    <li>
                                                                        <div class="d-flex align-items-center fruite-name">
                                                                            <a href="#">Dell</a>
                                                                            <span style="display: flex; margin-left: 1%;">
                                                                                <input type="checkbox" class="form-check-input" value="DELL" id="flexCheckDefault" />
                                                                            </span>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="d-flex align-items-center fruite-name">
                                                                            <a href="#">LG</a>
                                                                            <span style="display: flex; margin-left: 1%;">
                                                                                <input class="form-check-input" type="checkbox" value="LG" id="flexCheckDefault" />
                                                                            </span>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="d-flex align-items-center fruite-name">
                                                                            <a href="#">Acer</a>
                                                                            <span style="display: flex; margin-left: 1%;">
                                                                                <input class="form-check-input" type="checkbox" value="ACER" id="flexCheckDefault" />
                                                                            </span>
                                                                        </div>
                                                                    </li>
                                                                </div>
                                                            </div>
                                                        </ul>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-lg-12">
                                                    <div class="mb-3">
                                                        <h4>Mục Đích Sử Dụng</h4>
                                                        <ul class="list-unstyled fruite-categorie">
                                                            <div id="targetFilter">
                                                                <div style="display: flex; justify-content: space-between;">
                                                                    <li>
                                                                        <div class="d-flex align-items-center fruite-name">
                                                                            <a href="#" style="white-space: nowrap;">Gaming</a>
                                                                            <span style="display: flex; margin-left: 1%;">
                                                                                <input class="form-check-input" type="checkbox" value="GAMING" id="flexCheckDefault" />
                                                                            </span>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="d-flex align-items-center fruite-name">
                                                                            <a href="#" style="white-space: nowrap;">Sinh Viên-Văn Phòng</a>
                                                                            <span style="display: flex; margin-left: 1%;">
                                                                                <input class="form-check-input" type="checkbox" value="SINHVIEN-VANPHONG" id="flexCheckDefault" />
                                                                            </span>
                                                                        </div>
                                                                    </li>
                                                                </div>
                                                                <div style="display: flex; justify-content: space-between;">
                                                                    <li>
                                                                        <div class="d-flex align-items-center fruite-name">
                                                                            <a href="#" style="white-space: nowrap;">Thiết Kế Đồ Họa</a>
                                                                            <span style="display: flex; margin-left: 1%;">
                                                                                <input class="form-check-input" type="checkbox" value="THIET-KE-DO-HOA" id="flexCheckDefault" />
                                                                            </span>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="d-flex align-items-center fruite-name">
                                                                            <a href="#" style="white-space: nowrap;">Mỏng Nhẹ</a>
                                                                            <span style="display: flex; margin-left: 1%;">
                                                                                <input class="form-check-input" type="checkbox" value="MONG-NHE" id="flexCheckDefault" />
                                                                            </span>
                                                                        </div>
                                                                    </li>
                                                                </div>
                                                                <div style="display: flex; justify-content: space-between;">
                                                                    <li>
                                                                        <div class="d-flex align-items-center fruite-name">
                                                                            <a href="#" style="white-space: nowrap;">Doanh Nhân</a>
                                                                            <span style="display: flex; margin-left: 1%;">
                                                                                <input class="form-check-input" type="checkbox" value="DOANH-NHAN" id="flexCheckDefault" />
                                                                            </span>
                                                                        </div>
                                                                    </li>
                                                                </div>
                                                            </div>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div class="col-lg-12">
                                                    <div class="mb-3">
                                                        <h4>Mục Giá</h4>
                                                        <ul class="list-unstyled fruite-categorie">
                                                            <div style="display: flex; justify-content: space-between;" id="moneyFilter">
                                                                <div>
                                                                    <div style="display: flex; justify-content: space-between;">
                                                                        <li>
                                                                            <div class="d-flex align-items-center fruite-name">
                                                                                <a href="#" style="white-space: nowrap;">Dưới 10triệu</a>
                                                                                <span style="display: flex; margin-left: 1%;">
                                                                                    <input class="form-check-input" type="checkbox" value="duoi-10tr" id="flexCheckDefault" />
                                                                                </span>
                                                                            </div>
                                                                        </li>
                                                                        <li>
                                                                            <div class="d-flex align-items-center fruite-name">
                                                                                <a href="#" style="white-space: nowrap;">Từ 10 đến 15 triệu</a>
                                                                                <span style="display: flex; margin-left: 1%;">
                                                                                    <input class="form-check-input" type="checkbox" value="tu-10tr-den-15tr" id="flexCheckDefault" />
                                                                                </span>
                                                                            </div>
                                                                        </li>
                                                                    </div>
                                                                    <div style="display: flex; justify-content: space-between;">
                                                                        <li>
                                                                            <div class="d-flex align-items-center fruite-name">
                                                                                <a href="#" style="white-space: nowrap;">Từ 15 Đến 20 Triệu</a>
                                                                                <span style="display: flex; margin-left: 1%;">
                                                                                    <input class="form-check-input" type="checkbox" value="tu-15tr-den-20tr" id="flexCheckDefault" />
                                                                                </span>
                                                                            </div>
                                                                        </li>
                                                                        <li>
                                                                            <div class="d-flex align-items-center fruite-name">
                                                                                <a href="#" style="white-space: nowrap;">Trên 20 Triệu</a>
                                                                                <span style="display: flex; margin-left: 1%;">
                                                                                    <input class="form-check-input" type="checkbox" value="tren-20tr" id="flexCheckDefault" />
                                                                                </span>
                                                                            </div>
                                                                        </li>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div class="col-lg-12">
                                                    <div class="mb-3">
                                                        <h4>Sắp xếp</h4>
                                                        <ul class="list-unstyled fruite-categorie">
                                                            <div style="display: flex; justify-content: space-between;" id="sortFilter">
                                                                <div style="display: flex; justify-content: space-between;">
                                                                    <li>
                                                                        <div class="d-flex align-items-center fruite-name">
                                                                            <a href="#" style="white-space: nowrap;">Giá Giảm Dần</a>
                                                                            <span style="display: flex; margin-left: 1%;">
                                                                                <input class="form-check-input" type="checkbox" value="gia-giam-dan" id="flexCheckDefault" />
                                                                            </span>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="d-flex align-items-center fruite-name">
                                                                            <a href="#" style="white-space: nowrap;">Không sắp xếp</a>
                                                                            <span style="display: flex; margin-left: 1%;">
                                                                                <input class="form-check-input" type="checkbox" value="khong-sap-xep" id="flexCheckDefault" />
                                                                            </span>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="d-flex align-items-center fruite-name" style="margin-left: -211%; margin-top: 29%;">
                                                                            <a href="#" style="white-space: nowrap;">Giá Tăng Dần</a>
                                                                            <span style="display: flex; margin-left: 1%;">
                                                                                <input class="form-check-input" type="checkbox" value="gia-tang-dan" id="flexCheckDefault" />
                                                                            </span>
                                                                        </div>
                                                                    </li>
                                                                </div>
                                                            </div>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div class="col-lg-12">
                                                    <div class="d-flex justify-content-center my-4">
                                                        <a href="#" class="btn border border-secondary px-4 py-3 rounded-pill text-primary w-100 btn-filter" id="btnFilter">Tìm Kiếm Sản Phẩm</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-lg-9">
                                            <div class="row g-4 justify-content-center">
                                                <c:forEach items="${dsProducts}" var="product">
                                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <c:choose>
                                                                    <c:when test="${empty product.image}">
                                                                        <img src="https://dummyimage.com/300x200/000/fff&text=NoImage" class="img-fluid w-100 rounded-top" alt="Default Product Image">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <img src="${product.image}" class="img-fluid w-100 rounded-top" alt="Product Image">
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Laptop</div>
                                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <h4>${product.name}</h4>
                                                                <p>${product.shortDes}</p>
                                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">
                                                                        <fmt:formatNumber type="number" value="${product.price}" /> Vnd
                                                                    </p>
                                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary">
                                                                        <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>

                                                <div class="col-12 page">
                                                    <div class="pagination d-flex justify-content-center mt-5">
                                                        <c:if test="${currentPage > 1}">
                                                            <a href="/buy?page=${currentPage-1}" class="rounded" data-page="${currentPage-1}">&laquo;</a>
                                                        </c:if>
                                                        <c:if test="${currentPage == 1}">
                                                            <a href="" class="rounded" style="display: none;">&laquo;</a>
                                                        </c:if>
                                                        <!-- name=${name} -->

                                                        <c:if test="${totalPage==0}">
                                                            <p>Không tìm thấy sản phẩm nào</p>
                                                        </c:if>

                                                        <c:if test="${totalPage>0}">
                                                            <c:set var="startPage" value="${(currentPage - 3 > 0) ? currentPage - 3 : 1}" />
                                                            <c:set var="endPage" value="${(startPage + 6 < totalPage) ? startPage + 6 : totalPage}" />
                                                            
                                                            <c:if test="${startPage > 1}">
                                                                <a href="/buy?page=1" class="rounded">1</a>
                                                                <c:if test="${startPage > 2}">
                                                                    <span class="px-2">...</span>
                                                                </c:if>
                                                            </c:if>
                                                            
                                                            <c:forEach begin="${startPage}" end="${endPage}" varStatus="loop">
                                                                <a href="/buy?page=${loop.index}" class="${loop.index eq currentPage ? 'active rounded' : 'rounded'}" data-page="${loop.index}">${loop.index}</a>
                                                            </c:forEach>
                                                            
                                                            <c:if test="${endPage < totalPage}">
                                                                <c:if test="${endPage < totalPage - 1}">
                                                                    <span class="px-2">...</span>
                                                                </c:if>
                                                                <a href="/buy?page=${totalPage}" class="rounded">${totalPage}</a>
                                                            </c:if>
                                                        </c:if>

                                                        <c:if test="${currentPage < totalPage}">
                                                            <a href="/buy?page=${currentPage+1}" class="rounded" data-page="${currentPage+1}">&raquo;</a>
                                                        </c:if>
                                                        <c:if test="${currentPage == totalPage}">
                                                            <a href="" class="rounded" style="display: none;">&raquo;</a>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Fruits Shop End-->


                    <!-- Footer Start -->
                    <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
                        <div class="container py-5">
                            <div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(226, 175, 24, 0.5) ;">
                                <div class="row g-4">
                                    <div class="col-lg-3">
                                        <a href="#">
                                            <h1 class="text-primary mb-0">Fruitables</h1>
                                            <p class="text-secondary mb-0">Fresh products</p>
                                        </a>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="position-relative mx-auto">
                                            <input class="form-control border-0 w-100 py-3 px-4 rounded-pill" type="number" placeholder="Your Email">
                                            <button type="submit" class="btn btn-primary border-0 border-secondary py-3 px-4 position-absolute rounded-pill text-white" style="top: 0; right: 0;">Subscribe Now</button>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="d-flex justify-content-end pt-3">
                                            <a class="btn  btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-twitter"></i></a>
                                            <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-facebook-f"></i></a>
                                            <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-youtube"></i></a>
                                            <a class="btn btn-outline-secondary btn-md-square rounded-circle" href=""><i class="fab fa-linkedin-in"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-5">
                                <div class="col-lg-3 col-md-6">
                                    <div class="footer-item">
                                        <h4 class="text-light mb-3">Why People Like us!</h4>
                                        <p class="mb-4">typesetting, remaining essentially unchanged. It was popularised in the 1960s with the like Aldus PageMaker including of Lorem Ipsum.</p>
                                        <a href="" class="btn border-secondary py-2 px-4 rounded-pill text-primary">Read More</a>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6">
                                    <div class="d-flex flex-column text-start footer-item">
                                        <h4 class="text-light mb-3">Shop Info</h4>
                                        <a class="btn-link" href="">About Us</a>
                                        <a class="btn-link" href="">Contact Us</a>
                                        <a class="btn-link" href="">Privacy Policy</a>
                                        <a class="btn-link" href="">Terms & Condition</a>
                                        <a class="btn-link" href="">Return Policy</a>
                                        <a class="btn-link" href="">FAQs & Help</a>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6">
                                    <div class="d-flex flex-column text-start footer-item">
                                        <h4 class="text-light mb-3">Account</h4>
                                        <a class="btn-link" href="">My Account</a>
                                        <a class="btn-link" href="">Shop details</a>
                                        <a class="btn-link" href="">Shopping Cart</a>
                                        <a class="btn-link" href="">Wishlist</a>
                                        <a class="btn-link" href="">Order History</a>
                                        <a class="btn-link" href="">International Orders</a>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6">
                                    <div class="footer-item">
                                        <h4 class="text-light mb-3">Contact</h4>
                                        <p>Address: 1429 Netus Rd, NY 48247</p>
                                        <p>Email: Example@gmail.com</p>
                                        <p>Phone: +0123 4567 8910</p>
                                        <p>Payment Accepted</p>
                                        <img src="img/payment.png" class="img-fluid" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Footer End -->

                    <!-- Copyright Start -->
                    <div class="container-fluid copyright bg-dark py-4">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                                    <span class="text-light"><a href="#"><i class="fas fa-copyright text-light me-2"></i>Your Site Name</a>, All right reserved.</span>
                                </div>
                                <div class="col-md-6 my-auto text-center text-md-end text-white">
                                    <!--/*** This template is free as long as you keep the below author's credit link/attribution link/backlink. ***/-->
                                    <!--/*** If you'd like to use the template without the below author's credit link/attribution link/backlink, ***/-->
                                    <!--/*** you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". ***/-->
                                    Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
                                    Distributed By <a class="border-bottom" href="https://themewagon.com">ThemeWagon</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Copyright End -->



                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/js/client/easing.min.js"></script>
                    <script src="/js/client/waypoints.min.js"></script>
                    <script src="/js/client/lightbox.min.js"></script>
                    <script src="/js/client/main.js"></script>
                    <script src="/js/client/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/js/client/main.js"></script>
                </body>

                </html>