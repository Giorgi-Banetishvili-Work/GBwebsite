<?php

namespace App\Models;

class ClothesProduct extends Product
{
    public function getType(): string
    {
        return 'Clothes';
    }
}
