<?php

namespace App\Models;

class TechCategory extends Category
{
    public function getDetails(): array
    {
        return ['type' => 'Technology products like phones, consoles, etc.'];
    }
}
