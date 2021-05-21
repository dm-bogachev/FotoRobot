.AUXDATA
N_INT100    "cancel_draw  "
N_INT101    "cancel_draw_l  "
N_INT102    "reset_motion  "
N_INT103    "main_pc  "
N_INT104    "ifp_pc  "
N_INT105    "motion_run  "
N_INT200    "page1  "
N_INT201    "page2  "
N_INT202    "page3  "
N_INT301    "t_home_point  "
N_INT302    "t_aim_point  "
N_INT303    "t_aim_point1  "
N_INT304    "t_endp  "
N_INT305    "t_a1  "
N_INT306    "t_a2  "
N_INT307    "t_a3  "
N_INT308    "t_a4  "
N_INT309    "t_startp  "
.END
.INTER_PANEL_D
0,1,"  main pc","","","",10,9,4,10,2103,0
1,1,"  ifp pc","","","",10,9,4,10,2104,0
2,1," fotorobot","","","",10,9,4,10,2105,0
5,3,""," IF GREEN","FORCE STOP","",10,4,7,0,0,2100,2101,0
6,14,"uploaded","Uploaded","points",10,7,0
7,10,"","   RESET","    PC","",10,4,9,2,pcex 5: autostart5.pc,0
9,2,"","   RESET","   MOTION","",10,4,9,2102,0
13,14,"percent","Drawn","points",10,7,0
14,10,"","   STOP","    PC","",10,4,7,4,pcex 4: stop_pc.pc,0
27,2,"","  PAGE 2","--------->","",10,4,9,2201,0
28,8,"tcp_port"," TCP PORT","",10,7,5,1,0
29,8,"socket_id","SOCKET ID","",10,9,2,1,0
32,10,"  RESET","  SOCKET","  ERROR","",10,4,7,1,pcex 4: socket_error.pc,0
34,10,"  FORCE","  DRAW ","  FINISH","",10,4,7,3,drawing_finished=true,0
35,8,"accept_tout","  ACCEPT","  TIMEOUT",10,7,3,1,0
36,8,"receive_tout","  RECEIVE","  TIMEOUT",10,7,3,1,0
37,8,"send_tout","   SEND","  TIMEOUT",10,7,3,1,0
49,2,"","  PAGE 1","<---------","",10,4,9,2200,0
55,2,"","  PAGE 3","--------->","",10,4,9,2202,0
56,2,"   ","   TEACH","home_point","",10,4,7,2301,0
57,2,"   ","   TEACH","   endp","",10,4,7,2304,0
58,2,"   ","   TEACH","    a1","",10,4,7,2305,0
59,2,"   ","   TEACH","    a2","",10,4,7,2306,0
60,2,"   ","   TEACH","    a3","",10,4,7,2307,0
61,2,"   ","   TEACH","    a4","",10,4,7,2308,0
62,2,"   ","   TEACH","   FRAME","",10,4,7,2309,0
63,2,"   ","   TEACH"," aim_point","",10,4,7,2302,0
64,9,1,6,7
70,2,"   ","   TEACH","aim_point1","",10,4,7,2303,0
71,9,2,6,7
77,2,"","  PAGE 2","<---------","",10,4,9,2201,0
78,9,3,6,7
.END
.INTER_PANEL_TITLE
"Main",1
"Aux",1
"",0
"",0
"",0
"",0
"",0
"",0
.END
.INTER_PANEL_COLOR_D
182,3,224,244,28,159,252,255,251,255,0,31,2,241,52,219,
.END
.PROGRAM fotorobot ()
  RUNMASK motion_run
  SIGNAL motion_run
  CP OFF
  ACCURACY 0.1 ALWAYS
  $action = ""
  WHILE TRUE DO
    IF $action == "AIM" THEN
      $action = ""
      BREAK
      SPEED 1000 MM/S ALWAYS
      JMOVE #aim_point1
retraim:
      JMOVE #aim_point
    END
    IF $action == "HOME" THEN
      $action = ""
      BREAK
      SPEED 1000 MM/S ALWAYS
      JMOVE #aim_point1
      JMOVE #home_point
    END
    IF $action == "WAIT" THEN
      $action = ""
      BREAK
      SPEED 1000 MM/S ALWAYS
      JMOVE #aim_point
      JMOVE #aim_point1
      JMOVE #home_point
    END
    IF $action == "DRAW" THEN
      BREAK
      SPEED 3000 MM/S ALWAYS
      drawed_points = 0
      watched = FALSE
      WHILE TRUE DO
        IF drawed_points < points_length THEN
          IF $action != "STOPDRAW" THEN
            LMOVE startp + TRANS (dpt[drawed_points, 0], -dpt[drawed_points, 1], -dpt[drawed_points, 2])
            drawed_points = drawed_points + 1
            $percent = $ENCODE (/F6.2, drawed_points * 100 / points_length) + " %"
            ; Returning to home point after finishing
          ELSE
            GOTO stop
          END
        ELSE
          GOTO stop
        END
      END
