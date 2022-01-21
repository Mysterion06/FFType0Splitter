state("fftype0hd")
{
    byte ngKills:     0x65798C;       //NG Kills
    byte ngPlusKills: 0x7036F6;       //NG+ Kills
    byte LS:          0x667AE4;   	  //Loading Screens in 1, 2, 3
    int mission:      0x635828;       //Mission 1-9; 10 in menu
    int chars:        0x657970;       //The amount of available characters you can still use
}

startup{
    vars.CharAmount = 0;
}

update{
    if(timer.CurrentPhase == TimerPhase.NotRunning){
        vars.CharAmount = 0;
    }
}

start
{
    if(current.mission == 1){
        return true;
    }
}

split
{
    if(current.mission > old.mission && old.mission != 0 && old.mission != 10 && current.mission != 10){
        return true;
    }

    if(current.chars == 11 && current.mission == 8){
        vars.charAmount = 1;
    }

    if(current.mission == 8 && current.chars == 0 && vars.charAmount == 1 && current.ngKills != old.ngKills){
        return true;
    }
}

isLoading{
    if(current.LS == 1 || current.LS == 2 || current.LS == 3){
        return true;
    } else {
        return false;
    }
}

/*reset
{
    if (current.mission == 10 && old.mission <= 7 && old.mission >= 1){
        return true;
    }
}*/