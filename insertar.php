<?php
include 'conexion.php';
$pedido=$_POST['pedido'];
$cliente=$_POST['cliente'];
$referencia=$_POST['referencia'];
$color=$_POST['color'];
$tipotalla=$_POST['tipotalla'];
$cantidad=$_POST['cantidad'];

$consulta="insert into general values ('".$pedido."','".$cliente."','".$referencia."','".$color."','".$tipotalla."','".$cantidad."')";
mysqli_query($conexion,$consulta) or die(mysqli_error());
mysqli_close($conexion);

?>
