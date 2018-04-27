var password = document.getElementById("password")
    , confirm_password = document.getElementById("confirm_password");

function validatePassword(){
    if(password.value != confirm_password.value) {
        confirm_password.setCustomValidity("Passwords Don't Match");
    } else {
        confirm_password.setCustomValidity('');
    }
}

password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;

function validiatePhone(){
   var phone = document.getElementById("phone").value;
   var pattern =/^(\([0-9]{3}\)|[0-9]{3}-)[0-9]{3}-[0-9]{4}$/
    if(!phone.match(pattern)){
       alert("Please enter valid phone number");
       return false;
    }
    else{
       return true;
    }
}