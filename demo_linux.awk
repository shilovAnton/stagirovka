function second(string) {
    split(string,array,",")
    return array[3]
}
BEGIN {print second("1,5,3");exit}