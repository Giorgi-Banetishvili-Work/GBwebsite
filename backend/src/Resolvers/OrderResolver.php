<?php

namespace App\Resolvers;

use App\Database\DB;

class OrderResolver
{
    public static function placeOrder($rootValue, array $args)
    {
        $db = new DB();
        $pdo = $db->getConnection();
        $pdo->beginTransaction();

        try {
            $stmt = $pdo->prepare("INSERT INTO orders (total_price, created_at) VALUES (?, NOW())");
            $stmt->execute([$args['totalPrice']]);
            $orderId = $pdo->lastInsertId();

            $itemStmt = $pdo->prepare("
                INSERT INTO order_items (order_id, product_id, product_name, price, quantity, attributes)
                VALUES (?, ?, ?, ?, ?, ?)
            ");

            foreach ($args['items'] as $item) {
                $itemStmt->execute([
                    $orderId,
                    $item['productId'],
                    $item['productName'],
                    $item['price'],
                    $item['quantity'],
                    $item['attributes']
                ]);
            }

            $pdo->commit();
            return true;
        } catch (\Exception $e) {
            $pdo->rollBack();
            return false;
        }
    }
}
