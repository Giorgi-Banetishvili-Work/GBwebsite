<?php

namespace App\Factories;

use App\Models\Product;
use App\Models\TechProduct;
use App\Models\ClothesProduct;
use App\Database\DB;
use Exception;

class ProductFactory
{
    public static function create(array $data): Product
    {
        $pdo = DB::getConnection();


        $priceQuery = $pdo->prepare("SELECT * FROM prices WHERE prices_product = ?");
        $priceQuery->execute([$data['product_id']]);
        $priceRow = $priceQuery->fetch();

        if (!$priceRow) {
            throw new Exception("Missing price for product ID: {$data['product_id']}");
        }

        $price = (float)($priceRow['amount'] ?? 0.0);
        $currencyLabel = $priceRow['prices_currency'] ?? 'USD';


        $currencyQuery = $pdo->prepare("SELECT symbol FROM currency WHERE label = ?");
        $currencyQuery->execute([$currencyLabel]);
        $currencySymbol = $currencyQuery->fetchColumn() ?? '$';


        $imageQuery = $pdo->prepare("SELECT product_image FROM gallery WHERE gallery_product = ? LIMIT 1");
        $imageQuery->execute([$data['product_id']]);
        $image = $imageQuery->fetchColumn() ?? '/images/default.jpg';

        $params = [
            $data['product_id'] ?? '',
            $data['product_name'] ?? '',
            $data['product_description'] ?? '',
            $data['product_category'] ?? '',
            $data['product_brand'] ?? '',
            (bool)$data['product_inStock'],
            $image,
            $price,
            $currencySymbol,
            $data['product_slug'] ?? '',
        ];

        return match (strtolower($data['product_category'])) {
            'tech' => new TechProduct(...$params),
            'clothes' => new ClothesProduct(...$params),
            default => throw new Exception("Unknown category: " . $data['product_category'])
        };
    }
}
