<?php

namespace App\Models;

class TextAttribute extends Attribute
{
    public function getType(): string
    {
        return 'Text';
    }
}
