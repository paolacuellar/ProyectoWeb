
<%@page import="java.util.Iterator"%>
<%@page import="com.dbconnection.models.NoteModel"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%
        List<NoteModel> notes=(List<NoteModel>)request.getAttribute("notes");
        Iterator<NoteModel> iter = notes.iterator();
        NoteModel element;
        
    %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--<link rel="stylesheet" href="style-dashboard.css">-->
    <link rel="stylesheet" href="css/style-menu.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="js/Buscador.js"></script>
    <script type="text/javascript" src="js/paginacion.js"></script>    
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="shortcut icon" href="favicon.png">
    <title>Your Notes</title>
        <script type="text/javascript">
	$(function(){
		$("#datos").pagination();
	});
    </script>
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
          <div id="note-list">
            <table  id="datos" number-per-page="5" current-page="" class="note-list">
                <%
                //for (NoteModel element: notes){
                while (iter.hasNext()){
                element=iter.next();
                %>
                <tbody>
                <tr class="card" style="padding: 10px;margin: 20px;">
                    <td class="card-body" style="margin: 10px;">
                        <p id="Contenido">
                        <%= element.getDescription()%>
                        </p>
                    </td>
                    <td class="card-body" style="margin: 10px;">
                        <span class="tag" style="
                            background: linear-gradient(to right, #ccccff, #524a9d);
                            padding: .25em .75em;
                            border-radius: 1em;
                            font-size: .75rem;
                            color: #fafafa;
                        ">#<%= element.getIdHashtag().getName()%></span>
                    </td>
                    <td class="card-body" style="margin: 10px;">
                        <a href="./ShowNoteController?id=<%=element.getId()%>">
                        <input type="button" value="Editar" style="
                            background:#524a9d;
                            border-radius: 10px;
                            border: 0;
                            outline: none;
                            color: #fff;
                            cursor: pointer;
                            padding: 8px;
                        ">
                        </a>
                    </td>
                    <td class="card-body" style="margin: 10px;">
                        <form action="./DeleteNoteController" method="POST">
                            <!--<label for="btnBorrar"><i class='fa fa-trash' ></i></label>
                            <input type="submit"  name="idNota" id="btnBorrar" value="<%=element.getId()%>" style="display: none;">-->
                        <label>Borrar Nota No.</label>
                        <input type="submit"  name="idNota" id="<%=element.getId()%>" value="<%=element.getId()%>" style="
                            width: 35px;
                            height: 35px;
                            background:#524a9d;
                            border-radius: 10px;
                            border: 0;
                            outline: none;
                            color: #fff;
                            cursor: pointer;
                            padding: 8px;
                        ">
                        </form>
                    </td>
                </tbody>
                <%
                }
                %>
            </table>
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
    
</body>
</html>