stop:
      SPEED 1000 MM/S ALWAYS
      JMOVE #endp
      JMOVE #home_point
      $state = "STOP"
      drawing_finished = TRUE
      $action = ""
    END
  END
.END
.PROGRAM receive.pc (.$msg,.ret) ; 
  ;
  .num = 0
  .max_length = 255
  ;
  TCP_RECV .ret, socket_id, .$recv_buf[1], .num, receive_tout, .max_length
  ;
  IF .ret < 0 THEN
    .$msg = ""
  ELSE
    IF .num > 0 THEN
      .$msg = .$recv_buf[1]
    ELSE
      .$msg = ""
    END
  END
  ;
.END
.PROGRAM fotorobot.pc ()
  ;
  RUNMASK main_pc
  SIGNAL main_pc
  ;
  SIGNAL -cancel_draw_l
  ;
  stop_connection = FALSE
  tcp_port = 49152
  ;
  .mc_cont = TRUE
  WHILE .mc_cont DO
    .cc_cont = TRUE
    .rc_cont = TRUE
    WHILE .cc_cont DO
      CALL open_socket.pc
      IF socket_id < 0 THEN
        IF stop_connection == TRUE THEN
          .cc_cont = FALSE
          .rc_cont = FALSE
          .mc_cont = FALSE
        END
      ELSE
        .cc_cont = FALSE
      END
    END
    ;
    WHILE .rc_cont DO
      IF stop_connection == TRUE THEN
        .rc_cont = FALSE
        .mc_cont = FALSE
      END
      CALL receive.pc (.$msg, .ret)
      IF .ret == -34024 THEN
        PRINT "Recieve timeout"
      END
      IF .ret == -34025 THEN
        PRINT "Connection error"
        CALL close_socket.pc
        .rc_cont = FALSE
      END
      IF .ret == 0 THEN
        IF .$msg == "AIM" THEN
          PRINT "Aiming"
          $action = "AIM"
        END
        IF .$msg == "HOME" THEN
          PRINT "Going home"
          $action = "HOME"
        END
        IF .$msg == "WAIT" THEN
          $action = "WAIT"
        END
        IF .$msg == "DRAW" THEN
          PRINT "Drawing"
          drawing_finished = FALSE
          CALL send.pc ("OK")
          CALL receive.pc (.$msg, .ret)
          points_length = VAL (.$msg)
          CALL send.pc ("OK")
          ;
          .rp_cont = TRUE
          recieved_point = 0
          WHILE .rp_cont DO
            CALL receive.pc (.$msg, .ret)
            IF .$msg == "STOPDRAW" THEN
              .rp_cont = FALSE
              $action = "STOPDRAW"
              CALL send.pc ("OK")
            END
            IF .rp_cont THEN
              IF .$msg == "ENDRECV" THEN
                .rp_cont = FALSE
              ELSE
                FOR i = 0 TO 2 STEP 1
                  .$temp = $DECODE (.$msg, ":", 0)
                  dpt[recieved_point, i] = VAL (.$temp)
                  .$temp = $DECODE (.$msg, ":", 1)
                END
                recieved_point = recieved_point + 1
                IF recieved_point * 100 / points_length > 5 THEN
                  $action = "DRAW"
                END
                $uploaded = $ENCODE (/F6.2, recieved_point * 100 / points_length) + " %"
              END
            END
            CALL send.pc ("OK")
          END
          SIGNAL cancel_draw_l
          WHILE drawing_finished != TRUE
            IF SIG (cancel_draw)
            $action = "STOPDRAW"
          END
          SIGNAL -cancel_draw_l
        END
        CALL send.pc ("DRAWOK")
      END
    END
  END
END
IF socket_id > 0 THEN
  CALL close_socket.pc
