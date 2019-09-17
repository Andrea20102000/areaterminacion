<?php
if (isset($_REQUEST['pedido'])&& isset($_REQUEST['cliente'])&& isset($_REQUEST['referencia'])&& isset($_REQUEST['color'])&& isset($_REQUEST['tipotalla'])&& isset($_REQUEST['canentra']) ) {

    require_once "conexion.php";

    $pedido=$_REQUEST['pedido'];
    $cliente=$_REQUEST['cliente'];
    $referencia=$_REQUEST['referencia'];
    $color=$_REQUEST['color'];
    $tipotalla=$_REQUEST['tipotalla'];
    $cantidaentra=$_REQUEST['canentra']; 

    $resultado =$conexion->query("SELECT * FROM general WHERE pedido = '$pedido'");

    
    if(mysqli_num_rows($resultado)>=1){
        while($row=$resultado->fetch_array()){
            $datos[] = array_map($encode,$row);
            $cantidaActual = $row['cantidad']; 

        }
    }

    
    $cantidadtotal = $cantidaActual+$cantidaentra;

    echo json_encode($cantidadtotal);

    $consulta=mysqli_query($conexion, "UPDATE general SET cliente = '$cliente', referencia = '$referencia', color = '$color', tipotalla = '$tipotalla', cantidad = '$cantidadtotal' WHERE pedido = '$pedido'");

    if($consulta == true){
        echo "Modificado con Exito...";       
    }else{
        echo "No se pudo Actualizar";
    }
}else{
    echo "<h3>"."Ingrese la informacion: (pedido, cliente, referencia, tipotalla, color, cantidaentra)"."</h3>";
}
?>
