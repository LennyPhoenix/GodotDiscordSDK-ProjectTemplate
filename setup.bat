@echo off

echo [91mBy running this script you agree to the Discord Developers ToS.[37m 
echo.

echo [32mDownloading the Discord Game SDK...[37m 
curl.exe --output discord_game_sdk.zip --url https://dl-game-sdk.discordapp.net/2.5.6/discord_game_sdk.zip
powershell.exe "Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('discord_game_sdk.zip', 'dsdk');"

mkdir bin\linux-32
mkdir bin\linux-64
mkdir bin\osx-32
mkdir bin\osx-64
mkdir bin\windows-32
mkdir bin\windows-64

copy dsdk\lib\x86_64\discord_game_sdk.so bin\linux-32\libdiscord_game_sdk.so
copy dsdk\lib\x86_64\discord_game_sdk.so bin\linux-64\libdiscord_game_sdk.so
copy dsdk\lib\x86_64\discord_game_sdk.dylib bin\osx-32\libdiscord_game_sdk.dylib
copy dsdk\lib\x86_64\discord_game_sdk.dylib bin\osx-64\libdiscord_game_sdk.dylib
copy dsdk\lib\x86\discord_game_sdk.dll bin\windows-32\discord_game_sdk.dll
copy dsdk\lib\x86_64\discord_game_sdk.dll bin\windows-64\discord_game_sdk.dll

del discord_game_sdk.zip
RMDIR /S /Q dsdk

echo.
echo Next you should download the latest shared libraries from:
echo https://github.com/LennyPhoenix/GodotDiscordSDK/actions
echo.
echo Place each shared library in the corresponding bin/ folder.
echo (If you are unsure about debug or release, choose release)
