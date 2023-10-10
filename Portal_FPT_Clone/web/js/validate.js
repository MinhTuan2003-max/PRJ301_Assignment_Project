/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */
function validateLoginForm() {
    console.log("validateLoginForm function called");
    var selectedCampus = document.getElementById("studentLecturerCampusSelect").value;
    var selectedType = document.getElementById("typeChoiceSelect").value;

    if (selectedCampus === "studentLecturerCampusSelect" || selectedType === "typeChoice") {
        alert("Please select campus and type before.");
        return false;
    }
    return true;
}

