<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\LetterFormatController;
use App\Http\Controllers\Api\LetterController;
use App\Http\Controllers\Api\LetterSubmissionController;

// Letter Formats (Template)
Route::get('/letter-formats', [LetterFormatController::class, 'index']);
Route::post('/letter-formats', [LetterFormatController::class, 'store']);
Route::put('/letter-formats/{id}', [LetterFormatController::class, 'update']);
Route::delete('/letter-formats/{id}', [LetterFormatController::class, 'destroy']);

// Letters (Pengajuan)
Route::get('/letters', [LetterController::class, 'index']);
Route::post('/letters', [LetterController::class, 'store']);
Route::get('/letters/{id}', [LetterController::class, 'show']);
Route::put('/letters/{id}/status', [LetterController::class, 'updateStatus']);
Route::delete('/letters/{id}', [LetterController::class, 'destroy']);

// (pengajuan surat)
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/letter/employee', [LetterSubmissionController::class, 'employeeInfo']);
    Route::post('/letters/submit', [LetterSubmissionController::class, 'store']);

});
