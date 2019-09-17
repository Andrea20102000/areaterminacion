<?php

$hostname='localhost';
$database='terminacion';
$username='root';
$password='';
$encode="utf8_encode";

$conexion=new mysqli($hostname,$username,$password,$database);
if($conexion->connect_errno){
    echo "Lo sentimos, el sitio web está experimentando problemas";
}
?>
