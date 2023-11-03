document.addEventListener("DOMContentLoaded", function () {
    var gridDiv = document.getElementById("Grid");
    var showGridLink = document.getElementById("showGridLink");

    showGridLink.addEventListener("click", function (event) {
        event.preventDefault(); // Ngăn chặn chuyển hướng trang web
        gridDiv.style.display = "block"; // Hiển thị div khi liên kết được click
    });
});
