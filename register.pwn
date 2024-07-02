#include <a_samp>
#include <dini>
#include <sscanf2>

#define MAX_PLAYER_NAME 24
#define MAX_PLAYERS 50

new PlayerLogged[MAX_PLAYERS];
new PlayerName[MAX_PLAYERS][MAX_PLAYER_NAME];
new PlayerPassword[MAX_PLAYERS][64];

public OnPlayerConnect(playerid)
{
    new name[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, name, sizeof(name));
    format(PlayerName[playerid], sizeof(PlayerName[playerid]), name);

    if (fexist(Path(name)))
    {
        ShowPlayerDialog(playerid, 1, DIALOG_STYLE_INPUT, "Login", "Enter your password:", "Login", "Cancel");
    }
    else
    {
        ShowPlayerDialog(playerid, 0, DIALOG_STYLE_INPUT, "Register", "Enter a new password:", "Register", "Cancel");
    }
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if (!response) return 1;

    if (dialogid == 0) // Registration
    {
        dini_Create(Path(PlayerName[playerid]));
        dini_Set(Path(PlayerName[playerid]), "Password", inputtext);
        PlayerLogged[playerid] = 1;
        format(PlayerPassword[playerid], sizeof(PlayerPassword[playerid]), inputtext);
        SendClientMessage(playerid, -1, "Registration successful!");
    }
    else if (dialogid == 1) // Login
    {
        if (strcmp(dini_Get(Path(PlayerName[playerid]), "Password"), inputtext, false, strlen(inputtext)) == 0)
        {
            PlayerLogged[playerid] = 1;
            SendClientMessage(playerid, -1, "Login successful!");
        }
        else
        {
            Kick(playerid);
        }
    }
    return 1;
}

public Path(name[])
{
    static path[128];
    format(path, sizeof(path), "players/%s.ini", name);
    return path;
}
