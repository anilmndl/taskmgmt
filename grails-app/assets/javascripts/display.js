window.onload = function () {
    document.getElementById("display").style.display = "none"
}

function displayFunction() {
    var x = document.getElementById("display");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}