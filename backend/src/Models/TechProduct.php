<?php

namespace App\Models;

class TechProduct extends Product
{
    public function getType(): string
    {
        return 'Tech';
    }
}
