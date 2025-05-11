<?php

namespace App\Resolvers;

use App\Database\DB;
use App\Factories\CategoryFactory;

class CategoryResolver
{
    public function getAll(): array
    {
        $pdo = DB::getConnection();
        $stmt = $pdo->query("SELECT * FROM categories");
        $rows = $stmt->fetchAll();
        return array_map(fn($row) => CategoryFactory::create($row['category_name']), $rows);
    }
}
