<?php

namespace App\Schemas;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;
use App\Resolvers\ProductResolver;

class QueryType extends ObjectType
{
    public function __construct()
    {
        parent::__construct([
            'name' => 'Query',
            'fields' => function () {
                $resolver = new ProductResolver();

                return [
                    'products' => [
                        'type' => Type::listOf(TypeRegistry::product()),
                        'resolve' => fn() => $resolver->getAll()
                    ],
                    'productsByCategory' => [
                        'type' => Type::listOf(TypeRegistry::product()),
                        'args' => [
                            'category' => Type::nonNull(Type::string())
                        ],
                        'resolve' => fn($root, $args) => $resolver->getByCategory($args['category'])
                    ]
                ];
            }
        ]);
    }
}
