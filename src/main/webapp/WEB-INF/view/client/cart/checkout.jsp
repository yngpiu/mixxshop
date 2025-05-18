<%@ page contentType="text/html; charset=UTF-8" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Checkout - Laptop Shop</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />

    <style>
      * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
      }

      body {
        font-family: 'Montserrat', sans-serif;
        background-color: #f9f9f9;
        color: #333;
        line-height: 1.6;
      }

      .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 40px 20px;
      }

      .page-title {
        text-align: center;
        margin-bottom: 40px;
        color: #1c3361;
        font-weight: 700;
      }

      .checkout-wrapper {
        display: flex;
        flex-wrap: wrap;
        gap: 30px;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        padding: 0;
        overflow: hidden;
      }

      .order-summary {
        flex: 1;
        min-width: 300px;
        background: #f5f7fa;
        padding: 30px;
      }

      .checkout-form {
        flex: 2;
        min-width: 300px;
        padding: 30px;
      }

      .section-title {
        font-size: 1.5rem;
        margin-bottom: 20px;
        color: #1c3361;
        font-weight: 600;
        padding-bottom: 10px;
        border-bottom: 1px solid #eee;
      }

      .summary-item {
        display: flex;
        justify-content: space-between;
        margin-bottom: 15px;
        font-size: 1rem;
      }

      .summary-total {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
        padding-top: 20px;
        border-top: 1px solid #ddd;
        font-weight: 600;
        font-size: 1.2rem;
      }

      .total-price {
        color: #4caf50;
        font-weight: 700;
      }

      .form-group {
        margin-bottom: 20px;
      }

      label {
        display: block;
        margin-bottom: 8px;
        font-weight: 500;
        color: #555;
      }

      .form-control {
        width: 100%;
        padding: 12px 15px;
        border: 1px solid #ddd;
        border-radius: 6px;
        font-size: 1rem;
        font-family: inherit;
        transition: border-color 0.3s;
      }

      .form-control:focus {
        border-color: #1c3361;
        outline: none;
        box-shadow: 0 0 0 3px rgba(28, 51, 97, 0.1);
      }

      .btn-primary {
        display: block;
        width: 100%;
        background-color: #1c3361;
        color: white;
        border: none;
        border-radius: 6px;
        padding: 14px;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s;
        margin-top: 20px;
      }

      .btn-primary:hover {
        background-color: #2a4580;
        transform: translateY(-2px);
      }

      .secure-badge {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
        margin-top: 15px;
        color: #777;
        font-size: 0.9rem;
      }

      .store-info {
        text-align: center;
        margin-top: 40px;
        padding-top: 20px;
        border-top: 1px solid #eee;
        color: #777;
      }

      .store-name {
        font-weight: 700;
        color: #1c3361;
        font-size: 1.2rem;
        margin-bottom: 5px;
      }

      @media (max-width: 768px) {
        .checkout-wrapper {
          flex-direction: column-reverse;
        }
      }
    </style>
  </head>

  <body>
    <div class="container">
      <h1 class="page-title">Checkout</h1>

      <div class="checkout-wrapper">
        <div class="checkout-form">
          <h2 class="section-title">Thông Tin Nhận Hàng</h2>

          <form:form
            action="/create/order"
            method="post"
            modelAttribute="UserInfRec"
          >
            <div>
              <input
                type="hidden"
                name="${_csrf.parameterName}"
                value="${_csrf.token}"
              />
            </div>

            <div class="form-group">
              <label for="receiverName">Họ Tên</label>
              <form:input
                type="text"
                class="form-control"
                id="receiverName"
                placeholder="Nhập họ tên người nhận"
                path="receiverName"
              />
            </div>

            <div class="form-group">
              <label for="receiverAddress">Địa Chỉ</label>
              <form:input
                type="text"
                class="form-control"
                id="receiverAddress"
                placeholder="Nhập địa chỉ giao hàng"
                path="receiverAddress"
              />
            </div>

            <div class="form-group">
              <label for="receiverPhone">Số Điện Thoại</label>
              <form:input
                type="text"
                class="form-control"
                id="receiverPhone"
                placeholder="Nhập số điện thoại liên hệ"
                path="receiverPhone"
              />
            </div>

            <button class="btn-primary" type="submit">
              <i class="fa-solid fa-check me-2"></i> Xác Nhận Đặt Hàng
            </button>

            <div class="secure-badge">
              <i class="fa-solid fa-shield-halved"></i>
              Thông tin của bạn được bảo mật an toàn
            </div>
          </form:form>
        </div>

        <div class="order-summary">
          <h2 class="section-title">Đơn Hàng Của Bạn</h2>

          <div class="summary-item">
            <span>Tạm Tính:</span>
            <span>
              <fmt:formatNumber type="number" value="${sums}" /> Vnd
            </span>
          </div>

          <div class="summary-item">
            <span>Chiết Khấu:</span>
            <span>0 Vnd</span>
          </div>

          <div class="summary-item">
            <span>Giảm Giá:</span>
            <span>0 Vnd</span>
          </div>

          <div class="summary-item">
            <span>Phí Vận Chuyển:</span>
            <span>0 Vnd</span>
          </div>

          <div class="summary-item">
            <span>Hình Thức Thanh Toán:</span>
            <span>Thanh Toán Khi Nhận Hàng</span>
          </div>

          <div class="summary-total">
            <span>Thành Tiền:</span>
            <span class="total-price">
              <fmt:formatNumber type="number" value="${sums}" /> Vnd
            </span>
          </div>
        </div>
      </div>

      <div class="store-info">
        <div class="store-name">Laptop Shop</div>
        <p>Cảm ơn bạn đã mua sắm tại cửa hàng của chúng tôi</p>
      </div>
    </div>
  </body>
</html>
