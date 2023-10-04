<?php

require_once '../Models/personasModel.php';

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
      "nombres"     => $_POST['nombres'],
      "apellidos"   => $_POST['apellidos'],
      "sexo"        => $_POST['sexo'],
      "telefono"   => $_POST['telefono'],
      "correo"    => $_POST['correo'],
      "direccion" => $_POST['direccion'],
      "fechaNac" => $_POST['fechaNac'],
      "tipoDoc" => $_POST['tipoDoc'],
      "numDoc" => $_POST['numDoc']
    ];

    $respuesta = $persona->registrarPersonas($datosGuardar);
    echo json_encode($respuesta);
  }

  if($_POST['op'] == 'eliminar'){
    $respuesta = $persona->eliminar($_POST['idpersona']);
    echo json_encode($respuesta);
  }

  if($_POST['op'] == 'obtener'){
    $respuesta = $persona->obtener($_POST['idpersona']);
    echo json_encode($respuesta);
  }

  if($_POST['op'] == 'actualizar'){
    $datosActualizar = [
      "idpersona" => $_POST['idpersona'],
      "nombres" => $_POST['nombres'],
      "apellidos" => $_POST['apellidos'],
      "sexo" => $_POST['sexo'],
      "telefono" => $_POST['telefono'],
      "correo" => $_POST['correo'],
      "direccion" => $_POST['direccion'],
      "fechaNac" => $_POST['fechaNac'],
      "tipoDoc" => $_POST['tipoDoc'],
      "numDoc" => $_POST['numDoc']
    ];
    $respuesta = $persona->actualizar($datosActualizar);
    echo json_encode($respuesta);
  }
}

?>
