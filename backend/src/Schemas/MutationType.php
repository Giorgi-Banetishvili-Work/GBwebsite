<?php

namespace App\Schemas;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;
use App\Resolvers\OrderResolver;

class MutationType extends ObjectType
{
    public function __construct()
    {
        parent::__construct([
            'name' => 'Mutation',
            'fields' => function () {
                return [
                    'placeOrder' => [
                        'type' => Type::boolean(),
                        'args' => [
                            'totalPrice' => Type::nonNull(Type::float()),
                            'items' => Type::nonNull(Type::listOf(
                                Type::nonNull($this->orderItemInput())
                            ))
                        ],
                        'resolve' => [OrderResolver::class, 'placeOrder']
                    ]
                ];
            }
        ]);
    }

    private function orderItemInput()
    {
        return new \GraphQL\Type\Definition\InputObjectType([
            'name' => 'OrderItemInput',
            'fields' => [
                'productId' => Type::nonNull(Type::string()),
                'productName' => Type::nonNull(Type::string()),
                'price' => Type::nonNull(Type::float()),
                'quantity' => Type::nonNull(Type::int()),
                'attributes' => Type::nonNull(Type::string())
            ]
        ]);
    }
}
