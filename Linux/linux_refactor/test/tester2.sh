IN='
# e3t45ertgdgdgfdfg
stat

cooler 9 off
cooler 94 off
alarm off
stat
cooler 9 off
cooler 9 99C
cooler 5 18C
stat
cooler 0 22C
cooler rwsersdf
alarm on
window 1 open
stat
window 078 open
window 0 open
window 0 close
window 1 close
window 3 open
state
stat
alarm on
alarm off
window 1 close
window 3 close
cooler 0 off
cooler 5 off
alarm on
alarm on
'
OUT='
# e3t45ertgdgdgfdfg
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]

cooler error: alarm enabled
cooler error: room must be between 0 and 9
success: alarm disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
cooler error: 9 already off
cooler error: temp must be between 18 and 26
success: cooler 5 set to 18
0[  ][  ][  ][  ][  ][18][  ][  ][  ][  ]
success: cooler 0 set to 22
error: unknown command
alarm error: cooler 0 enabled
success: window 1 opened
0[22][\/][  ][  ][  ][18][  ][  ][  ][  ]
window error: room must be between 0 and 9
window error: cooler 0 enabled
window error: 0 already closed
success: window 1 closed
success: window 3 opened
error: unknown command
0[22][  ][  ][\/][  ][18][  ][  ][  ][  ]
alarm error: window 3 opened
alarm error: already disabled
window error: 1 already closed
success: window 3 closed
success: cooler 0 disabled
success: cooler 5 disabled
success: alarm enabled
alarm error: already enabled
'
diff <(echo "$IN" | awk -f demo_linux.awk) <(echo "$OUT")