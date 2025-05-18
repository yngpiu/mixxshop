<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
    />
    <title>Đăng ký | Laptop Shop</title>
    <style>
      :root {
        --primary-color: #4361ee;
        --secondary-color: #3f37c9;
        --accent-color: #4895ef;
        --bg-color: #f8f9fa;
        --text-color: #212529;
        --light-text: #6c757d;
        --error-color: #e63946;
        --success-color: #2a9d8f;
      }

      body {
        background-color: var(--bg-color);
        font-family: 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
      }

      .register-container {
        width: 100%;
        max-width: 1000px;
        background-color: #fff;
        border-radius: 20px;
        overflow: hidden;
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        display: flex;
        min-height: 660px;
      }

      .register-image {
        flex: 1;
        background-image: linear-gradient(
            rgba(63, 55, 201, 0.7),
            rgba(72, 149, 239, 0.7)
          ),
          url('https://images.unsplash.com/photo-1587614382346-4ec70e388b28?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
        background-size: cover;
        background-position: center;
        display: flex;
        flex-direction: column;
        justify-content: center;
        padding: 40px;
        color: white;
        position: relative;
      }

      .register-image-content {
        z-index: 1;
      }

      .register-image h2 {
        font-size: 2.2rem;
        font-weight: 700;
        margin-bottom: 15px;
      }

      .register-image p {
        font-size: 1.1rem;
        line-height: 1.7;
        margin-bottom: 20px;
        opacity: 0.9;
      }

      .register-image ul {
        list-style-type: none;
        padding-left: 0;
        margin-top: 20px;
      }

      .register-image li {
        margin-bottom: 10px;
        display: flex;
        align-items: center;
      }

      .register-image li i {
        margin-right: 10px;
        color: var(--accent-color);
      }

      .register-form {
        flex: 1;
        padding: 50px 40px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        overflow-y: auto;
      }

      .register-form h1 {
        font-weight: 700;
        color: var(--text-color);
        margin-bottom: 10px;
        font-size: 2rem;
      }

      .register-subtitle {
        color: var(--light-text);
        margin-bottom: 30px;
        font-size: 1rem;
      }

      .form-floating {
        margin-bottom: 20px;
        position: relative;
      }

      .form-floating input {
        height: 55px;
        border-radius: 10px;
        border: 1px solid #ced4da;
        padding: 15px 15px 0;
        font-size: 1rem;
      }

      .form-floating input:focus {
        border-color: var(--primary-color);
        box-shadow: 0 0 0 0.2rem rgba(67, 97, 238, 0.25);
      }

      .form-floating label {
        padding: 15px;
      }

      .name-fields {
        display: flex;
        gap: 15px;
      }

      .name-fields .form-floating {
        flex: 1;
      }

      .error-message {
        color: var(--error-color);
        font-size: 0.85rem;
        margin-top: 5px;
        display: flex;
        align-items: center;
      }

      .error-message i {
        margin-right: 5px;
      }

      .error-box {
        color: var(--error-color);
        font-size: 0.9rem;
        padding: 8px 12px;
        border-radius: 8px;
        margin-bottom: 20px;
        background-color: rgba(230, 57, 70, 0.1);
        display: flex;
        align-items: center;
      }

      .error-box i {
        margin-right: 10px;
      }

      .btn-primary {
        background-color: var(--primary-color);
        border: none;
        border-radius: 10px;
        padding: 12px;
        height: 50px;
        font-weight: 600;
        font-size: 1rem;
        transition: all 0.3s ease;
        margin-bottom: 20px;
      }

      .btn-primary:hover {
        background-color: var(--secondary-color);
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
      }

      .login-link {
        text-align: center;
        margin-top: 15px;
        color: var(--light-text);
      }

      .login-link a {
        color: var(--primary-color);
        text-decoration: none;
        font-weight: 600;
      }

      .login-link a:hover {
        text-decoration: underline;
      }

      .password-requirements {
        margin-top: 15px;
        margin-bottom: 25px;
        padding: 15px;
        background-color: rgba(67, 97, 238, 0.05);
        border-radius: 10px;
      }

      .password-requirements h6 {
        color: var(--primary-color);
        margin-bottom: 10px;
        font-size: 0.9rem;
        font-weight: 600;
      }

      .password-requirements ul {
        list-style-type: none;
        padding-left: 0;
        margin-bottom: 0;
      }

      .password-requirements li {
        font-size: 0.8rem;
        color: var(--light-text);
        margin-bottom: 5px;
        display: flex;
        align-items: center;
      }

      .password-requirements li i {
        margin-right: 8px;
        font-size: 0.7rem;
      }

      .divider {
        text-align: center;
        margin: 20px 0;
        position: relative;
      }

      .divider:before,
      .divider:after {
        content: '';
        width: calc(50% - 20px);
        height: 1px;
        background-color: #ced4da;
        position: absolute;
        top: 50%;
      }

      .divider:before {
        left: 0;
      }

      .divider:after {
        right: 0;
      }

      .divider span {
        background-color: #fff;
        padding: 0 10px;
        font-size: 0.9rem;
        color: var(--light-text);
        position: relative;
        z-index: 1;
      }

      @media (max-width: 768px) {
        .register-container {
          flex-direction: column;
        }

        .register-image {
          display: none;
        }

        .register-form {
          padding: 40px 20px;
        }

        .name-fields {
          flex-direction: column;
          gap: 10px;
        }
      }
    </style>
  </head>
  <body>
    <div class="register-container">
      <div class="register-image">
        <div class="register-image-content">
          <h2>Tham gia cùng Laptop Shop</h2>
          <p>
            Đăng ký để trở thành thành viên của gia đình Laptop Shop và nhận
            nhiều ưu đãi hấp dẫn!
          </p>

          <ul>
            <li>
              <i class="fas fa-check-circle"></i> Ưu đãi đặc biệt dành riêng cho
              thành viên
            </li>
            <li>
              <i class="fas fa-check-circle"></i> Lưu trữ lịch sử mua hàng và
              theo dõi đơn hàng
            </li>
            <li>
              <i class="fas fa-check-circle"></i> Thanh toán nhanh chóng, an
              toàn
            </li>
            <li>
              <i class="fas fa-check-circle"></i> Hỗ trợ kỹ thuật ưu tiên 24/7
            </li>
          </ul>
        </div>
      </div>
      <div class="register-form">
        <h1>Đăng ký tài khoản</h1>
        <p class="register-subtitle">Tạo tài khoản mới để bắt đầu mua sắm</p>

        <form:form action="/register" method="post" modelAttribute="regisNew">
          <c:if test="${emailExist}">
            <div class="error-box">
              <i class="fas fa-exclamation-circle"></i>
              Email đã tồn tại trong hệ thống, vui lòng sử dụng email khác.
            </div>
          </c:if>

          <c:if test="${showMess}">
            <div class="error-box">
              <i class="fas fa-exclamation-circle"></i>
              Mật khẩu xác nhận không khớp, vui lòng thử lại.
            </div>
          </c:if>

          <div class="name-fields">
            <div class="form-floating">
              <form:input
                type="text"
                class="form-control"
                id="firstName"
                path="firstName"
                placeholder="Họ"
                required="required"
              />
              <label for="firstName">Họ</label>
              <form:errors path="firstName" cssClass="error-message">
                <i class="fas fa-exclamation-circle"></i>
              </form:errors>
            </div>

            <div class="form-floating">
              <form:input
                type="text"
                class="form-control"
                id="lastName"
                path="lastName"
                placeholder="Tên"
                required="required"
              />
              <label for="lastName">Tên</label>
              <form:errors path="lastName" cssClass="error-message">
                <i class="fas fa-exclamation-circle"></i>
              </form:errors>
            </div>
          </div>

          <div class="form-floating">
            <form:input
              type="email"
              class="form-control"
              id="email"
              path="email"
              placeholder="Email"
              required="required"
            />
            <label for="email">Email</label>
            <form:errors path="email" cssClass="error-message">
              <i class="fas fa-exclamation-circle"></i>
            </form:errors>
          </div>

          <div class="form-floating">
            <form:input
              type="password"
              class="form-control"
              id="password"
              path="password"
              placeholder="Mật khẩu"
              required="required"
            />
            <label for="password">Mật khẩu</label>
            <form:errors path="password" cssClass="error-message">
              <i class="fas fa-exclamation-circle"></i>
            </form:errors>
          </div>

          <div class="password-requirements">
            <h6>Yêu cầu mật khẩu:</h6>
            <ul>
              <li><i class="fas fa-circle"></i> Tối thiểu 8 ký tự</li>
              <li><i class="fas fa-circle"></i> Ít nhất 1 chữ cái viết hoa</li>
              <li><i class="fas fa-circle"></i> Ít nhất 1 chữ số</li>
              <li><i class="fas fa-circle"></i> Ít nhất 1 ký tự đặc biệt</li>
            </ul>
          </div>

          <div class="form-floating">
            <form:input
              type="password"
              class="form-control"
              id="repeatPassword"
              path="repeatPassword"
              placeholder="Xác nhận mật khẩu"
              required="required"
            />
            <label for="repeatPassword">Xác nhận mật khẩu</label>
            <form:errors path="repeatPassword" cssClass="error-message">
              <i class="fas fa-exclamation-circle"></i>
            </form:errors>
          </div>

          <button type="submit" class="btn btn-primary w-100 mt-3">
            Đăng ký tài khoản
          </button>

          <div class="divider">
            <span>HOẶC</span>
          </div>

          <div class="social-login d-flex justify-content-center gap-3 mb-3">
            <button type="button" class="btn btn-outline-secondary flex-grow-1">
              <i class="fab fa-google me-2"></i> Google
            </button>
            <button type="button" class="btn btn-outline-secondary flex-grow-1">
              <i class="fab fa-facebook-f me-2"></i> Facebook
            </button>
          </div>

          <div class="login-link">
            Bạn đã có tài khoản? <a href="/login">Đăng nhập</a>
          </div>
        </form:form>
      </div>
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
