<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>Fruitables - Vegetable Website Template</title>
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
                    <link href="/css/client/lightbox.min.css" rel="stylesheet">
                    <link href="/css/client/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/css/client/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/css/client/style.css" rel="stylesheet">


                    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

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
                            background-color: #f9f9f9;
                            min-width: 160px;
                            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                            z-index: 1;
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
                                            href="https://www.google.com/maps/place/Ti%E1%BB%81n+H%E1%BA%A3i,+Ti%E1%BB%81n+H%E1%BA%A3i+District,+Thai+Binh/@20.4044091,106.5001131,15z/data=!3m1!4b1!4m6!3m5!1s0x3135f8c5b3919d0b:0x9ea9c50b834948b1!8m2!3d20.402609!4d106.5009617!16s%2Fg%2F122xl0yc?entry=ttu&g_ep=EgoyMDI0MTAyNy4wIKXMDSoASAFQAw%3D%3D"
                                            class="text-white">Tiền Hải, Thái Bình</a></small>
                                    <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#"
                                            class="text-white">qlinhphan@gmail.com</a></small>
                                </div>
                                <div class="top-link pe-2">
                                    <a href="#" class="text-white"><small class="text-white mx-2">Buy Like You
                                            Want</small></a>
                                    <!-- <a href="#" class="text-white"><small class="text-white mx-2">Terms of Use</small>/</a>
                    <a href="#" class="text-white"><small class="text-white ms-2">Sales and Refunds</small></a> -->
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
                                        <a href="" class="nav-item nav-link active">Trang Chủ</a>
                                        <a href="/buy" class="nav-item nav-link">Của Hàng</a>
                                    </div>
                                    <div class="d-flex m-3 me-0">
                                        <c:if test="${not empty pageContext.request.userPrincipal}">


                                            <a href="/cart" class="position-relative me-4 my-auto">

                                                <i class="fa fa-shopping-bag fa-2x"></i>

                                                <span
                                                    class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                                                    style="top: -5px; left: 15px; height: 20px; min-width: 20px;">${SumCarts}</span>
                                            </a>
                                            <div class="dropdown" style="color: wheat;">

                                                <a href="#" class="my-auto dropbtn"
                                                    style="display: flex; border-radius: 17px;">
                                                    <i class="fas fa-user fa-2x"></i>
                                                </a>
                                                <div class="dropdown-content" style="margin-left: -165%;">
                                                    <div>
                                                        <div style="margin-left: 16px;"><img
                                                                src="/images/avatar/${user.avatar}" alt=""
                                                                style="width: 50xp; height: 50px; border-radius: 50%;">
                                                        </div>
                                                        <div>
                                                            <span
                                                                style="margin-left: 16px; font-size: 12px; box-shadow: 1px 1px 12px black; color: grey;">${pageContext.request.userPrincipal.name}</span>
                                                        </div>
                                                    </div>
                                                    <a href="/overView" style="font-size: 12px;">Quản Lý Tài Khoản</a>
                                                    <a href="/purcharseHist" style="font-size: 12px;">Lịch Sử Mua
                                                        Hàng</a>
                                                    <hr>
                                                    <form action="/logout" method="post">
                                                        <div>
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                value="${_csrf.token}" />
                                                        </div>
                                                        <button
                                                            style="font-size: 12px; margin-left: 15px; margin-bottom: 14px; box-shadow: 2px 2px 4px grey;"
                                                            type="submit">Đăng
                                                            Xuất</button>
                                                    </form>

                                                </div>
                                            </div>

                                        </c:if>

                                        <c:if test="${empty pageContext.request.userPrincipal}">
                                            <a href="#" class="position-relative me-4 my-auto">
                                                <!-- <i class="fa fa-shopping-bag fa-2x"></i> -->
                                                <a href="/login"
                                                    style="color: black; text-decoration: none; box-shadow: 3px 3px 3px red; background-color: wheat;">Đăng
                                                    nhập</a>
                                                <!-- <span
                                                    class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                                                    style="top: -5px; left: 15px; height: 20px; min-width: 20px;">3</span> -->
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


                    <!-- Hero Start -->
                    <div class="container-fluid py-5 mb-5 hero-header">
                        <div class="container py-5">
                            <div class="row g-5 align-items-center">
                                <div class="col-md-12 col-lg-7">
                                    <h4 class="mb-3 text-secondary">100% Sản Phẩm Chính Hãng</h4>
                                    <h1 class="mb-5 display-3 text-primary">Hàng Chất Lượng & Giá Hợp Lý</h1>
                                    <!-- <div class="position-relative mx-auto">
                                        <input
                                            class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill"
                                            type="number" placeholder="Search">
                                        <button type="submit"
                                            class="btn btn-primary border-2 border-secondary py-3 px-4 position-absolute rounded-pill text-white h-100"
                                            style="top: 0; right: 25%;">Submit Now</button>
                                    </div> -->
                                </div>
                                <div class="col-md-12 col-lg-5">
                                    <div id="carouselId" class="carousel slide position-relative"
                                        data-bs-ride="carousel">
                                        <div class="carousel-inner" role="listbox">
                                            <div class="carousel-item active rounded">
                                                <img src="/images/product/bfs.jpg"
                                                    class="img-fluid w-100 h-100 bg-secondary rounded"
                                                    alt="First slide">
                                                <a href="#" class="btn px-4 py-2 text-white rounded">Laptop</a>
                                            </div>

                                        </div>
                                        <!-- <button class="carousel-control-prev" type="button" data-bs-target="#carouselId"
                                            data-bs-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="visually-hidden">Previous</span>
                                        </button>
                                        <button class="carousel-control-next" type="button" data-bs-target="#carouselId"
                                            data-bs-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="visually-hidden">Next</span>
                                        </button> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Hero End -->


                    <!-- Featurs Section Start -->
                    <div class="container-fluid featurs py-5">
                        <div class="container py-5">
                            <div class="row g-4">
                                <div class="col-md-6 col-lg-3">
                                    <div class="featurs-item text-center rounded bg-light p-4">
                                        <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                            <i class="fas fa-car-side fa-3x text-white"></i>
                                        </div>
                                        <div class="featurs-content text-center">
                                            <h5>Miễn Phí Vận Chuyển</h5>
                                            <p class="mb-0">Với quảng đường nhỏ hơn 30km</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-3">
                                    <div class="featurs-item text-center rounded bg-light p-4">
                                        <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                            <i class="fas fa-user-shield fa-3x text-white"></i>
                                        </div>
                                        <div class="featurs-content text-center">
                                            <h5>Thanh Toán An Toàn</h5>
                                            <p class="mb-0">Không bị mất thông tin</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-3">
                                    <div class="featurs-item text-center rounded bg-light p-4">
                                        <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                            <i class="fas fa-exchange-alt fa-3x text-white"></i>
                                        </div>
                                        <div class="featurs-content text-center">
                                            <h5>30 Ngày Trả Hàng</h5>
                                            <p class="mb-0">Nếu sản phẩm lỗi</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-3">
                                    <div class="featurs-item text-center rounded bg-light p-4">
                                        <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                            <i class="fa fa-phone-alt fa-3x text-white"></i>
                                        </div>
                                        <div class="featurs-content text-center">
                                            <h5>Hỗ Trợ 24/7</h5>
                                            <p class="mb-0">Luôn Bên Cạnh Bạn</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Featurs Section End -->


                    <!-- Fruits Shop Start-->
                    <div class="container-fluid fruite py-5">
                        <div class="container py-5">
                            <div class="row g-4 mb-5">
                                <div class="col-lg-8">
                                    <h1 class="mb-3 fw-bold">Sản Phẩm Nổi Bật</h1>
                                    <p class="text-muted">Khám phá những mẫu laptop mới nhất với hiệu năng vượt trội</p>
                                </div>
                                <div class="col-lg-4 text-lg-end">
                                    <a href="/buy" class="btn btn-primary rounded-pill py-3 px-5">Xem Tất Cả Sản Phẩm</a>
                                </div>
                            </div>
                            <div class="tab-content">
                                <div id="tab-1" class="tab-pane fade show p-0 active">
                                    <div class="row g-4">
                                        <div class="col-lg-12">
                                            <div class="row g-4">
                                                <c:forEach var="product" items="${products}" begin="0" end="7">
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="card product-card rounded h-100 border-0 shadow-sm">
                                                            <div class="position-relative">
                                                                <c:choose>
                                                                    <c:when test="${empty product.image}">
                                                                        <img src="https://dummyimage.com/300x200/000/fff&text=NoImage"
                                                                            class="card-img-top rounded-top" alt="Default Product Image">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <img src="${product.image}"
                                                                            class="card-img-top rounded-top" alt="Product Image">
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <div class="product-badge bg-primary text-white px-3 py-1 rounded position-absolute"
                                                                    style="top: 10px; left: 10px;">Laptop</div>
                                                            </div>
                                                            <div class="card-body p-4">
                                                                <h5 class="card-title mb-3 fw-bold">${product.name}</h5>
                                                                <p class="card-text text-muted mb-3">${product.shortDes}</p>
                                                                <div class="d-flex justify-content-between align-items-center">
                                                                    <h6 class="fw-bold mb-0">
                                                                        <fmt:formatNumber type="number" value="${product.price}" /> ₫
                                                                    </h6>
                                                                    <div class="d-flex gap-2">
                                                                        <a href="/detail/product/client/${product.id}" 
                                                                            class="btn btn-sm btn-outline-primary">
                                                                            <i class="fa fa-eye"></i>
                                                                        </a>
                                                                        <form action="/add-product-to-card/${product.id}" method="post">
                                                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                                            <button type="submit" class="btn btn-sm btn-primary">
                                                                                <i class="fa fa-shopping-bag"></i>
                                                                            </button>
                                                                        </form>
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
                            </div>
                        </div>
                    </div>
                    <!-- Fruits Shop End-->


                    <!-- Banner Section Start -->
                    <div class="container-fluid py-5 my-5" style="background-color: #f8f9fa;">
                        <div class="container py-5">
                            <div class="row g-5 align-items-center">
                                <div class="col-lg-6">
                                    <div class="py-4">
                                        <h1 class="display-4 fw-bold text-primary mb-4">Sản Phẩm Được Quan Tâm Nhất</h1>
                                        <p class="lead mb-4 text-dark">Đây là sản phẩm được đánh giá cao nhất từ khách hàng của chúng tôi</p>
                                        <a href="/detail/product/client/${productCare.id}"
                                            class="btn btn-primary rounded-pill py-3 px-5">Xem Chi Tiết</a>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="position-relative rounded overflow-hidden">
                                        <img src="${empty productCare.image ? 'https://dummyimage.com/800x400/000/fff&text=NoImage' : productCare.image}" 
                                            class="img-fluid rounded shadow w-100" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Banner Section End -->


                    <!-- Featurs Start -->
                    <!-- 
                        <div class="container py-5">
                            <div class="row g-4 justify-content-center">
                                <div class="col-md-6 col-lg-4">
                                    <a href="#">
                                        <div class="service-item bg-secondary rounded border border-secondary">
                                            <img src="/images/product/featur-1.jpg" class="img-fluid rounded-top w-100"
                                                alt="">
                                            <div class="px-4 rounded-bottom">
                                                <div class="service-content bg-primary text-center p-4 rounded">
                                                    <h5 class="text-white">Fresh Apples</h5>
                                                    <h3 class="mb-0">20% OFF</h3>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <a href="#">
                                        <div class="service-item bg-dark rounded border border-dark">
                                            <img src="/images/product/featur-2.jpg" class="img-fluid rounded-top w-100"
                                                alt="">
                                            <div class="px-4 rounded-bottom">
                                                <div class="service-content bg-light text-center p-4 rounded">
                                                    <h5 class="text-primary">Tasty Fruits</h5>
                                                    <h3 class="mb-0">Free delivery</h3>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <a href="#">
                                        <div class="service-item bg-primary rounded border border-primary">
                                            <img src="/images/product/featur-3.jpg" class="img-fluid rounded-top w-100"
                                                alt="">
                                            <div class="px-4 rounded-bottom">
                                                <div class="service-content bg-secondary text-center p-4 rounded">
                                                    <h5 class="text-white">Exotic Vegitable</h5>
                                                    <h3 class="mb-0">Discount 30$</h3>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div> -->
                    <!-- Featurs End -->


                    <!-- Vesitable Shop Start-->

                    <!-- Vesitable Shop End -->


                    <!-- Fact Start -->
                    <div class="container-fluid py-5">
                        <div class="container">
                            <div class="bg-light p-5 rounded">
                                <div class="row g-4 justify-content-center">
                                    <!-- <div class="col-md-6 col-lg-6 col-xl-3">
                                        <div class="counter bg-white rounded p-5">
                                            <i class="fa fa-users text-secondary"></i>
                                            <h4>satisfied customers</h4>
                                            <h1>1963</h1>
                                        </div>
                                    </div> -->
                                    <div class="col-md-6 col-lg-6 col-xl-3">
                                        <div class="counter bg-white rounded p-5">
                                            <i class="fa fa-users text-secondary"></i>
                                            <h4>Người dùng tích cực nhất</h4>
                                            <h1>${isUser.fullname}</h1>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-3">
                                        <div class="counter bg-white rounded p-5">
                                            <i class="fa fa-users text-secondary"></i>
                                            <h4>Số lượng người dùng hiện có</h4>
                                            <h1>${countUser}</h1>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-3">
                                        <div class="counter bg-white rounded p-5">
                                            <i class="fa fa-user-circle text-secondary"></i>
                                            <h4>Đơn hàng đã bán ra </h4>
                                            <h1>${countOrder}</h1>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-3">
                                        <div class="counter bg-white rounded p-5">
                                            <i class="fa fa-user-circle text-secondary"></i>
                                            <h4>Người dùng đặc biệt nhất của cửa hàng</h4>
                                            <h1>${isOrder.users.fullname}</h1>
                                        </div>
                                    </div>
                                    <!-- <div class="col-md-6 col-lg-6 col-xl-3">
                                        <div class="counter bg-white rounded p-5">
                                            <i class="fa fa-users text-secondary"></i>
                                            <h4>Available Products</h4>
                                            <h1>789</h1>
                                        </div>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Fact Start -->


                    <!-- Tastimonial Start -->
                    <div class="container-fluid testimonial py-5">
                        <div class="container py-5">
                            <div class="testimonial-header text-center">
                                <h4 class="text-primary">Giới Thiệu</h4>
                                <h1 class="display-5 mb-5 text-dark">Giới Thiệu Về Cửa Hàng</h1>
                            </div>
                            <div class="owl-carousel testimonial-carousel">
                                <div class="testimonial-item img-border-radius bg-light rounded p-4">
                                    <div class="position-relative">
                                        <i class="fa fa-quote-right fa-2x text-secondary position-absolute"
                                            style="bottom: 30px; right: 0;"></i>
                                        <div class="mb-4 pb-4 border-bottom border-secondary">
                                            <p class="mb-0">Cửa hàng Laptop XYZ chuyên cung cấp các dòng laptop chính
                                                hãng với chất lượng vượt trội, từ những sản phẩm dành cho học sinh, sinh
                                                viên đến các laptop cao cấp phục vụ công việc chuyên nghiệp.
                                            </p>
                                        </div>
                                        <div class="d-flex align-items-center flex-nowrap">
                                            <div class="bg-secondary rounded">
                                                <img src="/images/avatar/${user.avatar}" class="img-fluid rounded"
                                                    style="width: 100px; height: 100px;" alt="">
                                            </div>
                                            <div class="ms-4 d-block">
                                                <h4 class="text-dark">Cam kết</h4>
                                                <p class="m-0 pb-3">Lời cam kết về chất lượng sản phẩm </p>
                                                <div class="d-flex pe-5">
                                                    <i class="fas fa-star text-primary"></i>
                                                    <i class="fas fa-star text-primary"></i>
                                                    <i class="fas fa-star text-primary"></i>
                                                    <i class="fas fa-star text-primary"></i>
                                                    <i class="fas fa-star"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="testimonial-item img-border-radius bg-light rounded p-4">
                                    <div class="position-relative">
                                        <i class="fa fa-quote-right fa-2x text-secondary position-absolute"
                                            style="bottom: 30px; right: 0;"></i>
                                        <div class="mb-4 pb-4 border-bottom border-secondary">
                                            <p class="mb-0">Tại đây, bạn sẽ tìm thấy những mẫu laptop mới nhất, được
                                                trang bị các công nghệ hiện đại, giúp nâng cao hiệu suất làm việc và
                                                giải trí. Laptop XYZ luôn cam kết mang đến cho bạn trải nghiệm mua sắm
                                                tuyệt vời nhất.
                                            </p>
                                        </div>
                                        <div class="d-flex align-items-center flex-nowrap">
                                            <div class="bg-secondary rounded">
                                                <img src="/images/avatar/${user.avatar}" class="img-fluid rounded"
                                                    style="width: 100px; height: 100px;" alt="">
                                            </div>
                                            <div class="ms-4 d-block">
                                                <h4 class="text-dark">Cam kết</h4>
                                                <p class="m-0 pb-3">Lời cam kết về chất lượng sản phẩm </p>
                                                <div class="d-flex pe-5">
                                                    <i class="fas fa-star text-primary"></i>
                                                    <i class="fas fa-star text-primary"></i>
                                                    <i class="fas fa-star text-primary"></i>
                                                    <i class="fas fa-star text-primary"></i>
                                                    <i class="fas fa-star text-primary"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- Tastimonial End -->


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
                                            <input class="form-control border-0 w-100 py-3 px-4 rounded-pill"
                                                type="number" placeholder="Your Email">
                                            <button type="submit"
                                                class="btn btn-primary border-0 border-secondary py-3 px-4 position-absolute rounded-pill text-white"
                                                style="top: 0; right: 0;">Subscribe Now</button>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="d-flex justify-content-end pt-3">
                                            <a class="btn  btn-outline-secondary me-2 btn-md-square rounded-circle"
                                                href=""><i class="fab fa-twitter"></i></a>
                                            <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle"
                                                href=""><i class="fab fa-facebook-f"></i></a>
                                            <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle"
                                                href=""><i class="fab fa-youtube"></i></a>
                                            <a class="btn btn-outline-secondary btn-md-square rounded-circle" href=""><i
                                                    class="fab fa-linkedin-in"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-5">
                                <div class="col-lg-3 col-md-6">
                                    <div class="footer-item">
                                        <h4 class="text-light mb-3">Why People Like us!</h4>
                                        <p class="mb-4">typesetting, remaining essentially unchanged. It was
                                            popularised in the 1960s with the like Aldus PageMaker including of Lorem
                                            Ipsum.
                                        </p>
                                        <a href="" class="btn border-secondary py-2 px-4 rounded-pill text-primary">Read
                                            More</a>
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
                                        <img src="/images/product/payment.png" class="img-fluid" alt="">
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
                                    <span class="text-light"><a href="#"><i
                                                class="fas fa-copyright text-light me-2"></i>Your Site
                                            Name</a>, All right reserved.</span>
                                </div>
                                <div class="col-md-6 my-auto text-center text-md-end text-white">
                                    <!--/*** This template is free as long as you keep the below author's credit link/attribution link/backlink. ***/-->
                                    <!--/*** If you'd like to use the template without the below author's credit link/attribution link/backlink, ***/-->
                                    <!--/*** you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". ***/-->
                                    Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
                                    Distributed By
                                    <a class="border-bottom" href="https://themewagon.com">ThemeWagon</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Copyright End -->



                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/js/client/easing.min.js"></script>
                    <script src="/js/client/waypoints.min.js"></script>
                    <script src="/js/client/lightbox.min.js"></script>
                    <script src="/js/client/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/js/client/main.js"></script>
                </body>

                </html>