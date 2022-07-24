<?php

namespace App\Models;

use App\Models\Genre;
use Illuminate\Database\Query\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Movie extends Model
{
    use HasFactory;

    protected $fillable = ['title', 'description', 'year', 'youtube_link'];   

    public function scopeFilter($query, array $filters) {
        if($filters['genre'] ?? false){
            $query->whereHas('genres', function ($query) {
                $query->where('id', 'like', request('genre'));
            });
        }

        if($filters['search'] ?? false){
            $query->where('title', 'like', '%' . request('search') . '%');
        }
    }

    public function genres() {
        return $this->belongsToMany(Genre::class);
    }

    public function reviews() {
        return $this->hasMany(Review::class, 'movie_id');
    }
}
