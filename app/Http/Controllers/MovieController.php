<?php

namespace App\Http\Controllers;

use App\Models\Genre;
use App\Models\Movie;
use App\Models\Review;
use Illuminate\Http\Request;

class MovieController extends Controller
{
    public function index() {
        return view('content.index', [
            'movies' => Movie::latest()->get()
        ]);
    }

    public function show(Movie $movie){
        return view('content.show', [
            'movie' => $movie,
            'latestMovies' => Movie::latest()->get(),
            'reviews' => Review::latest()->get()->where('movie_id', '=', $movie->id)
        ]);
    }

    public function browse() {
        return view("content.browse", [
            'movies' => Movie::latest()->filter(request(['genre', 'search']))->paginate(10),
            'genres' => Genre::all()
        ]);
    }

    public function addMovie(){
        if (auth()->user()->email != "admin@gmail.com")
            return redirect('/');

        return view('content.add-movie', [
            'genres' => Genre::all()
        ]);
    }

    public function store(Request $request) {

        $formFields = $request->validate([
            'title' => ['required'],
            'description' => ['required'],
            'year' => ['required'],
            'youtube_link' => ['required'],
            'genres' => ['required'],
            'movie_poster' => ['required']
        ]);

        $movie = new Movie();
        $movie->title = $formFields['title'];
        $movie->description = $formFields['description'];
        $movie->year = $formFields['year'];
        $movie->youtube_link = $formFields['youtube_link'];
        $movie->save();

        $genres = json_decode($request['genres']);
        foreach ($genres as $gen) {
            $genre = null;
            if(!Genre::find($gen)){
                $genre = new Genre();
                $genre->id = $gen;
                $genre->save();
            } else {
                $genre = $gen;
            }

            $movie->genres()->attach($genre);
        }

        if($request->hasFile('movie_poster')){
            $ext = $request->file('movie_poster')->extension();
            $request->file('movie_poster')->storeAs('movie-thumbnails', $movie->id.'.jpg', 'public');
        }

        return redirect('/')->with('message', 'Movie created succesfully!');return redirect('/');
    }

    public function destroy(Movie $movie){
        $movie->delete();
        return redirect('/')->with('message', 'Movie deleted succesfully');
    }

    public function addReview(Movie $movie) {
        $formFields = request()->validate([
            'comment' => ['required', 'min:20'],
        ]);

        $formFields['movie_id'] = $movie->id;
        $formFields['user_id'] = auth()->id();
        $formFields['rating'] = 5.0;

        Review::create($formFields);

        return back();
    }
}
