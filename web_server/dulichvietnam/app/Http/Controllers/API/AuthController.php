<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;


use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
//-----------------------------------------------------------//
//                           API Đăng kí
//----------------------------------------------------------//
    public function register(Request $request)
    {
        $data = $request->validate([
            'email'=>'required|email|max:255|unique:users,email',
            'password'=>'required|string',
            'confirm_password'=>'required|string',
            'hoten'=>'required|string|max:255'
        ]);

        $user=User::create([
            'email'=>$data['email'],
            'password'=>Hash::make($data['password']),
            'confirm_password'=>Hash::make($data['confirm_password']),
            'hoten'=>$data['hoten'],
            'phanquyen'=>'user',
            'trangthai'=>1
        ]);

        $token = $user->createToken('DuLichVietNam')->plainTextToken;

        $response=[
            'message'=>'Register Success',
            'data'=>$user,
            'token'=>$token
        ];

        return response()->json($response,200);
    }
//-----------------------------------------------------------//
//                           API Đăng nhập
//----------------------------------------------------------//

    public function login(Request $request)
    {
        $data= $request->validate([
            'email'=>'required|email|max:255',
            'password'=>'required|string'
        ]);
        $user = User::where('email',$data['email'])->first();

        if(!$user|| !Hash::check($data['password'],$user->password))
        {
            return response(['message'=>'Tài khoản hoặc mật khẩu sai'],401);
        }
        else
        {
            $token= $user->createToken('DuLichVietNam_Login')->plainTextToken;
            $response=
            [
                'message'=>'Login Success',
                'user'=>$user,
                'token'=>$token
            ];
            return response()->json($response,200);
        }
    }

    public function logout()
    {
        auth()->user()->tokens()->delete();
        return response()->json(['message'=>'Logout Success']);
    }
}