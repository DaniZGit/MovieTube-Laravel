<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="{{ asset('scripts/navigation.js') }}"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <link rel="icon" href="{{ asset('icons-svg/MovieTube-icon.ico') }}">
    
    @yield('header')

    <style>
        #logout-link {
            color: red;
        }

        #logout-link:hover {
            color: white;
        }
    </style>
    <title>MovieTube</title>
</head>



<body>
    <header>
        <h1 class="logo">
            <a href="/">MovieTube</a>
        </h1>
        <button expanded="false" id="menu-button"></button>
        <nav class="main-nav">
            <ul>
                @auth
                    <li><a href="/profile">Welcome <b>{{ Auth::user()->username }}</b></a></li>
                @endauth

                    <li><a href="/movies">Browse movies</a></li>

                @guest
                    <li><a href="/login">Login</a></li>
                    <li><a href="/register">Register</a></li>
                @endguest

                @if (Auth::check())
                    @if (Auth::user()->email == "admin@gmail.com")
                        <li><a href="/movies/add-movie">Add movie</a></li>
                    @endif

                    <form action="/logout" method="post">
                        @csrf
                        <button type="submit" style="background-color: #101010; border: none;">
                            <li><a style="" id="logout-link">Logout</a></li>
                        </button>
                    </form>
                @endif
            </ul>
        </nav>
    </header>

    @yield('content')

    <footer>
        <p>Copyrights Daniel Z.</p>
    </footer>
</body>
</html>