<?php

require_once '../Models/Personas.php';

if(isset($_POST['op'])){
  $persona = new Persona();

  if($_POST['op'] == 'listarPersonas'){
    $datos = $persona->listarPersonas();

    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['op'] == 'registrarPersonas'){
    $datosGuardar = [
      "#" => $_POST['#'],
      "#" => $_POST['#'],
      "#" => $_POST['#'],
      "#" => $_POST['#'],
      "#" => $_POST['#'],
      "#" => $_POST['#'],
      "#" => $_POST['#']
    ];

    $respuesta = $persona->registrarPersonas($datosGuardar);
    echo json_encode($respuesta);
  }

  if($_POST['op'] == 'eliminar'){
    $respuesta = $persona->eliminar($_POST['idPersona']);
    echo json_encode($respuesta);
  }

  if($_POST['op'] == 'obtener'){
    $respuesta = $persona->obtener($_POST['idPersona']);
    echo json_encode($respuesta);
  }

  if($_POST['op'] == 'actualizar'){
    $datosActualizar = [
      "#" => $_POST['#'],
      "#" => $_POST['#'],
      "#" => $_POST['#'],
      "#" => $_POST['#'],
      "#" => $_POST['#'],
      "#" => $_POST['#'],
      "#" => $_POST['#']
    ];
    $respuesta = $persona->actualizar($datosActualizar);
    echo json_encode($respuesta);
  }
}

?>
