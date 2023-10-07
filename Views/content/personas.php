<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Personas</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>

  <div class="container">
    <div class="card" style="width: 80rem;">
      <div class="card-body">
        <h5 class="card-title">Registrar personas</h5>
        <br>
        <form action="" autocomplete="off" id="form-personas" class="row g-3">

          <div class="col-md-4">
            <label for="" class="form-label">Nombres:</label>
            <input type="text" class="form-control" id="nombres">
          </div>
          <div class="col-md-4">
            <label for="" class="form-label">Apellidos:</label>
            <input type="text" class="form-control" id="apellidos">
          </div>
          <div class="col-md-4">
            <label class="form-label">Sexo:</label>
            <select class="form-select" name="tsexo" id="sexo">
              <option value="">Tipo:</option>
              <option value="M">Masculino</option>
              <option value="F">Femenino</option>
              <option value="">Indeciso</option>
            </select>
          </div>
          <div class="col-md-4">
            <label for="" class="form-label">Telefono:</label>
            <input type="text" class="form-control" id="telefono">
          </div>
          <div class="col-md-8">
            <label for="" class="form-label">Email:</label>
            <input type="email" class="form-control" id="email">
          </div>
          <div class="col-md-8">
            <label for="" class="form-label">Direccion:</label>
            <input type="text" class="form-control" id="direccion">
          </div>
          <div class="col-md-4">
            <label for="" class="form-label">Fecha nacimiento:</label>
            <input type="date" class="form-control" id="nacimiento">
          </div>
          <div class="col-md-4">
            <label class="form-label">Tipo de documento:</label>
            <select class="form-select" name="tipoDocumento" id="Tdocumento">
              <option value="">Tipo:</option>
              <option value="DNI">DNI</option>
              <option value="CarExt">Carnet Extranjeria</option>
              <option value="Pasaporte">Pasaporte</option>
            </select>
          </div>
          <div class="col-md-4">
            <label for="" class="form-label">Numero de Documento:</label>
            <input type="text" class="form-control" id="Ndocumento">
          </div>
          <div class="col-md-4">
            <br>
            <button class="btn btn-info" type="button" id="guardar">Guardar</button>
            <button class="btn btn-info" type="button" id="actualizar">Actualizar</button>
            <button class="btn btn-info" type="button" id="cancelar">Cancelar</button>
          </div>         
        </form>
    </div>
  </div>

  <div>
    <br>
    <br>
  </div>

  <div class="row">
    <div class="col-md-12">
      <table id="tabla-personas" class="table">
        <thead class="table-info">
          <th>Id</th>
          <th>Nombres</th>
          <th>Apellidos</th>
          <th>Sexo</th>
          <th>Telefono</th>
          <th>Correo</th>
          <th>Direccion</th>
          <th>Fecha Nac.</th>
          <th>Tipo Doc.</th>
          <th>Numero Doc.</th>
          <th>Comandos</th>
        </thead>
        <tbody></tbody>
      </table>
    </div>
  </div>

  <!-- SweetAlert -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  <script src="./js/sweetalert.js"></script>


  <script>

    /* 
    $(document).ready(function (){
      //Tu código...
    });
    */

    $(document).ready(function (){

      const tabla = document.querySelector("#tabla-personas");
      const cuerpoTabla = document.querySelector("tbody");
      const btGuardar = document.querySelector("#guardar");
      const btCancelar = document.querySelector("#cancelar");
      const btActualizar = document.querySelector("#actualizar")
      const formulario = document.querySelectorAll("#form-personas");    
    
      function obtenerListaPersonas(){
        const parametros = new URLSearchParams();
        parametros.append("op", "listarPersonas");

        fetch("../Controllers/personas.php", {
          method: 'POST',
          body: parametros,
        })
          .then((respuesta) => respuesta.json())
          .then((datos) => {
            console.log(datos);
            cuerpoTabla.innerHTML = ``;
            datos.forEach((element) => {
              const fila = `
              <tr>
                <td>${element.idpersona}</td>
                <td>${element.nombres}</td>
                <td>${element.apellidos}</td>
                <td>${element.sexo}</td>
                <td>${element.telefono}</td>
                <td>${element.correo}</td>
                <td>${element.direccion}</td>
                <td>${element.fechaNac}</td>
                <td>${element.tipoDoc}</td>
                <td>${element.numDoc}</td>
                <td>
                  <a href='#' class='eliminar' data-idpersona = '${element.idpersona}'>Quitar</a>
                  <a href='#' class='editar' data-idpersona = '${element.idpersona}'>Editar</a>
                </td>
              </tr>
              `;
              cuerpoTabla.innerHTML += fila;
            });
          })
          .catch((error) => {
            cuerpoTabla.innerHTML = ``;
            alert("No encontramos datos");
          });
      }

      function registrarPersonas() {
        if(confirm("¿Está seguro de registrar?")) {
          const parametros = new URLSearchParams();
          parametros.append("op", "registrarPersonas");

          parametros.append("nombres",document.querySelector("#nombres").value);
          parametros.append("apellidos",document.querySelector("#apellidos").value);
          parametros.append("sexo",document.querySelector("#sexo").value);
          parametros.append("telefono",document.querySelector("#telefono").value);
          parametros.append("correo",document.querySelector("#email").value);
          parametros.append("direccion",document.querySelector("#direccion").value);
          parametros.append("fechaNac",document.querySelector("#nacimiento").value);
          parametros.append("tipoDoc",document.querySelector("#Tdocumento").value);
          parametros.append("numDoc",document.querySelector("#Ndocumento").value);

          fetch("../Controllers/personas.php", {
            method: "POST",
            body: parametros
          })
            .then(response => response.json())
            .then(datos => {
              if(datos.status) {
                obtenerListaPersonas();
                formulario.reset();
              }else{
                mostrarPregunta();
              }
            });
        }
      }
      
      function personasUpdate(){
        if(confirm("Está seguro de actualizar")){
          const parametros = new URLSearchParams();
          parametros.append("op", "actualizar");

          parametros.append("idpersona", idpersona);
          parametros.append("nombres",document.querySelector("#nombres").value);
          parametros.append("apellidos",document.querySelector("#apellidos").value);
          parametros.append("sexo",document.querySelector("#sexo").value);
          parametros.append("telefono",document.querySelector("#telefono").value);
          parametros.append("correo",document.querySelector("#email").value);
          parametros.append("direccion",document.querySelector("#direccion").value);
          parametros.append("fechaNac",document.querySelector("#nacimiento").value);
          parametros.append("tipoDoc",document.querySelector("#Tdocumento").value);
          parametros.append("numDoc",document.querySelector("#Ndocumento").value);

          fetch("../Controllers/personas.php",{
            method: 'POST',
            body: parametros
          })
            .then(response => response.json())
            .then(datos => {
              if(datos.status){
                obtenerListaPersonas();
              }else{
                alert(datos.message);
              }
            });
        }
      }

      cuerpoTabla.addEventListener("click", (event) => {
        if(event.target.classList[0] === 'eliminar'){
          if(confirm("¿Esta seguro de eliminar?")){
            idpersona = parseInt(event.target.dataset.idpersona);

            const parametros = new URLSearchParams();
            parametros.append("op", "eliminar");
            parametros.append("idpersona", idpersona);

            fetch("../Controllers/personas.php", {
              method: 'POST',
              body: parametros
            })
              .then(response => response.json())
              .then(datos => {
                if(datos.status){
                  obtenerListaPersonas();
                }else{
                  alert(datos.message);
                }
              });
          }
        }
      });

      cuerpoTabla.addEventListener("click", (event) => {
        if(event.target.classList[0] === 'editar'){
          idpersona = parseInt(event.target.dataset.idpersona);
          console.log(event.target);

          const parametros = new URLSearchParams();
          parametros.append("op", "obtener");
          parametros.append("idpersona", idpersona);

          fetch("../Controllers/personas.php", {
            method: 'POST',
            body: parametros
          })
            .then(response => response.json())
            .then(datos => {
              console.log(datos);
              document.querySelector("#nombres").value = datos.nombres;
              document.querySelector("#apellidos").value = datos.apellidos;
              document.querySelector("#sexo").value = datos.sexo;
              document.querySelector("#telefono").value = datos.telefono;
              document.querySelector("#email").value = datos.correo;
              document.querySelector("#direccion").value = datos.direccion;
              document.querySelector("#nacimiento").value = datos.fechaNac;
              document.querySelector("#Tdocumento").value = datos.tipoDoc;
              document.querySelector("#Ndocumento").value = datos.numDoc;
            });
        }
      })

      obtenerListaPersonas();
      btGuardar.addEventListener("click", registrarPersonas);
      btActualizar.addEventListener("click", personasUpdate);
    });

  </script>


  

</body>
</html>