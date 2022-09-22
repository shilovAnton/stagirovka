IN='
#success: alarm enabled
stat
alarm off
stat
alarm on

#success: alarm disabled
stat
alarm off

#alarm error: already enabled
stat
alarm on
alarm on

#alarm error: already disabled
stat
alarm off
alarm off

#alarm error: window NUM opened
stat
window 0 open
alarm on

#alarm error: cooler num enabled
stat
window 0 close
stat
cooler 0 20C
alarm on

#Была ошибка. Исправлено. Чек последней комнаты.
cooler 0 off
stat
window 9 open
alarm on

#Была ошибка. Исправлено. Отсутствие регулярки в начале и конце.
alarm off 123
1213 alarm off
123 alarm 123
alarm 123 off

#success: window NUM opened
stat
alarm off
window 0 open

#success: window NUM closed
stat 
window 0 close

#window error: room must be between 0 and 9
window 20 open
window 20 close
window -1 open
window 0 open
window 0 close
window 9 open
window 9 close

#window error: alarm enabled
stat
alarm on
window 9 open

#window error: cooler ROOM enabled
stat
alarm off
cooler 9 20C
window 9 open

#window error: ROOM already opened
stat
cooler 9 off
window 9 open
window 9 open

#window error: ROOM already closed
stat
window 9 close
window 9 close

#Была ошибка. Исправлено. Отсутствие регулярки в начале и конце.
stat
abc window 0 open
window abc 0 close
window 0 abc open
window 0 close abc
abc window 0 open
window abc 0 close
window 0 open abc
window0open
window-4close
 window 0 open

 #success: cooler NUM set to TEMP
stat
alarm off
cooler 9 20C

#success: cooler NUM disabled
stat
cooler 9 off

#cooler error: room must be between 0 and 9
stat
cooler -1 20C
cooler 10 20C

#cooler error: temp must be between 18 and 26
stat
cooler 9 1C
cooler 9 27C
cooler 9 -1C

#cooler error: alarm enabled
stat
alarm on
cooler 9 20C

#cooler error: window NUM opened
stat
alarm off
window 9 open
cooler 9 20C

#cooler error: num already off
stat
window 9 close
cooler 9 off
window 9 open
cooler 9 off

#Была ошибка. Исправлено. Отсутствие регулярки в начале и конце.
window 9 close
stat
abc cooler 0 20C
cooler abc 0 20C
cooler 0 abc 20C
cooler 0 20C abc
abc cooler 0 off
cooler abc 0 off
cooler 0 off abc
cooler0off
cooler-4off
 cooler 0 off

 #Комментарий

   
#Комментарий
     
#Комментарий
'
OUT='
#success: alarm enabled
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm enabled

#success: alarm disabled
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm disabled

#alarm error: already enabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm enabled
alarm error: already enabled

#alarm error: already disabled
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm disabled
alarm error: already disabled

#alarm error: window NUM opened
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: window 0 opened
alarm error: window 0 opened

#alarm error: cooler num enabled
0[\/][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: window 0 closed
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: cooler 0 set to 20
alarm error: cooler 0 enabled

#Была ошибка. Исправлено. Чек последней комнаты.
success: cooler 0 disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: window 9 opened
alarm error: window 9 opened

#Была ошибка. Исправлено. Отсутствие регулярки в начале и конце.
error: unknown command
error: unknown command
error: unknown command
error: unknown command

#success: window NUM opened
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][\/]
alarm error: already disabled
success: window 0 opened

#success: window NUM closed
error: unknown command
success: window 0 closed

#window error: room must be between 0 and 9
window error: room must be between 0 and 9
window error: room must be between 0 and 9
error: unknown command
success: window 0 opened
success: window 0 closed
window error: 9 already opened
success: window 9 closed

#window error: alarm enabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm enabled
window error: alarm enabled

#window error: cooler ROOM enabled
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm disabled
success: cooler 9 set to 20
window error: cooler 9 enabled

#window error: ROOM already opened
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][20]
success: cooler 9 disabled
success: window 9 opened
window error: 9 already opened

#window error: ROOM already closed
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][\/]
success: window 9 closed
window error: 9 already closed

#Была ошибка. Исправлено. Отсутствие регулярки в начале и конце.
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
error: unknown command
error: unknown command
error: unknown command
error: unknown command
error: unknown command
error: unknown command
error: unknown command
error: unknown command
error: unknown command
error: unknown command

 #success: cooler NUM set to TEMP
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
alarm error: already disabled
success: cooler 9 set to 20

#success: cooler NUM disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][20]
success: cooler 9 disabled

#cooler error: room must be between 0 and 9
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
error: unknown command
cooler error: room must be between 0 and 9

#cooler error: temp must be between 18 and 26
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
cooler error: temp must be between 18 and 26
cooler error: temp must be between 18 and 26
cooler error: temp must be between 18 and 26

#cooler error: alarm enabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm enabled
cooler error: alarm enabled

#cooler error: window NUM opened
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm disabled
success: window 9 opened
cooler error: window 9 opened

#cooler error: num already off
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][\/]
success: window 9 closed
cooler error: 9 already off
success: window 9 opened
cooler error: 9 already off

#Была ошибка. Исправлено. Отсутствие регулярки в начале и конце.
success: window 9 closed
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
error: unknown command
error: unknown command
error: unknown command
error: unknown command
error: unknown command
error: unknown command
error: unknown command
error: unknown command
error: unknown command
error: unknown command

 #Комментарий

   
#Комментарий
     
#Комментарий
'
diff <(echo "$IN" | awk -f demo_linux.awk) <(echo "$OUT")