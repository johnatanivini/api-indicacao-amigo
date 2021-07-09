<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Concerns\ResponseJsonTrait;
use App\Http\Controllers\Controller;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    use ResponseJsonTrait;

    public function login(Request $request)
    {
        try {
            $request->validate([
                'email'=>'email|required',
                'password'=>'required'
            ]);

            $credenciais = request(['email','password']);

            if (!Auth::attempt($credenciais)) {
                return $this->sendError('Não foi possível fazer login', [], 500);
            }

            $usuario = User::where('email', $request->email)->first();

            if (!Hash::check($request->password, $usuario->password, [])) {
                throw new \Exception("Erro no login", 1);
            }

            $tokenResult = $usuario->createToken('id_token')->plainTextToken;

            return $this->sendResponse(['id_token' => $tokenResult], 'Sucesso');
        } catch (Exception $exception) {
            return $this->sendError($exception->getMessage(), [], 500);
        }
    }
}
