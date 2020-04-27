<?php
function getAlbums($artistId = false){

  $selectedAlbums = [];

  $db = dbConnect();
  $query = $db->query('SELECT * FROM albums');
  $query->execute();
  $albums = $query->fetchAll();

    if($artistId != false){
        $query = $db->prepare('SELECT * FROM albums WHERE artist_id = ? ');
        $query->execute([$artistId]);
        $selectedAlbums = $query->fetchAll();
    }
    else{
        $selectedAlbums = $albums;
    }
    return $selectedAlbums;
}



function getAlbum($id){
    $db = dbConnect();
    $query = $db->prepare('SELECT * FROM albums WHERE id = ?');
    $album = $query->execute( [ $id ] );

    if ($album){
        return $query->fetch();
    }else {
        return false;
    }
}
