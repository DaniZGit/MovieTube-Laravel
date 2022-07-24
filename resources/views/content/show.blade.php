@extends('components.layout')
@section('header')
    <link rel="stylesheet" href="{{ asset('css/movies-section.css') }}">
    <link rel="stylesheet" href="{{ asset('css/movie-details.css') }}">
    <script src="{{ asset('css/movie-details.js') }}"></script>
@endsection

@section('content')
    <div class="main-content">
        <section class="movie-details-section">
            <div class="left">
                <img src='{{ asset("storage/movie-thumbnails/$movie->id") }}.jpg' alt="" class="movie-poster left">
            </div>
            <div class="right">
                <h2 class="movie-details-title">{{ $movie->title . " (" . $movie->year . ")" }}</h2>
                <hr>
                <div class="movie-description">
                    {{ $movie->description }}
                </div>
                <div class="movie-genre-container">
                    @foreach ($movie->genres()->get() as $genre)
                       <div class="movie-genre"><a href="/movies?genre={{ $genre->id }}">{{ $genre->id }}</a></div> 
                    @endforeach
                </div>
                <div class="movie-trailer">
                    <iframe width="100%" height="315" allowfullscreen
                        src="{{ $movie->youtube_link }}">
                    </iframe>
                </div>

                <div class="movie-downloads-container">
                    <button class="dropbtn">Available downloads: (3)</button>
                        <div class="dropdown-content">
                            <a href="magnet:"><?php echo "link 1: " . '1080' . "-" . 'BluRay' ?></a>
                        </div>
                </div>
            </div>
        </section>

        <section class="movie-reviews-section"  movieID="{{ $movie->id }}">
            <h2 class="movie-reviews-title">User Reviews</h2>
            <div id="ajaxdata">
                @foreach ($reviews as $review)
                    <div class="movie-reviews-box">
                        <div class="upper">
                            <!--<img src="profile-images/.jpg" alt="No image" class="user-profile-image">-->
                            <img src="{{ asset('profile-images/2.jpg') }}" alt="No image" class="user-profile-image">
                            <h4 class="user-profile-name">{{ $review->user()->first()->username }}</h4>
                            <h6 class="user-rating">{{ $review->rating }}</h6><div class="review-star-icon"></div>
                        </div>
                        <div class="vl"></div>
                        <div class="user-profile-comment lower show-more-box">
                            <p>{{ $review->comment }}</p>
                        </div>
                    </div>
                @endforeach
                @if ($reviews->count() >= 1)
                    <button class="show-more-reviews-button" onclick="refreshData()">
                        Show More
                    </button>
                @endif
            </div>
                @auth
                   <div class="add-new-reivew">
                        <h4>What are your thoughts on the movie?</h4>
                        <!--<form action="addNewReview.php" method="POST" id="comment-form">-->
                        <form action="/movies/{{ $movie->id }}/review" method="post">
                            @csrf
                            <textarea name="comment" class="form-control comment" id="exampleFormControlTextarea1" rows="3" placeholder="Write your thoughts in here..."></textarea>
                            <button type="submit" class="add-new-review-button">
                                Submit
                            </button>
                        </form>
                    </div> 
                @else
                    <h3 style='align-self: center;'>You need to be logged in to review the movie!</h3>
                @endauth
        </section>

        <section class="movies-recommendation-section">
            <h2 class="movies-recommendation-title">Latest Movies</h2>
            <div class="movies-container">
                @foreach ($latestMovies as $latestMovie)
                    @if($movie->id != $latestMovie->id)
                        <x-movie-box-card :movie="$latestMovie"/>
                    @endif
                @endforeach
            </div>
        </section>

        @if (Auth::check() && Auth::user()->email == "admin@gmail.com")
            <section class="delete-movie">
                <form action="/movies/{{ $movie->id }}" method="post" onsubmit="return confirm('Are you sure about deleting this movie?');">
                    @csrf
                    @method('DELETE')
                    <input id="delete-movie-button" type="submit" value="Delete Movie">
                    <input type="hidden" name="movieID" value="{{ $movie->id }}">
                </form>
            </section>
        @endif
    </div>
@endsection