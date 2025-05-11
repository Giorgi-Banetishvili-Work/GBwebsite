<?php

namespace App\Resolvers;

use App\Database\DB;
use App\Factories\ProductFactory;

class ProductResolver
{
    public function getAll(): array
    {
        $pdo = DB::getConnection();
        $stmt = $pdo->query("SELECT * FROM products");
        $rows = $stmt->fetchAll();

        $products = [];

        foreach ($rows as $row) {
            try {
                $product = ProductFactory::create($row);
                if ($product !== null) {
                    $products[] = $product;
                }
            } catch (\Throwable $e) {
                error_log("Error creating product: " . $e->getMessage());
                continue;
            }
        }

        return $products;
    }

    public function getByCategory(string $category): array
    {
        $pdo = DB::getConnection();
        $stmt = $pdo->prepare("SELECT * FROM products WHERE product_category = ?");
        $stmt->execute([$category]);
        $rows = $stmt->fetchAll();

        $products = [];

        foreach ($rows as $row) {
            try {
                $product = ProductFactory::create($row);
                if ($product !== null) {
                    $products[] = $product;
                }
            } catch (\Throwable $e) {
                error_log("Error creating product: " . $e->getMessage());
                continue;
            }
        }

        return $products;
    }

    public function getGalleryImagesForProduct(string $productId): array
    {
        $pdo = DB::getConnection();
        $stmt = $pdo->prepare("SELECT gallery_id AS id, product_image FROM gallery WHERE gallery_product = ?");
        $stmt->execute([$productId]);
        $rows = $stmt->fetchAll();

        return array_map(fn($row) => [
            'id' => $row['id'],
            'product_image' => $row['product_image']
        ], $rows);
    }
}
