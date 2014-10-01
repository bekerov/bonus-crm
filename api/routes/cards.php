<?php

use Slim\Slim;
function getCards() {
    //Получает все бонусные карты
    $sql = "SELECT * FROM bonuscards;";
    try {
        $db = getConnection();
        $stmt = $db->prepare($sql);
        $stmt->execute();
        $out = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $db = null;

        echo json_encode($out);
    } catch(PDOException $e) {
        echo '{"text":'. $e->getMessage() .'}';
    }
}

function getCard($id) {
    //Получает бонусную карту
    $sql = "SELECT * FROM bonuscards WHERE card_number='$id'";
    try {
        $db = getConnection();
        $stmt = $db->prepare($sql);
        $stmt->bindParam("card_number", $id);
        $stmt->execute();
        $out = $stmt->fetchObject();
        $db = null;
        echo json_encode($out);
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
}
function updateCard($id) {
    //Обновляет статус карты
    global $app;
    $request = json_decode($app->request()->getBody());
    $sql = "UPDATE bonuscards SET status=:status WHERE card_number='$id'";
    try {
        $db = getConnection();
        $stmt = $db->prepare($sql);
        $stmt->bindParam("status", $request->status);
        $stmt->execute();
        $db = null;
        echo json_encode($request);
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
}

function deleteCard($id) {
    $sql = "DELETE FROM bonuscards WHERE card_number=:card_number";
    try {
        $db = getConnection();
        $stmt = $db->prepare($sql);
        $stmt->bindParam("card_number", $id);
        $stmt->execute();
        $db = null;
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
}
function generateCards() {
    global $app;
    $request = json_decode($app->request()->getBody());

    $sql = "INSERT INTO bonuscards (series, release_date, end_date, status) VALUES (:series, :release_date, :end_date, :status)";
    try {
        $release_date = date("Y-m-d H:i:s"); //Дата создания
        $end_date = date('Y-m-d H:i:s', strtotime($release_date.'+'.$request->duration.' month'));
        $status = 'deactivated';
        $db = getConnection();
        $stmt = $db->prepare($sql);
        $stmt->bindParam("series", $request->series);
        $stmt->bindParam("release_date", $release_date);
        $stmt->bindParam("end_date", $end_date);
        $stmt->bindParam("status", $status);
        for ($i = 0; $i <= $request->quantity; $i++) {
            $stmt->execute();
        }

        $db = null;
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
}

function getCardHistory($id) {
    $sql = "SELECT * FROM card_history WHERE number_card='$id';";
    try {
        $db = getConnection();
        $stmt = $db->prepare($sql);
        $stmt->execute();
        $out = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $db = null;

        echo json_encode($out);
    } catch(PDOException $e) {
        echo '{"text":'. $e->getMessage() .'}';
    }
}
