<?php

namespace App\Models;

abstract class Category
{
    public function __construct(
        protected string $name
    ) {}

    abstract public function getDetails(): array;

    public function getName(): string
    {
        return $this->name;
    }
}
