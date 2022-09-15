# Увеличить счётчик ролей
{ stat[NF]++ }
END {
    for(i in stat) {
        print i " : " stat[i]
    }  
}