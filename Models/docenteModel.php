<?php

require_once 'conexion.php';

class Docente extends Conexion{
  private $conexion;
  
  public function __CONSTRUCT()
  {
    $this->conexion = parent::getConexion();
  }

  public function listarDocentes(){
    try{
      $consulta = $this->conexion->prepare("#");
      $consulta->execute();
      $tabla = $consulta->fetchAll(PDO::FETCH_ASSOC);
      return $tabla;
    }catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function registrarDocente($datos = []){
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
          $datos["#"]
        )
        );
    }catch(Exception $e){
      $respuesta["message"];
    }
    return $respuesta;
  }

  public function eliminar($idDocente = 0){
    $respuesta = [
      "status"
    ]
  }
}