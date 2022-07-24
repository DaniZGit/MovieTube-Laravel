@extends('components.layout')

@section('header')
    <link rel="stylesheet" href="{{ asset('css/add-movie.css') }}">
    <script src="{{ asset('scripts/add-movie.js') }}"></script>
@endsection

@section('content')
    <form action="/movies" method="post" enctype="multipart/form-data">
        @csrf
        <div class="main-content">

            <section class="movie-details-section">
                <div class="left">
                    <input class="movie-poster-picker" id="poster-file" name="movie_poster" type="file" onchange="readURL(this);" />
                    <img src="{{ asset('storage/movie-thumbnails/example.jpg') }}" alt="" class="movie-poster left">
                </div>
                <div class="right">
                    <div class="title-container">
                        <h2 id="title" class="movie-details-title" contentEditable="true">{{ old('title', 'Title Example') }}</h2>
                        <h2>&nbsp;</h2>
                        <h2>(<span contentEditable="true" id="year">{{ old('year', '2022') }}</span>)&nbsp</h2>
                    </div>
                    <hr>
                    <div class="movie-description">
                        <p contentEditable="true" id="description" data-placeholder="">
                            {{ old('description', "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.") }}
                        </p>
                    </div>
                    <div class="movie-genre-container">
                        @foreach ($genres as $genre)
                        <div class="movie-genre">
                            <a href="#" selected="false">{{ $genre->id }}</a>
                        </div>
                        @endforeach

                        <div class="add-new-genre-container">
                            <div class="movie-genre" id="add-movie-genre-button">
                                <a href="#">Add new Genre</a>
                            </div>
                        </div>

                    </div>
                    <div class="movie-trailer-container">
                        <div class="movie-trailer">
                            <iframe id="youtube_link" class="trailer-frame" width="100%" height="315" allowfullscreen
                                src="https://www.youtube.com/embed/u8-H1aNEdY8">
                            </iframe>
                            <input class="trailer-link" type="text" name="" value="https://www.youtube.com/embed/u8-H1aNEdY8">
                        </div>
                    </div>

                    <div class="links-container">
                        <div class="links-input-container">
                            <input type="text" name="" class="link-input" id="add-link-input" placeholder="magnet:?xt=urn:btih:D679E2C2F360E09B6...">
                            <button type="button" class="link-button" id="add-link-button">Add Download Link</button>
                        </div>
                        
                    </div>
                </div>
            </section>
            <section class="add-movie-section">
                    <input type="submit" id="add-movie-button" value="Add Movie" name="submit"/>
                    <input type="hidden" name="title" value="gay">
                    <input type="hidden" name="description">
                    <input type="hidden" name="year">
                    <input type="hidden" name="youtube_link">
                    <input type="hidden" name="genres">
                    <input type="hidden" name="downloadLinks">
                    <input type="hidden" name="val" value="fromForm">
            </section>

            @error('title')
                <p style="color: red; margin-top: -14px;">{{$message}}</p>
            @enderror
            @error('description')
                <p style="color: red; margin-top: -14px;">{{$message}}</p>
            @enderror
            @error('year')
                <p style="color: red; margin-top: -14px;">{{$message}}</p>
            @enderror
            @error('youtube_link')
                <p style="color: red; margin-top: -14px;">{{$message}}</p>
            @enderror
            @error('genres')
                <p style="color: red; margin-top: -14px;">{{$message}}</p>
            @enderror
        </div>
    </form>
@endsection