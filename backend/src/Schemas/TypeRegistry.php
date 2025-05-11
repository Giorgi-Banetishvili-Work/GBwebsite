<?php

namespace App\Schemas;

class TypeRegistry
{
    private static ?ProductType $productType = null;
    private static ?GalleryType $galleryType = null;
    private static ?AttributeType $attributeType = null;
    private static ?ItemType $itemType = null;

    public static function product(): ProductType
    {
        return self::$productType ??= new ProductType();
    }

    public static function gallery(): GalleryType
    {
        return self::$galleryType ??= new GalleryType();
    }

    public static function attribute(): AttributeType
    {
        return self::$attributeType ??= new AttributeType();
    }

    public static function item(): ItemType
    {
        return self::$itemType ??= new ItemType();
    }
}
