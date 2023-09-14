<?php

require_once 'conexion.php';

class Persona extends Conexion{
  private $conexion;

  public function __CONSTRUCT(){
    $this->conexion = parent::getConexion();
  }

  public function listarPersonas(){
    try{
      $consulta = $this->conexion->prepare("#");
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
      $consulta = $this->conexion->prepare("#");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["#"],
          $datos["#"],
          $datos["#"],
          $datos["#"],
          $datos["#"],
          $datos["#"],
          $datos["#"]
        )
        );
    }catch(Exception $e){
      $respuesta["message"] = "No se ah podido completar el proceso. codigo de Error ". $e->getCode();
    }
    return $respuesta;
  }

  public function eliminar($idPersona = 0){
    $respuesta = [
      "status" => false,
      ",essage"=> ""
    ];
    try{
      $consulta = $this->conexion->prepare("#");
      $respuesta["status"] = $consulta->execute(array($idPersona));
    }
    catch(Exception $e){
      $respuesta["message"] = "No se ah podido completar el proceso. Codigo de error ". $e->getCode();
    }

    return $respuesta;
  }

  public function obtener($idPersoan = 0){
    try{
      $consulta = $this->conexion->prepare("#");
      $consulta->execute(array($idPersona));
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
      $consulta = $this->conexion->prepare("#");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["#"],
          $datos["#"],
          $datos["#"],
          $datos["#"],
          $datos["#"],
          $datos["#"],
          $datos["#"],
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