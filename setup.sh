echo By running this script you agree to the Discord Developers ToS.
echo

echo Downloading the Discord Game SDK...
wget https://dl-game-sdk.discordapp.net/2.5.6/discord_game_sdk.zip
unzip discord_game_sdk -d dsdk

mkdir bin/windows-32
mkdir bin/windows-64
mkdir bin/linux-32
mkdir bin/linux-64
mkdir bin/osx-32
mkdir bin/osx-64

cp dsdk/lib/x86_64/discord_game_sdk.so bin/linux-32/libdiscord_game_sdk.so
cp dsdk/lib/x86_64/discord_game_sdk.so bin/linux-64/libdiscord_game_sdk.so
cp dsdk/lib/x86_64/discord_game_sdk.dylib bin/osx-32/libdiscord_game_sdk.dylib
cp dsdk/lib/x86_64/discord_game_sdk.dylib bin/osx-64/libdiscord_game_sdk.dylib
cp dsdk/lib/x86/discord_game_sdk.dll bin/windows-32/discord_game_sdk.dll
cp dsdk/lib/x86_64/discord_game_sdk.dll bin/windows-64/discord_game_sdk.dll

rm -rf dsdk
rm discord_game_sdk.zip

echo
echo Next you should download the latest shared libraries from:
echo https://github.com/LennyPhoenix/GodotDiscordSDK/actions
echo
echo Place each shared library in the corresponding bin/ folder.
echo \(If you are unsure about debug or release, choose release\)
