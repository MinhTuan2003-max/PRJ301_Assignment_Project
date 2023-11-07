// Lấy tham chiếu đến các trường nhập ngày
var startDateInput = document.getElementById("startDate");
var endDateInput = document.getElementById("endDate");

// Lắng nghe sự kiện onChange trên cả hai trường nhập ngày
startDateInput.addEventListener("change", updateView);
endDateInput.addEventListener("change", updateView);

// Hàm cập nhật URL và gửi yêu cầu tự động
function updateView() {
    var startDate = startDateInput.value;
    var endDate = endDateInput.value;

    // Tạo URL cần gửi yêu cầu đến (thay thế "/timetable" bằng URL của trang hiển thị thời khoá biểu)
    var newURL = "${pageContext.request.contextPath}/timetable?startDate=" + startDate + "&endDate=" + endDate;

    // Chuyển hướng đến URL mới
    window.location.href = newURL;
}

