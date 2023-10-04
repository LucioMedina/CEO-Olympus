<?php

require_once 'conexion.php';

class Persona extends Conexion{
  private $conexion;

  public function __CONSTRUCT(){
    $this->conexion = parent::getConexion();
  }

  public function listarPersonas(){
    try{
      $query = "SELECT * FROM Personas ORDER BY idpersona";
      $consulta = $this->conexion->prepare($query);
      $consulta->execute();
      $tabla = $consulta->fetchAll(PDO::FETCH_ASSOC);
      return $tabla;
    }catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function registrarPersonas($datos = []){
    $respuesta = [
      "status" => false,
      "message"=> ""
    ];
    try{
      $consulta = $this->conexion->prepare("INSERT INTO Personas (nombres, apellidos, sexo, telefono, correo, direccion, fechaNac, tipoDoc, numDoc) VALUES (?,?,?,?,?,?,?,?,?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["nombres"],
          $datos["apellidos"],
          $datos["sexo"],
          $datos["telefono"],
          $datos["correo"],
          $datos["direccion"],
          $datos["fechaNac"],
          $datos["tipoDoc"],
          $datos["numDoc"]
        )
        );
    }catch(Exception $e){
      $respuesta["message"] = "No se ah podido completar el proceso. codigo de Error ". $e->getCode();
    }
    return $respuesta;
  }

  public function eliminar($idpersona = 0){
    $respuesta = [
      "status" => false,
      "message"=> ""
    ];
    try{
      $consulta = $this->conexion->prepare("CALL spu_eliminar_personas(?)");
      $respuesta["status"] = $consulta->execute(array($idpersona));
    }
    catch(Exception $e){
      $respuesta["message"] = "No se ah podido completar el proceso. Codigo de error ". $e->getCode();
    }

    return $respuesta;
  }

  public function obtener($idpersona = 0){
    try{
      $consulta = $this->conexion->prepare("CALL spu_personas_obtener(?)");
      $consulta->execute(array($idpersona));
      return $consulta->fetch(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function actualizar($datos = []){
    $respuesta = [
      "status" => false,
      "message"=> ""
    ];
    try{
      $consulta = $this->conexion->prepare("CALL spu_personas_actualizar(?,?,?,?,?,?,?,?,?,?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["idpersona"],
          $datos["nombres"],
          $datos["apellidos"],
          $datos["sexo"],
          $datos["telefono"],
          $datos["correo"],
          $datos["direccion"],
          $datos["fechaNac"],
          $datos["tipoDoc"],
          $datos["numDoc"]
        )
        );
    }
    catch(Exception $e){
      $respuesta["message"] = "No se ah podido completar el proceso. Codigo de error ". $e->getCode();
    }
    return $respuesta;
  }
}

?>