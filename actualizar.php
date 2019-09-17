<?php
include 'conexion.php';
$pedido=$_POST['pedido'];
$cliente=$_POST['cliente'];
$referencia=$_POST['referencia'];
$color=$_POST['color'];
$tipotalla=$_POST['tipotalla'];
$cantidad=$_POST['cantidad'];

$consulta="UPDATE general SET cliente = '$cliente', referencia = '$referencia', color = '$color', tipotalla = '$tipotalla', cantidad = '$cantidad' WHERE pedido = '$pedido'";

mysqli_query($conexion,$consulta) or die (mysqli_error());
mysqli_close($conexion);



?>
