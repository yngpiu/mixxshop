User: +add
+edit
+delete
+view detail
+view short

Product: +add
+edit
+delete
+view detail
+view short

auth: register => first name, last name, email, password, confirm password

Mapper laf chuyen doi du lieu va thuong duoc thuc hien trong kieu can chuyen doi

khi đăng ký tài khoản phải check xem email đã tồn tại hay chưa và pass và repass có trùng nhau hay không thì mới tiếp tục

                        <div>
                            <form:select class="form-select" aria-label="Default select example" path="roless.name">
                                <form:option value="Admin">Admin</form:option>
                                <form:option value="User">User</form:option>
                            </form:select>
                        </div>

    Khi nào khách hàng đã thanh toán nhớ lưu order, orderDetail và xóa đi cart lẫn cartDetail
    tại 1 phiên đăng nhập thì 1 người dùng có 1 cart và nhiều cartDetail
    nhưng khi lưu xuống database thì 1 người dùng có nhiều order vì mua hàng các thời điểm khác nhau(ý là đặt cart này xong đặt cart khác)
    vaf 1 order thì có nhiều orderDetail
