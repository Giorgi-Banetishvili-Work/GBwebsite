<?php

namespace App\Schemas;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;
use App\Resolvers\ItemResolver;

class AttributeType extends ObjectType
{
    public function __construct()
    {
        parent::__construct([
            'name' => 'Attribute',
            'fields' => [
                'name' => [
                    'type' => Type::string(),
                    'resolve' => fn($attribute) => method_exists($attribute, 'getName') ? $attribute->getName() : null
                ],
                'productId' => [
                    'type' => Type::string(),
                    'resolve' => fn($attribute) => method_exists($attribute, 'getProductId') ? $attribute->getProductId() : null
                ],
                'type' => [
                    'type' => Type::string(),
                    'resolve' => fn($attribute) => method_exists($attribute, 'getType') ? $attribute->getType() : null
                ],
                'items' => [
                    'type' => Type::listOf(new \App\Schemas\ItemType()),
                    'resolve' => function ($attribute) {
                        if (!method_exists($attribute, 'getItemName')) {
                            throw new \Exception("Attribute has no method getItemName()");
                        }

                        $itemName = $attribute->getItemName();
                        if (!$itemName) {
                            throw new \Exception("Attribute itemName is empty");
                        }

                        $resolver = new \App\Resolvers\ItemResolver();
                        return $resolver->getByAttributeName($itemName);
                    }
                ]
            ]
        ]);
    }
}
