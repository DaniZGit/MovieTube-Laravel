@extends('components.layout')
    <link rel="stylesheet" href="{{ asset('css/login.css') }}">
    <link rel="stylesheet" href="{{ asset('css/register.css') }}">
@section('header')
    
@endsection

@section('content')
    <div class="main-content">
        <section class="login-form">
            <form action="/users/register-auth" method="post">
                @csrf
                <!-- Username input -->
                <div class="profile-image-container">
                    <label for="profile-image"></label>
                    <img class="user-profile-image" id="profile-image" src="profile-images/2.jpg" alt="">
                </div>

                <div class="form-outline mb-2">
                    <label class="form-label" for="form2Example1">Username</label>
                    <input type="text" name="username" id="form2Example1" class="form-control" required 
                        value="{{ old('username') }}" />
                </div>
                @error('username')
                    <p style="color: red; margin-top: -14px;">{{$message}}</p>
                @enderror

                <!-- Email input -->
                <div class="form-outline mb-2">
                    <label class="form-label" for="form2Example2">Email address</label>
                    <input type="email" name="email" id="form2Example2" class="form-control" required
                        value="{{ old('email') }}" />
                </div>
                @error('email')
                    <p style="color: red; margin-top: -14px;">{{$message}}</p>
                @enderror

                <!-- Password input -->
                <div class="form-outline mb-4">
                    <label class="form-label" for="form2Example3">Password</label>
                    <input type="password" name="password" id="form2Example3" class="form-control" required/>
                </div>
                @error('password')
                    <p style="color: red; margin-top: -14px;">{{$message}}</p>
                @enderror

                <!-- Submit button -->
                <div class="login-button">
                    <button type="submit" class="btn btn-primary btn-block mb-2">Sign in</button>
                </div>

                <!-- Login buttons -->
                <div class="text-center">
                    <p>Already a member? <a class="register-button" href="login.php">Login</a></p>

                </div>
            </form>
        </section>
    </div>
@endsection