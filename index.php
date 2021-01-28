<?php
require_once "funciones.php";
require_once "bd.php";

theHeader();
?>

<h2>Últimas entradas</h2>
<ul class="listaNoticias">
<?php
$consulta = $bd->query("SELECT n.id_noticia, 
                                n.titular,
                                n.entradilla,
                                n.fecha,
                                COUNT(c.id_comentario) AS numComentarios
                         FROM noticias n
                         LEFT JOIN comentarios c ON c.id_noticia = n.id_noticia
                         GROUP BY n.id_noticia
                         ORDER BY n.fecha DESC");
$noticias = $consulta->fetchAll(); // Recorrer resultados con fetchAll
foreach ($noticias as $noticia) {
    bloqueNoticia($noticia);
}
?>
</ul>
<?php
theFooter();