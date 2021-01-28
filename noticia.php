<?php
require_once "funciones.php";
require_once "bd.php";

if (isset($_POST['btnComentario'])) {
    // En el enunciado no se pedía, pero se debería comprobar que el nombre y el texto no estén en blanco.
    $bd->beginTransaction();
    $consulta = $bd->prepare('INSERT INTO comentarios (id_noticia, autor, fecha, texto)
                              VALUES (:id_noticia, :autor, :fecha, :texto )');

    /*
     * También se podría usar NOW() pero es peor porque nos ata a MySQL:
     * $consulta = $bd->prepare('INSERT INTO comentarios (id_noticia, autor, fecha, texto)
     *                           VALUES (:id_noticia, :autor, NOW(), :texto )');
     */

    $parametros = array(":id_noticia" => $_POST["hidNoticia"],
        ":autor" => $_POST["txtAutor"],
        ":fecha" => date('Y-m-d H:i:s'),
        ":texto" => $_POST["txtComentario"]);
    if ($consulta->execute($parametros)) {
        $bd->commit();
    } else {
        $bd->rollback();
        $error = "<strong>Error al introducir el comentario en la base de datos</strong>";
    }
}
$consulta = $bd->prepare('SELECT id_noticia, titular, cuerpo, fecha
                          FROM noticias
                          WHERE id_noticia = :id');
$consulta->execute(['id' => $_GET['id']]);
$noticia = $consulta->fetch();
if (!$noticia) {
    header($_SERVER["SERVER_PROTOCOL"] . " 404 Not Found", true, 404);
    include 'error404.php';
    exit();
}
theHeader($noticia['titular']);
if (isset($error)) {
    echo $error;
}
?>
    <p class="small"><a href="index.php">← Volver a portada</a></p>
    <h2><?php echo $noticia['titular']; ?></h2>
    <p class="small">Publicado en: <?php echo $noticia['fecha']; ?></p>
    <div id="imgcover"><img src='images/cover-<?php echo $noticia['id_noticia']; ?>.jpg' /></div>
    <?php echo $noticia['cuerpo']; ?>


    <h2>Comentarios</h2>
    <?php
$consulta = $bd->prepare("SELECT fecha, autor, texto
                        FROM comentarios
                        WHERE id_noticia = :id
                        ORDER BY fecha ASC");
$consulta->execute(['id' => $_GET['id']]);

if ($consulta->rowCount() > 0) {
    echo '<ul>';
    while ($comentario = $consulta->fetch()) { // Recorrer resultados con fetch
        bloqueComentario($comentario);
    }
    echo '</ul>';
} else {
    echo "<p>Sin comentarios</p>";
}
?>
    <strong>Deja un comentario</strong>
    <!--
        En el enunciado no se pedía, pero se debería comprobar que el nombre
        y el texto no estén en blanco.
        
        De ser así, habría que mostrar mensaje de error y rellenar los campos
        con los valores que el usuario hubiera introducido.
    -->
    <form id="frmComentario" method="post" action="<?php echo $_SERVER['PHP_SELF'] . '?' . $_SERVER['QUERY_STRING'] ?>">
    <input name="hidNoticia" type="hidden" value="<?php echo $_GET['id']; ?>" />
    <p><input name="txtAutor" type="text" placeholder="Nombre" /></p>
    <p><textarea placeholder="Escribe tu comentario" name="txtComentario"></textarea></p>
    <p><input type="submit" name="btnComentario" value="Comentar" /></p>
    </form>
    <?php
theFooter();
