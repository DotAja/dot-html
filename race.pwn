#include <a_samp>
#include <zcmd>

new raceCheckpoint;

public OnPlayerCommandText(playerid, cmdtext[])
{
    if (strcmp("/race", cmdtext, true, 5) == 0)
    {
        SetPlayerPos(playerid, 1958.44, 1343.14, 15.3748);
        SetPlayerFacingAngle(playerid, 270.0);
        SetPlayerCheckpoint(playerid, 2184.44, 1343.14, 10.3984, 5.0);
        SendClientMessage(playerid, -1, "Race started! Go to the checkpoint.");
        return 1;
    }
    return 0;
}

public OnPlayerEnterCheckpoint(playerid)
{
    DisablePlayerCheckpoint(playerid);
    SendClientMessage(playerid, -1, "You reached the checkpoint! Race finished.");
    return 1;
}
