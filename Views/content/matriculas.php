<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Matriculas</title>

  <link
      href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
      rel="stylesheet"
    />

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>

 <div class="container">
  <div class="card" style="width: 80rem;">
    <div class="card-body">
      <h5 class="card-title">Matriculas</h5>
      <br>

      <div class="row g-3">
        <div class="col-md-9">
          <button type="button" class="btn btn-outline-secondary">
            <i class="bx bxs-report icon"></i>  
            Descargar
          </button>
          <br>
          <br>
        </div>
        
        <div class="col-md-3">
          <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#MDmatricula">
          <i class='bx bx-message-square-add bx-rotate-270' ></i>
          Nueva Matricula
          </button>        
        </div>
      </div>     
        
      <div class="row g-3">
        <div class="col-md-3">
          <label for="" class="form-label">Taller:</label>
          <select class="form-select" name="filtro-taller" id="filtroTaller">
            <option value="">Seleccione:</option>
          </select>
        </div>

        <div class="col-md-3">
          <label for="" class="form-label">Nivel:</label>
          <select class="form-select" name="filtro-taller" id="filtroTaller">
            <option value="">Seleccione:</option>
          </select>
        </div>

        <div class="col-md-3">
          <label for="" class="form-label">Curso:</label>
          <select class="form-select" name="filtro-taller" id="filtroTaller">
            <option value="">Seleccione:</option>
          </select>
        </div>

        <div class="col-md-1">
          <br>
          <button type="button" class="btn btn-outline-secondary">
            <i class='bx bx-filter-alt'></i>
            filtrar
          </button>        
        </div>  
      </div>
    </div>
  </div>

  <div class="modal fade" id="MDmatricula" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog justify-content-center align-items-center">
      <div class="modal-content" style="width: 120vh;">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar matricula</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div class="row g-3">
            <h5>Datos del estudiante</h5>
            <div class="col-md-6">
              <input type="text" class="form-control" placeholder="DNI:" aria-label="Recipient's username" aria-describedby="button-addon2">
              <button class="btn btn-outline-secondary" type="button" id="btBuscarMd">Buscar</button>
            </div>           
            <div class="col-md-6">
              <input type="text" class="form-control" placeholder="Fecha nacimiento:" aria-label="First name">
            </div>         
          </div>
          <div class="row g-3">
            <div class="col-md-6">
              <input type="text" class="form-control" placeholder="Nombres:" aria-label="First name">
            </div>
            <div class="col-md-6">
              <input type="text" class="form-control" placeholder="Apellidos:" aria-label="Last name">
            </div>
          </div>
          <hr>
          <h5>Datos de matricula</h5>
          <div class="row g-3">        
            <div class="col-md-3">
              <label for="" class="form-label">Taller:</label>
              <select class="form-select" name="MD-taller" id="MDTaller">
                <option value="">Seleccione:</option>
              </select>
            </div>

            <div class="col-md-3">
              <label for="" class="form-label">Observacion:</label>
              
            </div>

            <div class="col-md-6">
              <label for="" class="form-label">Curso:</label>
              
            </div>
            
          
          </div>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </div>
    </div>
  </div>

  <div>
    <br>
    <br>
  </div>
  
  <div class="row">
    <div class="col-md-12">
      <table id="tabla-matriculas" class="table">
        <thead class="table-info">
          <th>Id</th>
          <th>Estudiantes</th>
          <th>Apoderado</th>
          <th>Taller</th>
          <th>Curso</th>
          <th>Fecha</th>
          <th>Precio</th>
          <th>Observacion</th>
          <th>Comandos</th>
        </thead>
        <tbody></tbody>
      </table>
    </div>
  </div>
</div>
  
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>

</body>
</html>