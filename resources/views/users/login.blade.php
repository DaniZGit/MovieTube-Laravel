@extends('components.layout')
    <link rel="stylesheet" href="{{ asset('css/login.css') }}">
@section('header')
    
@endsection

@section('content')
    <div class="main-content">
        <section class="login-form">
            <form action="/users/login-auth" method="post">
                @csrf

                <!-- Email input -->
                <div class="form-outline mb-2">
                    <label class="form-label" for="form2Example1">Email address</label>
                    <input type="email" name="email" id="form2Example1" class="form-control" required/>
                </div>

                <!-- Password input -->
                <div class="form-outline mb-4">
                    <label class="form-label" for="form2Example2">Password</label>
                    <input type="password" name="password" id="form2Example2" class="form-control" required/>
                </div>

                <!-- Submit button -->
                <div class="login-button">
                    <button type="submit" class="btn btn-primary btn-block mb-2">Sign in</button>
                </div>

                <!-- Register buttons -->
                <div class="text-center">
                    <p>Not a member? <a class="register-button" href="register.php">Register</a></p>
                </div>

                @error('email')
                    <div class="alert alert-danger" role="alert" style="text-align: center;">
                        {{ $message }}
                    </div>
                @enderror

            </form>
        </section>
    </div>
@endsection