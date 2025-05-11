<?php

namespace App\Factories;

use App\Models\{TextAttribute, SwatchAttribute, Attribute};

class AttributeFactory
{
    public static function create(array $data): Attribute
    {
        if (!isset($data['attribute_name']) || !isset($data['attribute_product']) || !isset($data['attribute_type']) || !isset($data['attribute_item'])) {
            throw new \Exception("Missing attribute fields.");
        }

        return match (strtolower($data['attribute_type'])) {
            'text' => new TextAttribute($data['attribute_name'], $data['attribute_product'], $data['attribute_item']),
            'swatch' => new SwatchAttribute($data['attribute_name'], $data['attribute_product'], $data['attribute_item']),
            default => throw new \Exception("Unknown attribute type: " . $data['attribute_type'])
        };
    }
}
