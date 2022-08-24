<%-- 
    Document   : Perfil
    Created on : 17/11/2021, 01:13:27 AM
    Author     : PaolaAlejandra
--%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--<link rel="stylesheet" href="style-dashboard.css">-->
    <link rel="stylesheet" href="css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="js/Buscador.js"></script>
    <script type="text/javascript" src="js/paginacion.js"></script>    
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="shortcut icon" href="favicon.png">
    <title>Your Notes</title>
</head>
<body>
    
    <!--Menu-->
    <div id="menu">
        <div class="sidebar close">
      
          <div class="logo-details">
            <img src="logo.png" alt="LogoImg">
            <span class="logo_name">Your Notes</span>
          </div>
      
          <ul class="nav-links">
            <li>
              <a href="#">
                <i class='bx bx-search' ></i>
                <div class="flexsearch">
                  <div class="flexsearch--wrapper">
                    <form class="flexsearch--form" action="#" method="post">
                      <div class="flexsearch--input-wrapper">
                        <input class="flexsearch--input" onkeyup="doSearch()" type="search" placeholder="Buscar" id="buscar">
                      </div>
                    </form>
                  </div>
                </div>
              </a>
      
              <a href="./LogInController">
                <i class='bx bx-grid-alt' ></i>
                <span class="link_name">Dashboard</span>
              </a>
              <a href="./NewNote">
                <i class='bx bx-plus-circle' ></i>
                <span class="link_name">Nueva nota</span>
              </a>
              <a href="Perfil.jsp">
                <i class='bx bx-user' ></i>
                <span class="link_name">Editar perfil</span>
              </a>
            </li>
            <li>
              <div class="profile-details">
                <div class="profile-content">
                  <img src="<%= session.getAttribute("UserImage")%>" alt="profileImg">
                </div>
                <div class="name-job">
                 <div class="profile_name"><%= session.getAttribute("Usernickname")%></div>
                  <div class="job">Bienvenido</div>
                </div>
                  <form action="./LogOffController" method="POST">
                      <label for="btnCerrarSesion"><i class='bx bx-log-out' ></i></label>
                      <input type="submit" id="btnCerrarSesion" style="display: none;">
                  </form>
              </div>
            </li>
          </ul>
        </div>
        <section class="home-section">
          <div class="home-content">
            <i class='bx bx-menu' ></i>
            <span class="text">Menu</span>
          </div>
           <div class="container">
            <div class="image-profile">
                <img src="<%= session.getAttribute("UserImage")%>" alt="" width="96" height="96" class="rounded-circle me-2">
                  <!--<img src="image/profile.jpg" alt="profileImg">-->
            </div>
           <form id="FormContainer" action="./UpdateUserController" method="POST" enctype="multipart/form-data">
                <div class="tab">
                    <h3> EDITAR DATOS DE LA CUENTA</h3>
                    <input type="text" name="name" placeholder="Nombre completo" pattern="[A-Za-z]+" value="<%= session.getAttribute("UserName")%>">
                    <input type="date" name="dob" class="Fecha" placeholder="Fecha de nacimiento" value="<%= session.getAttribute("Userdob")%>">
                    <input type="text" name="email" id= "email" placeholder="Correo" value="<%= session.getAttribute("UserEmail")%>">
                    <input type="password" name="pass" id= "pass" placeholder="Password" value="<%= session.getAttribute("Password")%>">
                    <input type="text" name="nickname" placeholder="Nombre de Usuario" value="<%= session.getAttribute("Usernickname")%>">
                    <input type="file" name="image" placeholder="Imagen de perfil" value="<%= session.getAttribute("UserImage")%>" required>
                    
                </div>
                <div class="btn-box">
                    <button type="Submit" > GUARDAR CAMBIOS </button>
                </div>
            </form>  
           
        </div>
        </section>
    </div>
    <!--<iframe class="menu" src="Menu.html"></iframe>-->
    <!--Footer-->
    <!--<iframe class="footer" src="footer.html"></iframe>-->
    <!--::::Pie de Pagina::::::-->
    <footer class="pie-pagina">
        <div class="grupo-2">
            <figure>
                    <a href="#">
                        <img src="logo.png" alt="Your Notes">
                    </a>
                </figure>
            <small>&copy; 2021 <b>Your Notes</b> - Hecho con sudor y lágrimas por Arely Lara y Paola Cuéllar.</small>
        </div>
    </footer>

    <script src="js/script.js"></script>
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/validation.js"></script>
    
</body>
</html>
