/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */
function validateLoginForm() {
    console.log("validateLoginForm function called");
    var selectedCampus = document.getElementById("studentLecturerCampusSelect").value;

    if (selectedCampus === "studentLecturerCampusSelect") {
        alert("Please select campus to join");
        return false;
    }
    return true;
}



