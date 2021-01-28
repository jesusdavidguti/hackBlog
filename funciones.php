<?php
function bloqueNoticia($noticia)
{ //REEMPLAZAR MAYUSCULAS
    echo "<li class='bloqueNoticia'>";
    echo "<img src='images/thumbnail-" . $noticia['id_noticia']. ".jpg' />";
    echo "<h3><a href='noticia.php?id=" . $noticia['id_noticia']. "'>" . $noticia['titular']. "</a></h3>";
    echo "<p>" . $noticia['entradilla']. "</p>";
    echo "<p><a href='noticia.php?id=" . $noticia['id_noticia']. "'>Leer más</a></p>";
    echo "<p>Publicada en: " . $noticia['fecha']. ". (" . $noticia['numComentarios']. ") comentarios.</p>";
    echo "</li>";
}
function bloqueComentario($comentario)
{ 
    echo "<li class='bloqueComentario'>";
    echo "<p><strong>" . $comentario['autor'] . "</strong> en " . $comentario['fecha'] . ":";
    echo "<p>" . $comentario['texto'] . "</p>";
    echo "</li>";
}

function theHeader($titulo = null)
{
    ?>
    <!doctype html>

<html lang="es">
<head>
  <meta charset="utf-8">
  <title><?php if ($titulo) {
        echo $titulo . ' - ';
    }
    ?>The Hack blog</title>
  <link rel="stylesheet" href="style.css" />
</head>

<body>
<header><h1><a href="index.php">The Hack blog</a></h1></header>
<div id="container">
<div id="main">
<?php
}

function theFooter()
{
    ?>
    </div>
</div>
<footer>Copyright © <?php date("Y")?><span><a href='index.php'>The Hack Blog</a></span></footer>
</body>
</html>
<?php
}
