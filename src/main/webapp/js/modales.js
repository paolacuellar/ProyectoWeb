function jmgModal(id, data, ok, cancel, textarea) {
    /*  - id: un identificador para poder incluir una ventana dentro de otra
        - data: un objeto JSON con las siguientes propiedades:
            title: título de la ventana que se mostrará en su cabecera
            width: ancho del panel, en píxeles
            height: altura del panel, en vh. Por ejemplo, el valor 50 hará que la altura de la modal sea la mitad que la de la pantalla (viewport). Tanto el ancho como el alto estarán controlados desde CSS para impedir que la modal sea más grande que el viewport, sea cual sea el valor indicado en estas propiedades
            content: mensaje que mostrará la ventana. Puede ser código HTML. Desde CSS podremos especificar algunas reglas para cuando se muestre únicamente una imagen o un iframe en la modal
        - ok: opcionalmente, podemos mostrar un botón del tipo "Aceptar" u "OK". Este parámetro deberá ser un array, cuyo primer ítem será el título del botón y el segundo, una función que se ejecutará al pulsar el botón
        - cancel: opcional, con el mismo funcionamiento que el anterior, pero del tipo "Cancelar". También debe ser un array del tipo: [nombreBoton, funcionJS]
        - input: opcional, para mostrar un cuadro de texto, de la misma forma que la función prompt(). Este parámetro deberá ser un array de un único elemento: el placeholder del input. Para que se pueda mostrar este input, es necesario indicar el parámetro "ok", ya que el texto escrito se recibirá como parámetro de la función*/
        
        data=data || {}; // si no existe data, creamos un objeto vacío para evitar posteriores errores
        id="modal-"+id; // añadimos "modal-" a la id para evitar conflictos con otros elementos
        if (document.getElementById(id)==null) { // solo hace falta crearla si no existe
         var d=document.createElement("div");
         d.className="jmgmodal"; // clase para estilizarla vía CSS
         d.id=id;
         // creamos el panel interior
         var p=document.createElement("div");
         p.className="panel";
         // creamos los componentes de la cabecera: título y botón de cerrar
         var t=document.createElement("div");
         t.className="title";
         var cl=document.createElement("div");
         cl.className="close";
         cl.innerHTML='×';
         // cerramos y vaciamos la modal al pulsar el botón X
         cl.addEventListener('click',function(ev) {
          ev.preventDefault();
          var dTop=this.parentNode.parentNode;
          dTop.classList.remove("visible");
          dTop.querySelector(".panel .content").innerHTML='';
         });
         // creamos la caja donde se mostrará el contenido
         var ct=document.createElement("div");
         ct.className="content";
         // también añadimos un pie, para añadir los posibles botones
         var f=document.createElement("div");
         f.className="footer";
         /* finalmente, añadimos "t", "cl", "ct" y "f"
         (título, botón cerrar, div contenido y div footer)
         a "p" (panel interior), éste lo añadimos a "d"
         (div principal, para oscurecer el fondo), y "d"
         lo añadimos al body de la página */
         p.appendChild(t);p.appendChild(cl);p.appendChild(ct);p.appendChild(f);
         d.appendChild(p);
         document.body.appendChild(d);
        }

        // guardamos cada componente en una variable
        var mod=document.getElementById(id),
        p=mod.querySelector(".panel"),
        t=mod.querySelector(".panel .title"),
        ct=mod.querySelector(".panel .content"),
        f=mod.querySelector(".panel .footer");
        if (f==null) {
        // puede ocurrir que el footer no exista, así que lo volvemos a crear
        mod.classList.remove("nofooter");
        var f=document.createElement("div");
        f.className="footer";
        p.appendChild(f);
        }
        // rellenamos los datos
        t.innerHTML=data.title || '';
        ct.innerHTML=data.content || '';
        f.innerHTML='';
        // comprobamos que el número es válido antes de añadirlo
        if (!isNaN(data.width)) p.style.maxWidth=data.width+'px';
        if (!isNaN(data.height)) p.style.maxHeight=data.height+'px';

        // si es necesario, creamos el botón "Aceptar"
        if (ok && ok.length>1) {
            // la variable "param" se usará para devolver el valor del input
            // si no hubiera input, el valor será null
            var param={value:null};
            // si es necesario, creamos un párrafo nuevo con su input
            if (textarea && textarea.length>0) {
            var ph=document.createElement("p");
            ph.className="action";
            var txt=document.createElement("textarea");
            txt.className="action";
            txt.setAttribute("placeholder",textarea[0]);
            txt.addEventListener('keydown',function(ev) {
            // pulsar "enter" es equivalente a pulsar "aceptar"
            if (ev.keyCode==13 || ev.key=="Enter") {
                ev.preventDefault();
                mod.classList.remove("visible");
                ok[1](param.value);
            }
        }),
        // añadimos el input al párrafo, y éste al contenido
        ph.appendChild(txt); ct.appendChild(ph);
        // guardamos la referencia al input
        param=ct.querySelector("p.action > textarea.action");
        /* ponemos el foco al input, pero esperamos
        unos milisegundos para que se genere */
        setTimeout(function(){
        param.focus();
        },100);
        }
    // creamos el botón OK
    var bOk=document.createElement("button");
    bOk.className="action";
    bOk.innerHTML=ok[0];
    bOk.addEventListener('click',function(ev) {
     /* al pulsar en él, se cierra la ventana
     y se ejecuta la función indicada, devolviendo
     el valor del input (si existe) o null */
     ev.preventDefault();
     mod.classList.remove("visible");
     ok[1](param.value);
    });
    // añadimos el botón al footer
    f.appendChild(bOk);
   }

        /* esperamos unos milisegundos para que se genere,
        y añadimos la clase .visible para mostrarla desde CSS */
        setTimeout(function(){
            mod.classList.add("visible");
        },50);
   

 }