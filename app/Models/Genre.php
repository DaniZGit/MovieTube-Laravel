<?php

namespace App\Models;

use App\Models\Movie;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Genre extends Model
{
    use HasFactory;


    public $incrementing = false;
    protected $keyType = 'string';

    public function movies() {
        return $this->belongsToMany(Movie::class);
    }
}
