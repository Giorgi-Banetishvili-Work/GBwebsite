<?php

namespace App\Models;

abstract class Product
{
    protected string $id;
    protected string $name;
    protected string $description;
    protected string $category;
    protected string $brand;
    protected bool $inStock;
    protected string $image;
    protected float $price;
    protected string $currencySymbol;
    protected string $slug;

    public function __construct(
        string $id,
        string $name,
        string $description,
        string $category,
        string $brand,
        bool $inStock,
        string $image,
        float $price,
        string $currencySymbol,
        string $slug
    ) {
        $this->id = $id;
        $this->name = $name;
        $this->description = $description;
        $this->category = $category;
        $this->brand = $brand;
        $this->inStock = $inStock;
        $this->image = $image;
        $this->price = $price;
        $this->currencySymbol = $currencySymbol;
        $this->slug = $slug;
    }

    abstract public function getType(): string;

    public function getId(): string
    {
        return $this->id;
    }
    public function getName(): string
    {
        return $this->name;
    }
    public function getDescription(): string
    {
        return $this->description;
    }
    public function getCategory(): string
    {
        return $this->category;
    }
    public function getBrand(): string
    {
        return $this->brand;
    }
    public function getInStock(): bool
    {
        return $this->inStock;
    }
    public function getImage(): string
    {
        return $this->image;
    }
    public function getPrice(): float
    {
        return $this->price;
    }
    public function getCurrencySymbol(): string
    {
        return $this->currencySymbol;
    }
    public function getSlug(): string
    {
        return $this->slug;
    }
}
