<?php
function getArtists($artistId = null){
    $db = dbConnect();
    $query = $db->query('SELECT * FROM artists');
    $artists = $query->fetchAll();

    return $artists;
}

function getArtist($id){
    $db = dbConnect();
    $query = $db->prepare('SELECT * FROM artists WHERE id = ?');
    $artist = $query->execute( [ $id ] );

    if ($artist){
        return $query->fetch();
    }else {
        return false;
    }
}
