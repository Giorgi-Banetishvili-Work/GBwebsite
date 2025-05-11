<?php

namespace App\Models;

class ClothesCategory extends Category
{
    public function getDetails(): array
    {
        return ['type' => 'Clothing items like jackets, sneakers, etc.'];
    }
}
