<?php

namespace App\Resolvers;

use App\Database\DB;
use App\Factories\AttributeFactory;

class AttributeResolver
{
    public function getByProductId(string $productId): array
    {
        $pdo = DB::getConnection();
        $stmt = $pdo->prepare("SELECT * FROM attributes WHERE attribute_product = ?");
        $stmt->execute([$productId]);
        $rows = $stmt->fetchAll();
        return array_map(fn($row) => AttributeFactory::create($row), $rows);
    }
}
