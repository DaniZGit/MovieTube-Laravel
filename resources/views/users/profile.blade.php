@extends('components.layout')

@section('header')
    <link rel="stylesheet" href="css/profile.css">
@endsection

@section('content')
    <div class="main-content">
        <section class="profile-container">
            <form action="/profile" method="post">
                @csrf
                @method('PUT')
                <div class="card-container">
                    
                        <img src="profile-images/1.jpg" alt="">
                        <div>
                            <label class="form-label" for="username">Username</label>
                            <input id="form2Example1" type="text" name="username" value="{{ Auth::user()->username }}" readonly id="" class="form-control">
                        </div>

                        <div>
                            <label class="form-label" for="username">Email</label>
                            <input id="form2Example1" type="email" name="email" value="{{ Auth::user()->email }}" readonly id="" class="form-control">
                        </div>
                        
                        <div>
                            <label class="form-label" for="username">Old  Password</label>
                            <input id="form2Example2" type="password" name="old_password" id="" class="form-control" required>
                        </div>
                        
                        <div>
                        <label class="form-label" for="username">New Password</label>
                            <input id="form2Example2" type="password" name="password" id="" class="form-control" required> 
                        </div>
                        
                        <input class="change-button" type="submit" value="Change">  

                        <input type="hidden" name="val" value="fromForm">

                        @error('password')
                            <div class="alert alert-danger" role="alert" style="text-align: center;">
                                {{ $message }}
                            </div>
                        @enderror
                    
                </div>
            </form>
        </section>
    </div>
@endsection