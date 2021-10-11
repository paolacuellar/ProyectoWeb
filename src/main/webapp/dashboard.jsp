
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your notes</title>
    <link rel="stylesheet" href="css/style-dashboard.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="shortcut icon" href="favicon.png">
    <!-- JQuery -->
	<script type="text/javascript" src="js/libs/jquery-2.1.4.min.js"></script>	
	<!-- Nuestros modelos -->
	<script type="text/javascript" src="js/models/nota.js"></script>

    <!--<script type="text/javascript" src="js/note-controller.js"></script>-->
    

   <script type="text/javascript">
		$(document).ready(function() {
            var index=1;
            //var arregloIndex = [ ];
			$("#btnAdd").click(function(){
				var nota = new Nota();
				nota.descripcion= $("#textarea").val();
                nota.id=index;


				$(".note-list").append('<div class="note" id="'+nota.obtenerIDNota()+'"><textarea disabled>'+nota.obtenerDescripcionNota()+'</textarea><button class="btnDelete"><i class="fa fa-trash"></i></button><button class="btnEdit"><i class="fa fa-edit"></i></button></div>')
				
				$("#textarea").val("");

                index = index + 1;
                //arregloIndex.push(index);

			});
			
			$(".note-list").on("click", ".btnDelete", function(){
					$(this).parent().remove();
			});

            $(".note-list").on("click", ".btnEdit", function(){
                //alert($(this).parent().text());
                var descripcion=$(this).parent().text();
                //var idNota=$(this).parent().id;

                //alert(descripcion);

                //$(this).parent().text('')
                //$(this).parent().append('<textarea disabled>'+descripcion+'</textarea><button class="btnDelete"><i class="fa fa-trash"></i></button><button class="btnEdit"><i class="fa fa-edit"></i></button>')
				//Guardar(descripcion);

                jmgModal('miventana',{
                    title: 'Mi Nota',
                    width: 400,
                    height: 300,},
                    ['Guardar',function(textarea){
                    
                    
                    }],
                    null,
                    [descripcion]);
                    
                
            });

            /*function Guardar(Descripcion){
				$(this).parent().append('<textarea disabled>'+Descripcion+'</textarea><button class="btnDelete"><i class="fa fa-trash"></i></button><button class="btnEdit"><i class="fa fa-edit"></i></button>')
			}*/
        });
	</script>


</head>
<body>
    <!--<div class="add-note">
		<button id="btnAdd">Agregar</button>
	</div>-->
    <img src="https://github.com/mdo.png" alt="" width="96" height="96" class="rounded-circle me-2">
 
    <input type="checkbox" id="btn-modal">
    <label for="btn-modal" class="lbl-modal"><i class="fa fa-plus"></i></label>

    <div class="note-list">
		
	</div>

    <div class="modal">
        <div class="contenedor">
            <header>Nueva Nota</header>
            <label for="btn-modal">X</label>
            <div class="contenido">
                <form action="">
                    <textarea  id="textarea" class="md-textarea" placeholder="Escribir texto..." required></textarea>
                    <!--<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Delectus perspiciatis nisi, repellat labore placeat suscipit amet ad asperiores reprehenderit laborum.</p>-->
                    <button type="Submit" id="btnAdd"> Guardar </button>
            </form>
                
            </div>
        </div>
    </div>

    
    <script src="js/modales.js"></script>
</body>
</html>
