

BEGIN {
    window = "true";
    coller = "true";
    home[0] = 5;
    temp = 0;

}
/stat/ { print home[0]; exit }
// { print "#error: unknown command";exit }