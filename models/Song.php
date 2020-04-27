<?php
function getSongs($albumId = false){

    $selectedSongs = [];

    $db = dbConnect();
    $query = $db->query('SELECT * FROM songs');
    $songs = $query->fetchAll();

    if($albumId != false){
        $query = $db->prepare('SELECT * FROM songs WHERE artist_id = ? ');
        $query->execute([$albumId]);
        $selectedSongs = $query->fetchAll();
    }
    else{
        $selectedSongs = $songs;
    }
    return $selectedSongs;
}

function getSong($id){
    $db = dbConnect();
    $query = $db->prepare('SELECT * FROM songs WHERE id = ?');
    $song = $query->execute( [ $id ] );

    if ($song){
        return $query->fetch();
    }else {
        return false;
    }
}

