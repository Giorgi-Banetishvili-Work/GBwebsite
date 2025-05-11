<?php

namespace App\Resolvers;

use App\Database\DB;

class ItemResolver
{
    public function getByAttributeName(string $attributeName): array
    {
        $pdo = DB::getConnection();
        $stmt = $pdo->prepare("SELECT item_id AS id, item_displayValue AS displayValue, item_value AS value FROM items WHERE item_attributes = ?");
        $stmt->execute([$attributeName]);
        return $stmt->fetchAll();
    }
}
