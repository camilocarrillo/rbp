<html>

<title>Album cellphone camilo</title>

<font size="6">Album cellphone camilo<br>

<?php
$files = glob("photo-*.jpg");
$reducedfiles = glob("reduced-*.jpg");
$fileCount = count($files);
for ($i = 0; $i <= ($fileCount-1); $i++) {  
  echo '<a href="'.$files[$i].'"> <img src="'.$reducedfiles[$i].'" alt="" width="512px"></a>';
}
?>

</html>
