<?php

namespace App\Schemas;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;
use App\Resolvers\ProductResolver;
use App\Resolvers\AttributeResolver;

class ProductType extends ObjectType
{
    public function __construct()
    {
        parent::__construct([
            'name' => 'Product',
            'fields' => [
                'id' => [
                    'type' => Type::string(),
                    'resolve' => fn($product) => $product->getId()
                ],
                'name' => [
                    'type' => Type::string(),
                    'resolve' => fn($product) => $product->getName()
                ],
                'description' => [
                    'type' => Type::string(),
                    'resolve' => fn($product) => $product->getDescription()
                ],
                'category' => [
                    'type' => Type::string(),
                    'resolve' => fn($product) => $product->getCategory()
                ],
                'brand' => [
                    'type' => Type::string(),
                    'resolve' => fn($product) => $product->getBrand()
                ],
                'inStock' => [
                    'type' => Type::boolean(),
                    'resolve' => fn($product) => $product->getInStock()
                ],
                'type' => [
                    'type' => Type::string(),
                    'resolve' => fn($product) => $product->getType()
                ],
                'image' => [
                    'type' => Type::string(),
                    'resolve' => fn($product) => $product->getImage()
                ],
                'price' => [
                    'type' => Type::float(),
                    'resolve' => fn($product) => $product->getPrice()
                ],
                'currencySymbol' => [
                    'type' => Type::string(),
                    'resolve' => fn($product) => $product->getCurrencySymbol()
                ],
                'slug' => [
                    'type' => Type::string(),
                    'resolve' => fn($product) => $product->getSlug()
                ],
                'gallery' => [
                    'type' => Type::listOf(TypeRegistry::gallery()),
                    'resolve' => function ($product) {
                        $resolver = new ProductResolver();
                        return $resolver->getGalleryImagesForProduct($product->getId());
                    }
                ],
                'attributes' => [
                    'type' => Type::listOf(TypeRegistry::attribute()),
                    'resolve' => function ($product) {
                        $resolver = new AttributeResolver();
                        return $resolver->getByProductId($product->getId());
                    }
                ]
            ]
        ]);
    }
}
