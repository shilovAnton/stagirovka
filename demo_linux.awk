<<<<<<< HEAD
# Увеличить счётчик ролей
{ stat[NF]++ }
END {
    for(i in stat) {
        print i " : " stat[i]
    }  
}
=======


BEGIN {
    window = "true";
    coller = "true";
    home[0] = 5;
    temp = 0;

}
/stat/ { print home[0]; exit }
// { print "#error: unknown command";exit }
>>>>>>> 5f6fcdc835f4b295d755b56816333f84d8ec02d0
