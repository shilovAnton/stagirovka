function printStat(arr) {
    printf "%d", alarm;
    for(i in arr) {
        printf "%s", arr[i];
    }
    print " ";
}

function chekNumberRoom(arg) {
    arg = int(arg);
    bool = ((arg >= 0) && (arg < 10)) ? 1 : 0;
    return bool;
}

function chekIntervalTemp(arg) {
    arg = int(arg);
    bool = ((arg >= 18) && (arg < 26)) ? 1 : 0;
    return bool;
}

#проверка открытости окна в комнате с индексом i
function isOpenWindow(arg) {
    bool = (home[arg] == "[\\/]") ? 1 : 0;
    return bool;
}
#проверка включенного кондиционера в комнате с индексом i
function isCoolerOn(arg) {
    bool = (home[arg] == "[" [0-9]+ "]") ? 1 : 0;
    return bool;
}

function chekCoolerOffWindowClose() {

}
function searchWindowOpen() {

}

function searcCoolerOn() {

}

BEGIN {
    windowOpen = "[\\/]";
    roomEmpty = "[  ]";
    alarm = 1;
    temp = 0;

    for(i = 0; i < 10; i++) {
        home[i] = roomEmpty;
    }
}

/^stat$/ {  printStat(home); next}

/^alarm on$|off$/ {
    if($2 == "on") {
        alarm = 1;
        print "success: alarm enabled";
    } else {
        alarm = 0;
        print "success: alarm disabled";
    }
    next;
}
/^window [0-9]+ open$|close$/ {
    if(chekNumberRoom($2)) {
        if (!alarm) {
            if($3 == "open") {


                
                if(!isOpenWindow($2)) {



                    if(!isCoolerOn($2)) {
                        home[$2] = windowOpen;
                        print "success: window " $2 " opened";
                        next;  
                    } else {
                        print "window error: cooler " $2 " enabled";
                    }


                } else {
                    print "window error: " $2 " already opened";
                    next;
                }




            } else {
                if(isOpenWindow($2)) {
                    home[$2] = roomEmpty;
                    print "success: window " $2 " closed";
                    next;                 
                } else {
                    print "window error: " $2 " already closed";
                    next;
                }
            }



        } else {
            print "window error: alarm enabled";
            next;
        }
    } else {
        print "window error: " $2 " must be between 0 and 9";
        next;
    }
}

// { print "error: unknow command" }
