<?php

namespace App\Resolvers;

use App\Database\DB;

class GalleryResolver
{
    public function getByProductId(string $productId): array
    {
        $pdo = DB::getConnection();
        $stmt = $pdo->prepare("SELECT * FROM gallery WHERE gallery_product = ?");
        $stmt->execute([$productId]);
        return $stmt->fetchAll();
    }
}
