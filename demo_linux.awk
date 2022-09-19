function printStat(arr) {
    printf "%d", alarm;
    for (i in arr) {
        printf "%s", arr[i];
    }
    print "";
}

function chekNumBetweenRoom(arg) {
    arg = int(arg);
    bool = ((arg >= 0) && (arg < 10)) ? 1 : 0;
    return bool;
}

function chekIntervalTemp(arg) {
    arg = int(arg);
    bool = ((arg >= 18) && (arg <= 26)) ? 1 : 0;
    return bool;
}
#проверка открытости окна в комнате с индексом i
function isOpenWindow(arg) {
    bool = (home[arg] == "[\\/]") ? 1 : 0;
    return bool;
}
#проверка включенного кондиционера в комнате с индексом i
function isCoolerOn(arg) {
    bool = (home[arg] ~ /[0-9]+/) ? 1 : 0;
    return bool;
}

#поиск открытого окна
function searchWindowOpen() {
    for (i = 0; i < 10; i++) {
        if (home[i] == "[\\/]") {
        return i;
        } 
    }
    return -1;
}
#поиск включённого кондиционера
function searchCoolerOn() {
    for (i in home) {
        if (home[i] ~ /[0-9]+/) {
        return i;
        }
    }
    return -1;
}

BEGIN {
    windowOpen = "[\\/]";
    roomEmpty = "[  ]";
    alarm = 1;
    temp = 0;
    for (i = 0; i < 10; i++) {
        home[i] = roomEmpty;
    }
}

/^stat$/ {printStat(home); next}

/^alarm on$/ {
    if (!alarm) {
        if ((searchWindowOpen()) == -1) {
            if (searchCoolerOn() == -1) {
                alarm = 1;
                print "success: alarm enabled";
                next;
            } else {
                print "alarm error: cooler " searchCoolerOn() " enabled";
                next; 
            }
        } else {
            print "alarm error: window " searchWindowOpen() " opened";
            next;
        }
    } else {
        print "alarm error: already enabled";
        next;
    }
}

/^alarm off$/ {
    if (alarm) {
        alarm = 0;
        print "success: alarm disabled";
        next;
    } else {
        print "alarm error: already disabled";
        next;
    }
}

/^window [0-9]+ open$/ {
    if (chekNumBetweenRoom($2)) {
        if (!alarm) {
            if (!isCoolerOn($2)) {
                if (!isOpenWindow($2)) {
                    home[$2] = windowOpen;
                    print "success: window " $2 " opened";
                    next;  
                } else {
                    print "window error: " $2 " already opened";
                    next;
                }
            } else {
                print "window error: cooler " $2 " enabled";
                next;               
            }
        } else {
            print "window error: alarm enabled";
            next;
        }
    } else {
        print "window error: room must be between 0 and 9";
        next;
    }
}

/^window -?[0-9]+ close$/ {
    if (chekNumBetweenRoom($2)) {
        if (isOpenWindow($2)) {
            home[$2] = roomEmpty;
            print "success: window " $2 " closed";
            next;                 
        } else {
            print "window error: " $2 " already closed";
            next;
        }
    } else {
        print "window error: room must be between 0 and 9";
        next;
    }
}

/^cooler [0-9]+ -?[0-9]+C$/ {
    if (chekNumBetweenRoom($2)) {
        if (chekIntervalTemp($3)) {
            if (!alarm) {
                if (!isOpenWindow($2)) {
                    home[$2] = "[" int($3) "]";
                    print "success: cooler " $2 " set to " int($3);
                    next;
                } else {
                    print "cooler error: window " $2 " opened";
                    next;
                }
            } else  {
                print "cooler error: alarm enabled";
                next;       
            }
        } else {
            print "cooler error: temp must be between 18 and 26";
            next;  
        }
    } else {
        print "cooler error: room must be between 0 and 9";
        next;
    }
}

/^cooler [0-9]+ off$/ {
    if (chekNumBetweenRoom($2)) {
        if (!alarm) {
            # нельзя выключить конд. пока откр окно
            if (!isOpenWindow($2)) {
                if (isCoolerOn($2)) {
                    home[$2] = roomEmpty;
                    print "success: cooler " $2 " disabled";
                    next;
                } else {
                    print "cooler error: " $2 " already off";
                    next;
                }
            } else {
                print "cooler error: " $2 " already off";
                next;
            }
        } else {
            print "cooler error: alarm enabled";
            next;
        }
    } else {
        print "cooler error: room must be between 0 and 9";
        next;
    }
}

/^##*/ {print $0;next;}

/^ *$/ {print $0; next}

// { print "error: unknown command" }
