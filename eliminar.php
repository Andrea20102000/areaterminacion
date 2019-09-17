<?php
include 'conexion.php';
$pedido=$_POST['pedido'];

$consulta="delete from general where pedido = '".$pedido."'"
mysqli_query($conexion,$consulta) or die(mysqli_error());
mysqli_close($conexion);

?>
