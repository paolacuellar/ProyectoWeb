function fechaActual(){
    var dtToday = new Date();

    var month = dtToday.getMonth() + 1;
    var day = dtToday.getDate();
    var year = dtToday.getFullYear();

    if(month < 10)
        month = '0' + month.toString();
    if(day < 10)
        day = '0' + day.toString();

    var maxDate = year + '-' + month + '-' + day;    
    $('.Fecha').attr('max', maxDate);
};

function vEmail(){
    var email=document.getElementById("email").value;
    var txEmail= document.getElementById("txEmail");
    var pattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
            
    if(email.match(pattern)){
        txEmail.innerHTML="";
        txEmail.style.color="#00ff00";
    } else {
        txEmail.innerHTML="Ingresa un email valido";
        txEmail.style.color="#ff0000";
    }
    
    if(email== ""){
        txEmail.innerHTML="";
        txEmail.style.color="#00ff00";
    }
}

function vPass(){
    var pass=document.getElementById("pass").value;
    var txPass= document.getElementById("txPass");
    var pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
    
    if(pass.match(pattern)){
        txPass.innerHTML="";
        txPass.style.color="#00ff00";
    } else {
        txPass.innerHTML="Contraseña no valida.\n\
Debe tener:\n\
Al menos 8 caracteres. \n\
Una letra mayuscula y una minuscula. \n\
Un numero. \n\
Un signo de puntuacion";
        txPass.style.color="#ff0000";
    }
    
    if(pass== ""){
        txPass.innerHTML="";
        txPass.style.color="#00ff00";
    }
}

function vconfirmPass(){
    var pass=document.getElementById("pass");
    var confirmpass=document.getElementById("confirmpass");
    var txPass= document.getElementById("txPass");
    
    if(pass.value!=confirmpass.value){
        txPass.innerHTML="Contraseña debe ser igual";
        txPass.style.color="#ff0000";
        
    }else{
        txPass.innerHTML="";
        txPass.style.color="#00ff00";
    }
    
    if(confirmpass== ""){
        txPass.innerHTML="";
        txPass.style.color="#00ff00";
    }
}


