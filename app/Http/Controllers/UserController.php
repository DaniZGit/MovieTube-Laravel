<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{

    // register form
    public function register() {
        return view('users.register');
    }

    // register authentication
    public function registerAuth(Request $request) {
        $formFields = $request->validate([
            'username' => ['required', 'min:4'],
            'email' => ['required', 'email', Rule::unique('users', 'email')],
            'password' => ['required', 'min:4']
        ]);

        // Hash Password
        $formFields['password'] = bcrypt($formFields['password']);

        // Create User
        $user = User::create($formFields);

        // login
        auth()->login($user);

        return redirect('/')->with('message', 'User created and logged in');
    }

    // login form
    public function login() {
        return view('users.login');
    }

    // login authentication
    public function loginAuth(Request $request) {
        $formFields = $request->validate([
            'email' => ['required', 'email'],
            'password' => ['required']
        ]);

        if(auth()->attempt($formFields)) {
            $request->session()->regenerate();

            return redirect('/')->with('message', 'You are now logged in!');
        } else {
            return back()->withErrors(['email' => 'Invalid Credentials'])->onlyInput('email');
        }
    }

    // logout user
    public function logout(Request $request) {
        auth()->logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();     

        return redirect('/')->with('message', 'You have been logged out!');
    }

    // profile page
    public function profile() {
        return view('users.profile');
    }

    // update profile page
    public function update(Request $request) {
        $formFields = $request->validate([
            'old_password' => ['required'],
            'password' => ['required']
        ]);

        $formFields['password'] = bcrypt($formFields['password']);

        /** @var \App\Models\User $user */
        $user = auth()->user();

        if (Hash::check($formFields['old_password'], $user->password)) {
            $user->password = $formFields['password'];
            $user->save();
            return back()->with('message', 'You have succesfully changed your password!');
        } else {
            return back()->withErrors(['password' => 'Wrong Old Password'])->onlyInput('password');
        }
    }
}
