<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Matriculas</title>
    <link rel="stylesheet" href="./css/index.css" />
    <link rel="stylesheet" href="./css/estilos.css" />
    <link
      href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
      rel="stylesheet"
    />
  </head>
  <body>
    <nav class="sidebar close">
      <header>
        <div class="text logo">
          <span class="name">CEO</span>
          <span class="profe">Olympus</span>
        </div>
        <i class="bx bx-menu toogle"></i>
      </header>

      <div class="menu-bar">
        <div class="menu">
          <li class="search-box">
            <i class="bx bx-search icon"></i>
            <input type="text" placeholder="Buscar.." />
          </li>

          <ul class="menu-links">
            <li class="nav-link">
              <a href="index.php?view=dashboard">
                <i class="bx bx-home-alt icon"></i>
                <span class="text nav-text">Dashboard</span>
              </a>
            </li>

            <li class="nav-link">
              <a href="index.php?view=personas">
                <i class="bx bxs-group icon"></i>
                <span class="text nav-text">Personas</span>
              </a>
            </li>

            <li class="nav-link">
              <a href="index.php?view=estudiantes">
                <i class="bx bxs-backpack icon"></i>
                <span class="text nav-text">Estudiantes</span>
              </a>
            </li>

            <li class="nav-link">
              <a href="index.php?view=docentes">
                <i class="bx bxs-graduation icon"></i>
                <span class="text nav-text">Docentes</span>
              </a>
            </li>

            <li class="nav-link">
              <a href="index.php?view=cursos">
                <i class="bx bx-library icon"></i>
                <span class="text nav-text">Cursos</span>
              </a>
            </li>

            <li class="nav-link">
              <a href="index.php?view=matriculas">
                <i class="bx bxs-receipt icon"></i>
                <span class="text nav-text">Matriculas</span>
              </a>
            </li>

            <li class="nav-link">
              <a href="index.php?view=pagos">
                <i class="bx bxs-credit-card icon"></i>
                <span class="text nav-text">Pagos</span>
              </a>
            </li>

            <li class="nav-link">
              <a href="index.php?view=reportes">
                <i class="bx bxs-report icon"></i>
                <span class="text nav-text">Reportes</span>
              </a>
            </li>
          </ul>
        </div>

        <div class="bottom-content">
          <li class="">
            <a href="#">
              <i class="bx bx-log-out icon"></i>
              <span class="text nv-text">salir</span>
            </a>
          </li>

          <li class="mode">
            <div class="sun-moon">
              <i class="bx bx-moon icon moon"></i>
              <i class="bx bx-sun icon sun"></i>
            </div>
            <span class="mode-text text">Modo oscuro</span>
            <div class="toogle-switch">
              <span class="switch"></span>
            </div>
          </li>
        </div>
      </div>
    </nav>

    <section class="home" id="contenido-asincrono">
      <div class="text">Dashboard</div>
    </section>

    <script src="./js/index.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <script>

      $(document).ready(function (){
        function getURL(){
            //1. Obtener la URL
            const url = new URL(window.location.href);
            //2. Obtener el valor enviado por la URL
            const vista = url.searchParams.get("view") + '.php';
            //3. Enviando a contenedor
            if (vista != null){
              $("#contenido-asincrono").load(`./content/${vista}`);
            }
          }
  
          getURL();
      });


    </script>

  </body>
</html>
