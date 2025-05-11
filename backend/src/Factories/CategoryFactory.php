<?php

namespace App\Factories;

use App\Models\{Category, ClothesCategory, TechCategory};

class CategoryFactory
{
    public static function create(string $name): Category
    {
        return match (strtolower($name)) {
            'clothes' => new ClothesCategory($name),
            'tech' => new TechCategory($name),
            default => new class($name) extends Category {
                public function getDetails(): array
                {
                    return ['type' => 'Generic Category'];
                }
            }
        };
    }
}
