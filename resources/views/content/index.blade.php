@extends('components.layout')
@section('header')
    <link rel="stylesheet" href="{{ asset('css/movies-section.css') }}">
    <link rel="stylesheet" href="{{ asset('css/main-page.css') }}">
@endsection

@section('content')
    <div class="main-content">
        <section class="movies-section movies-section-newest">
            <h2 class="section-title">
                <a href="#">LATEST MOVIES</a>
            </h2>

            <div class="movies-container">
                @foreach ($movies as $movie)
                    <x-movie-box-card :movie="$movie"/>
                @endforeach
            </div>

        </section>

        <section class="movies-section movies-section-newest">
            <h2 class="section-title">
                <a href="#">TRENDING MOVIES</a>
            </h2>

            <div class="movies-container">
                @foreach ($movies as $movie)
                    <x-movie-box-card :movie="$movie"/>
                @endforeach
            </div>

        </section>

        <section class="movies-section movies-section-newest">
            <h2 class="section-title">
                <a href="#">UPCOMING MOVIES</a>
            </h2>

            <div class="movies-container">
                @foreach ($movies as $movie)
                    <x-movie-box-card :movie="$movie"/>
                @endforeach
            </div>

        </section>
    </div>
@endsection
