@props(['movie'])

<div class="movie-box" onclick="location.href=&#39;{{ asset("/movies/$movie->id") }}&#39;" style="cursor: pointer;">
    <img src='{{ asset("storage/movie-thumbnails/$movie->id") }}.jpg' alt="" class="movie-img">
    <h3 class="movie-title">
        {{ $movie->title }}
    </h3>
    <h5 class="movie-year">
        {{ $movie->year }}
    </h5>
</div>
