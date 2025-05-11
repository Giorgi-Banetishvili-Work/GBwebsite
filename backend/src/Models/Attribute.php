<?php

namespace App\Models;

abstract class Attribute
{
    protected string $name;
    protected string $productId;
    protected string $itemName;

    public function __construct(string $name, string $productId, string $itemName)
    {
        $this->name = $name;
        $this->productId = $productId;
        $this->itemName = $itemName;
    }

    public function getName(): string
    {
        return $this->name;
    }

    public function getProductId(): string
    {
        return $this->productId;
    }

    public function getItemName(): string
    {
        return $this->itemName;
    }

    abstract public function getType(): string;
}
