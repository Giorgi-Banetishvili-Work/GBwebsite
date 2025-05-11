<?php

namespace App\Models;

class SwatchAttribute extends Attribute
{
    public function getType(): string
    {
        return 'Swatch';
    }
}
