
<%@page import="java.util.List"%>
<%@page import="com.dbconnection.models.HashtagModel"%>
<%@page import="com.dbconnection.models.NoteModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
    NoteModel element=(NoteModel)request.getAttribute("Note");
    List<HashtagModel> hashtags= (List<HashtagModel>)request.getAttribute("hashtags");
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/style-newnote.css">
    <link rel="shortcut icon" href="favicon.png">
    <title>Note</title>
</head>
<body>
    <div class="modal">
        <div class="contenedor">
            <header>Tu Nota</header>
            <a href="./LogInController">
                <label for="btn-modal">X</label>
            </a>
            <div class="contenido">
                <form action="./UpdateNoteController" method="POST">
                    <input name="idNota" type= "text" value="<%=request.getAttribute("idNote")%>" style="display: none;">
                    <textarea  name="description1" id="textarea" class="md-textarea" required><%= element.getDescription()%></textarea>
                    <select name="hashtag" id="hashtag" class ="form-control">
                        <option value="-1">#Hashtag</option>
                        <%
                            for (HashtagModel hashtag:hashtags){
                        %>
                        <option value="<%= hashtag.getId()%>">#<%= hashtag.getName()%></option>
                        <%
                            }
                        %>
                    </select>
                    <input type="Submit" id="btnAdd" value="Guardar">
                </form>     
            </div>
        </div>
    </div>
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
                        <input class="flexsearch--input" type="search" placeholder="Buscar">
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
                <i class='bx bx-log-out' ></i>
              </div>
            </li>
          </ul>
        </div>
        <section class="home-section">
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

</body>
</html>
