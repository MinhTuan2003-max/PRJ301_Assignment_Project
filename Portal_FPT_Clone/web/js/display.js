function showCourse(term) {
    // Hide all course details
    var courseElements = document.querySelectorAll("[id$=Course]");
    for (var i = 0; i < courseElements.length; i++) {
        courseElements[i].style.display = "none";
    }

    // Show the course details for the selected term
    var selectedCourse = document.getElementById(term + "Course");
    if (selectedCourse) {
        selectedCourse.style.display = "block";
    }
}

function showGrades(courseName) {
    // Hide all grade tables
    var gradeTables = document.querySelectorAll("[id$=Grades]");
    for (var i = 0; i < gradeTables.length; i++) {
        gradeTables[i].style.display = "none";
    }

    // Show the grade table for the selected course
    var selectedGrades = document.getElementById(courseName + "Grades");
    if (selectedGrades) {
        selectedGrades.style.display = "block";
    }
}
