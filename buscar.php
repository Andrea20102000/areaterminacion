<?php

include 'conexion.php';
$pedido= $_GET['pedido'];

$consulta = "select * from general where pedido= '$pedido'";
$resultado= $conexion -> query ($consulta);

while($fila=$resultado -> fetch_array()){
    $general[] = array_map('utf8_encode', $fila);
}

echo json_encode($general);
$resultado -> close();
?>