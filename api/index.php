<?php

require 'Slim/Slim.php';
use Slim\Slim;
include("db.php");

\Slim\Slim::registerAutoloader();
$app = new \Slim\Slim();

require 'routes/cards.php';

//Выводит список бонусных карт
$app->get('/cards/', 'getCards');
$app->get('/cards/:id', 'getCard');
$app->get('/card_history/:id', 'getCardHistory');
$app->put('/cards/:id', 'updateCard');
$app->delete('/cards/:id', 'deleteCard');

$app->post('/generate/', 'generateCards');


$app->run();