END
.END
.PROGRAM open_socket.pc ()
  ;
  .listen = TRUE
  .accept = FALSE
  ;
  .err_counter = 0
  ;
  WHILE .listen DO
    TCP_LISTEN .ret, tcp_port
    IF .ret < 0 THEN
      IF .err_counter >= 5 THEN
        ;PRINT "Connection with PC is failed (LISTEN). Program is stopped."
        socket_id = -1
        .listen = FALSE
      ELSE
        .err_counter = .err_counter + 1
        ;PRINT "TCP_LISTEN error=", .ret, "    error count=", .err_counter
      END
    ELSE
      ;PRINT "TCP_LISTEN OK ", .ret
      .listen = FALSE
      .accept = TRUE
    END
  END
  ;
  .err_counter = 0
  ;
  WHILE .accept DO
    TCP_ACCEPT socket_id, tcp_port, accept_tout, .ip[1]
    IF socket_id < 0 THEN
      IF .err_counter >= 5 THEN
        ;PRINT "Connection with PC is failed (ACCEPT). Program is stopped."
        TCP_END_LISTEN .ret, tcp_port
        socket_id = -1
        .accept = FALSE
      ELSE
        .err_counter = .err_counter + 1
        ;PRINT "TCP_ACCEPT error id=", socket_id, "  error count=", .err_counter
      END
    ELSE
      ;PRINT "TCP_ACCEPT OK id=", socket_id
      .accept = FALSE
    END
  END
.END
.PROGRAM close_socket.pc ()
  ;
  TCP_CLOSE .ret, socket_id;Normal socket closure
  IF .ret < 0 THEN
    ;PRINT "TCP_CLOSE error ERROR=(", .ret, ") ", $ERROR (.ret)
    TCP_CLOSE .ret1, socket_id;Forced closure of socket (shutdown)
    IF .ret1 < 0 THEN
      ;PRINT "TCP_CLOSE error id=", socket_id
    END
  ELSE
    ;PRINT "TCP_CLOSE OK id=", socket_id
  END
  TCP_END_LISTEN .ret, tcp_port
  IF .ret < 0 THEN
    ;PRINT "TCP_CLOSE error id=", socket_id
  ELSE
    ;PRINT "TCP_CLOSE OK id=", socket_id
  END
.END
.PROGRAM send.pc (.$msg)
  ;
  .$send_buf[1] = .$msg
  .buf_n = 1
  TCP_SEND .ret, socket_id, .$send_buf[1], .buf_n, send_tout
.END
.PROGRAM socket_error.pc()
  ;
  TCP_END_LISTEN .ret, tcp_port
.END
.PROGRAM autostart5.pc()
  ;
  IF TASK (1001) <> 1 THEN
    PCEXECUTE 1: fotorobot.pc
  END
  ;
  IF TASK (1002) <> 1 THEN
    PCEXECUTE 2: ifp.pc
  END
  ;
.END
.PROGRAM ifp.pc ()
  ;
  RUNMASK ifp_pc
  SIGNAL ifp_pc
  ;
  WHILE TRUE DO
    ;
    ; Run motion if required
    .start_permission = TRUE
    IF SIG (reset_motion) THEN
      IF SWITCH (CS) THEN
        .start_permission = FALSE
      END
      IF SWITCH (TEACH_LOCK) THEN
        .start_permission = FALSE
      END
      IF NOT SWITCH (REPEAT) THEN
        .start_permission = FALSE
      END
      IF SWITCH (ERROR) THEN
        .start_permission = FALSE
      END
      IF NOT SWITCH (POWER) THEN
        MC ZPOWER ON
        TWAIT 1
      END
      IF .start_permission THEN
        MC EXECUTE fotorobot
      END
    END
    ;
    IF SIG(t_home_point) THEN
      HERE #home_point
    END
    IF SIG(t_aim_point) THEN
      HERE #aim_point
    END
    IF SIG(t_aim_point1) THEN
      HERE #aim_point1
    END
    IF SIG(t_endp) THEN
      HERE #endp
    END
    IF SIG(t_a1) THEN
      HERE a1
    END
    IF SIG(t_a2) THEN
      HERE a2
    END
    IF SIG(t_a3) THEN
      HERE a3
    END
    IF SIG(t_a4) THEN
      HERE a4
    END
    IF SIG(t_startp) THEN
      POINT startp = FRAME (a2, a3, a4, a1)
    END
    ;
    CALL disp_points.pc
    ;
  END
  ;
.END
.PROGRAM stop_pc.pc()
  ; 
  PCABORT 1:
  TWAIT receive_tout + 2
  CALL socket_error.pc
  ;
.END
.PROGRAM p2str.pc (.$point, .$str)
  ;
  DECOMPOSE .data[0] = STRTOPOS (.$point)
  .$str = ""
  FOR .i = 0 TO 5
    .valu = ROUND (.data[.i])
    .$str = .$str + $ENCODE (/D, .valu)  + ", "
  END
  .$str = .$point + ": " + .$str
  ;
