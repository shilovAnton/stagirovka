IN='
# normal flow

stat
alarm off
stat
window 0 open
stat
window 9 open
stat
cooler 1 20C
stat
cooler 1 off
stat
window 0 close
stat
window 9 close
stat
alarm on
stat
'
OUT='
# normal flow

1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: window 0 opened
0[\/][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: window 9 opened
0[\/][  ][  ][  ][  ][  ][  ][  ][  ][\/]
success: cooler 1 set to 20
0[\/][20][  ][  ][  ][  ][  ][  ][  ][\/]
success: cooler 1 disabled
0[\/][  ][  ][  ][  ][  ][  ][  ][  ][\/]
success: window 0 closed
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][\/]
success: window 9 closed
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm enabled
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
'
diff <(echo "$IN" | awk -f demo_linux.awk) <(echo "$OUT")