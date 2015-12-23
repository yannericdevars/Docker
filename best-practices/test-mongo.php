<?php

$m = new MongoClient("mongodb://172.17.0.2:27017");

$db = $m->mydb;

$collection = $db->mycollection;

$doc = array("nom" => "ivan", "prenom" => "le terrible", "id" => uniqid());

$collection->insert($doc);

$cursor = $collection->find();

foreach ($cursor as $d)
{
 var_dump($d);
}

var_dump (count($collection));