.END
.PROGRAM disp_points.pc ()
  ;
  CALL p2str.pc ("#home_point", .$rs)
  IFPWOVERWRITE 1, 1 = .$rs
  CALL p2str.pc ("#aim_point", .$rs)
  IFPWOVERWRITE 1, 2 = .$rs
  CALL p2str.pc ("#aim_point1", .$rs)
  IFPWOVERWRITE 1, 3 = .$rs
  CALL p2str.pc ("#endp", .$rs)
  IFPWOVERWRITE 1, 4 = .$rs
  CALL p2str.pc ("a1", .$rs)
  IFPWOVERWRITE 2, 1 = .$rs
  CALL p2str.pc ("a2", .$rs)
  IFPWOVERWRITE 2, 2 = .$rs
  CALL p2str.pc ("a3", .$rs)
  IFPWOVERWRITE 2, 3 = .$rs
  CALL p2str.pc ("a4", .$rs)
  IFPWOVERWRITE 2, 4 = .$rs
  CALL p2str.pc ("startp", .$rs)
  IFPWOVERWRITE 3, 2 = .$rs
.END
.PROGRAM Comment___ () ; Comments for IDE. Do not use.
	; @@@ PROJECT @@@
	; @@@ HISTORY @@@
	; @@@ INSPECTION @@@
	; #home_point
	; #aim_point
	; #aim_point1
	; #endp
	; @@@ CONNECTION @@@
	; KROSET R01
	; 127.0.0.1
	; 9105
	; @@@ PROGRAM @@@
	; 0:fotorobot:F
	; 0:receive.pc:B
	; .$msg 
	; .ret 
	; .num 
	; .max_length 
	; 0:fotorobot.pc:B
	; .mc_cont 
	; .cc_cont 
	; .rc_cont 
	; .ret 
	; .rp_cont 
	; 0:open_socket.pc:B
	; .listen 
	; .accept 
	; .err_counter 
	; .ret 
	; .ip 
	; 0:close_socket.pc:B
	; .ret 
	; .ret1 
	; 0:send.pc:B
	; .$msg 
	; .buf_n 
	; .ret 
	; 0:socket_error.pc:B
	; 0:autostart5.pc:B
	; 0:ifp.pc:B
	; 0:stop_pc.pc:B
	; 0:p2str.pc:B
	; .$point 
	; .$str 
	; 0:disp_points.pc:B
	; @@@ TRANS @@@
	; @@@ JOINTS @@@
	; @@@ REALS @@@
	; @@@ STRINGS @@@
	; @@@ INTEGER @@@
	; @@@ SIGNALS @@@
	; cancel_draw 
	; cancel_draw_l 
	; reset_motion 
	; main_pc 
	; ifp_pc 
	; motion_run 
	; page2 
	; page1 
	; page3 
	; t_home_point 
	; t_aim_point 
	; t_aim_point1 
	; t_endp 
	; t_a1 
	; t_a2 
	; t_a3 
	; t_a4 
	; t_startp 
	; @@@ TOOLS @@@
	; @@@ BASE @@@
	; @@@ FRAME @@@
	; @@@ BOOL @@@
.END
.TRANS
startp 6.797889 689.981018 -181.006378 44.896118 172.933044 -134.885315
a1 6.797167 219.948227 218.975281 44.900761 172.933228 -134.882507
a2 6.797167 219.948227 218.975281 44.900761 172.933228 -134.882507
a3 6.797167 219.948227 218.975281 44.900761 172.933228 -134.882507
a4 6.797167 219.948227 218.975281 44.900761 172.933228 -134.882507
.END
.JOINTS
#home_point 0.000000 -34.078125 -133.830841 -5.168848 -75.304413 1.314102
#aim_point 0.000000 28.818970 -73.613396 -5.239161 -72.635422 1.567433
#aim_point1 0.000000 28.818970 -73.613396 -5.239161 -72.635422 1.567433
#endp 0.000000 28.818970 -73.613396 -5.239161 -72.635422 1.567433
.END
.REALS
tcp_port = 49152
socket_id = -1
accept_tout = 5
receive_tout = 5
drawing_finished = 0
send_tout = 5
recieved_point = 0
cancel_draw = 2100
cancel_draw_l = 2101
reset_motion = 2102
main_pc = 2103
ifp_pc = 2104
motion_run = 2105
page2 = 2201
page1 = 2200
page3 = 2202
t_home_point = 2301
t_aim_point = 2302
t_aim_point1 = 2303
t_endp = 2304
t_a1 = 2305
t_a2 = 2306
t_a3 = 2307
t_a4 = 2308
t_startp = 2309
.END
.STRINGS
$action = ""
$uploaded = ""
$percent = ""
.END
