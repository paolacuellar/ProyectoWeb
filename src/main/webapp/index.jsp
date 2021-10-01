<%-- 
    Document   : index
    Created on : 20 sep. 2021, 1:08:08
    Author     : ae_sq
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title>Your notes</title> 
        <link rel="shortcut icon" href="favicon.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style-registro.css"/>
        <style>
            img{
                position: absolute;
                top: 30px;
                left: 40px;
                transition: 0.5s;
            }
            #Form0{
                top: 300px;
            }
            body.active img{
                left: 450px;
                transition: 0.5s;
            }
            body.active2 img{
                left: -450px;
                transition: 0.5s;
            }
        </style>
    </head>
    <body>
        <!-- Inicio de sesion
        Nombre de Usuario
        Contraseña
        -->
        
        <!-- registro
        Nombre(s)
        Apellidos
        Fecha de nacimiento
        Correo
        Imagen de perfil
        Nombre de usuario
        Contraseña
        Confirmar contraseña
        -->
        <div class="container">
           <img src="logo.png" height="280" width="280"/>
           <form id="Form0">
                <div class="btn-box">
                    <button type="button" id="Inicio"> YA TENGO CUENTA </button>
                    <button type="button" id="Crear"> QUIERO REGISTRARME </button>
                </div>
              
           </form> 
           <form id="FormContainer" action="./SignInController" method="POST" enctype="multipart/form-data">
            <div class="tab">
                <h3>DATOS PERSONALES</h3>
                <input type="text" name="name" placeholder="Nombre completo" pattern="[A-Za-z]+" required>
                
                <input type="date" name="dob" class="Fecha" placeholder="Fecha de nacimiento" required>
                <span></span>
            </div>
            <div class="tab">
                <h3>CREAR CUENTA</h3>
                <input type="text" name="email" id= "email" placeholder="Correo" required onkeydown="vEmail()">
                <span id="txEmail"></span>
                <input type="password" name="pass" id= "pass" placeholder="Password" required onkeydown="vPass()">
                <span id="txPass"></span>
                <input type="password" id="confirmpass" placeholder="Confirmar Password" required onkeydown="vconfirmPass()">
            </div>
            <div class="tab">
                <h3>DATOS DE LA CUENTA</h3>
                <input type="file" name="image" placeholder="Imagen de perfil" required>
                <input type="text" name="nickname" placeholder="Nombre de Usuario" required>
            </div>
            <div style="overflow:auto;">
                <div class="btn-box">
                  <button type="button" id="prevBtn" onclick="nextPrev(-1)">ANTERIOR</button>
                  <button type="button" id="nextBtn" onclick="nextPrev(1)">SIGUIENTE</button>
                </div>
              </div>
           </form>  
            
           <form id="Form4" action="./LogInController" method="POST">
            <h3>INICIAR SESION</h3>
            <input type="text" name="nickname" placeholder="Usuario" required>
            <input type="password" name="pass" placeholder="Password" required>
            
            <div class="btn-box">
                <button type="button" id="Ant3"> ANTERIOR </button>
                <button type="Submit" > INICIAR SESION </button>
            </div>
          </form>   
            
            <div class="step-row">
                <div id="progress"></div>
                <div class="step-col"><small>Paso 1</small></div>
                <div class="step-col"><small>Paso 2</small></div>
                <div class="step-col"><small>Paso 3</small></div>
            </div>
        </div>

        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/validation.js"></script>
        <script src="js/formValidation.js"></script>
        <script>
            const body=document.querySelector('body');

            
            var FormContainer= document.getElementById("FormContainer");
            var Form1= document.getElementById("Form1");
            var Form2= document.getElementById("Form2");
            var Form3= document.getElementById("Form3");
            
            var Crear= document.getElementById("Crear");
            var Sig1= document.getElementById("Sig1");
            var Ant1= document.getElementById("Ant1");
            var Sig2= document.getElementById("Sig2");
            var Ant2= document.getElementById("Ant2");
            var prevBtn=document.getElementById("prevBtn");
            var nextBtn=document.getElementById("nextBtn");
            
            //var progress= document.getElementById("progress");

            fechaActual();
            vEmail();
            vPass();
            vconfirmPass();
            
            Crear.onclick = function(){
                Form0.style.left = "-450px";
                FormContainer.style.left = "40px";
                body.classList.add('active2');
  
            }
            Inicio.onclick = function(){
                Form0.style.left = "450px";
                Form4.style.left = "40px";
                body.classList.add('active');
            }
            /*prevBtn.onclick = function(){
                w-=120;
                var progress = document.getElementById("progress");
                $(progress).css("width", w);
    
            }
            document.getElementById("nextBtn").onclick = function(){
                w+=120;
                var progress = document.getElementById("progress");
                $(progress).css("width", w);
    
            }*/
            /* Ant0.onclick = function(){
                Form0.style.left = "40px";
                Form1.style.left = "450px";
                body.classList.remove('active2');
                
            }
            Sig1.onclick = function(){
                Form1.style.left = "-450px";
                Form2.style.left = "40px";
                progress.style.width = "240px";
            }
            Ant1.onclick = function(){
                Form1.style.left = "40px";
                Form2.style.left = "450px";
                progress.style.width = "120px";
            }
            Sig2.onclick = function(){
                Form2.style.left = "-450px";
                Form3.style.left = "40px";
                progress.style.width = "360px";
            }
            Ant2.onclick = function(){
                Form2.style.left = "40px";
                Form3.style.left = "450px";
                progress.style.width = "240px";
            }
             Ant3.onclick = function(){
                Form0.style.left = "40px";
                Form4.style.left = "-450px";
                body.classList.remove('active');
            }*/
            
            
        </script>   
    </body>
</html>
