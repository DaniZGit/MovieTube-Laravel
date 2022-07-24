@extends('components.layout')
@section('header')
    <link rel="stylesheet" href="{{ asset('css/movies-section.css') }}">
    <link rel="stylesheet" href="{{ asset('css/browse-movies.css') }}">
@endsection

@section('content')
    <div class="main-content">

        <section class="search-bar-section">
            <div class="search-bar-container">
                <h2 class="search-bar-title">
                    Search Movies
                </h2>
                <form action="/movies">
                    <input type="search" name="search" id="movie-search-bar" placeholder="Movie title">
                </form>
            </div>
        </section>

        <section class="filter-section">
            <div class="genre-selection-container">
                <h2 class="filter-title">
                    Filter by tags
                </h2>
                <div class="movie-genre-container">
                    @foreach ($genres as $genre)
                        <a href="/movies?genre={{ $genre->id }}"" class="movie-genre" selected="false">{{ $genre->id }}</a>
                    @endforeach
                </div>
            </div>
        <!--
            <div class="order-selection">
                <div class="order-selection-container">
                    <h2 class="filter-title">
                        Order by
                    </h2>
                    <select class="filter-select" name="genre-filter" id="genre-filter">
                        <option value="all">Show all</option>
                        <option value="Latest">Latest</option>
                        <option value="Adventure">Adventure</option>
                        <option value="Drama">Drama</option>
                        <option value="Sci-Fi">Sci-Fi</option>
                    </select>
                </div>
            </div> 
        -->
        </section>

        <section class="movies-section" id="ajaxdata">
            <div class="movies-container">
                @foreach ($movies as $movie)
                    <x-movie-box-card :movie="$movie"/>
                @endforeach
            </div>
        </section>

        {{ $movies->appends(request(['genre', 'search']))->links() }}

    </div>
@endsection