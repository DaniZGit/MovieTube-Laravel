<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\MovieController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// home page
Route::get('/', [MovieController::class, 'index']);

// browse movies page
Route::get('/movies', [MovieController::class, 'browse']);

// register page
Route::get('/register', [UserController::class, 'register'])
    ->middleware('guest');

// register authentication
Route::post('/users/register-auth', [UserController::class, 'registerAuth']);

// login page
Route::get('/login', [UserController::class, 'login'])
    ->middleware('guest')
    ->name('login');

// login authentication
Route::post('/users/login-auth', [UserController::class, 'loginAuth']);

// logout
Route::post('/logout', [UserController::class, 'logout'])
    ->middleware('auth');

// profile page
Route::get('/profile', [UserController::class, 'profile'])
    ->middleware('auth');

// update profile page
Route::put('/profile', [UserController::class, 'update'])
    ->middleware('auth');

// Add movie page
Route::get('/movies/add-movie', [MovieController::class, 'addMovie'])
    ->middleware('auth');

// Store Movie
Route::post('/movies', [MovieController::class, 'store']);

// Delete movie
Route::delete('movies/{movie}', [MovieController::class, 'destroy']);

// movie details page --> mora biti na koncu drugače vzame vrednost /movies/add-movie
Route::get('/movies/{movie}', [MovieController::class, 'show']);

// Add Movie Review
Route::post('/movies/{movie}/review', [MovieController::class, 'addReview']);