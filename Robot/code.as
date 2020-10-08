.SIG_COMMENT
.AUXDATA
N_INT1    "gp_home  "
N_INT2    "gp_aim1  "
N_INT3    "gp_aim2  "
N_INT4    "gp_a1  "
N_INT5    "gp_a2  "
N_INT6    "gp_a3  "
N_INT7    "gp_a4  "
N_INT8    "gp_frame  "
N_INT9    "gp_endp  "
.END
.INTER_PANEL_D
0,10,"","  RUN PC","","",10,4,7,1,pcexec fotorobotpc,0
1,10,"","  STOP PC","","",10,4,7,2,stopcon = true,0
3,2,"","   CANCEL","   DRAW","",10,4,13,2050,0
7,14,"uploaded","Uploaded","",10,9,0
8,14,"percent","Drawn","",10,9,0
28,10,"","Start","","",10,4,9,3,pcexec 2: fotorobotsetup,0
30,2,"","home point","","",10,4,7,2001,0
31,2,"","  aim 1","","",10,4,9,2002,0
32,2,"","  aim 2","","",10,4,9,2003,0
33,2,"","  endp","","",10,4,7,2009,0
35,2,"","    a1","","",10,4,7,2004,0
36,2,"","    a2","","",10,4,7,2005,0
37,9,1,5,7
38,9,1,4,7
42,2,"","    a3","","",10,4,7,2006,0
43,2,"","    a4","","",10,4,7,2007,0
44,9,2,5,9
45,9,2,4,9
50,2,"","   Create","   frame","",10,4,7,2008,0
51,9,3,5,9
52,9,3,4,9
.END
.INTER_PANEL_TITLE
"Control",1
"Setup",1
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
.PROGRAM close_socket() #47;Closing communication
  TCP_CLOSE ret,sock_id;Normal socket closure 
  IF ret<0 THEN
    PRINT "TCP_CLOSE error ERROE=(",ret,") ",$ERROR(ret)
    TCP_CLOSE ret1,sock_id;Forced closure of socket (shutdown) 
    IF ret1<0 THEN
      PRINT "TCP_CLOSE error id=",sock_id
    END
  ELSE
    PRINT "TCP_CLOSE OK id=",sock_id
  END
  TCP_END_LISTEN ret,port
  IF ret<0 THEN
    PRINT "TCP_CLOSE error id=",sock_id
  ELSE
    PRINT "TCP_CLOSE OK id=",sock_id
  END
.END
.PROGRAM fotorobot() #0
  CP OFF
  ACCURACY 0.1 ALWAYS
  $action = ""
  WHILE TRUE DO
    IF $action=="AIM" THEN
      $action = ""
      BREAK
      SPEED 1000 MM/S ALWAYS
      JMOVE #aim_point1
retraim:
      JMOVE #aim_point
    END
    IF $action=="HOME" THEN
      $action = ""
      BREAK
      SPEED 1000 MM/S ALWAYS
      JMOVE #aim_point1
      JMOVE #home_point
    END
    IF $action=="WAIT" THEN
      $action = ""
      BREAK
      SPEED 1000 MM/S ALWAYS
      JMOVE #aim_point
      JMOVE #aim_point1
      JMOVE #home_point
    END
    IF $action=="DRAW" THEN
      BREAK
      SPEED 3000 MM/S ALWAYS
      drawed_points = 0
      watched = FALSE
      WHILE TRUE DO
        IF drawed_points<points_length THEN
          IF $action!="STOPDRAW" THEN
            LMOVE startp+TRANS(dpt[drawed_points,0],-dpt[drawed_points,1],-dpt[drawed_points,2])
            drawed_points = drawed_points+1
            $percent = $ENCODE(/F6.2,drawed_points*100/points_length)+" %"
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
      drawfinished = TRUE
      $action = ""
    END
  END
.END
.PROGRAM fotorobotcalib() #0
  JMOVE #home_point
  JMOVE #aim_point1
  JMOVE #aim_point
  JMOVE #endp
  LMOVE startp
  LMOVE startp+TRANS(100)
  LMOVE startp+TRANS(,-100)
  LMOVE startp+TRANS(100,-100)
  LMOVE startp+TRANS(100,-100,-15)
  LMOVE a1
  LMOVE a2
  LMOVE a3
  LMOVE a4
.END
.PROGRAM fotorobotpc() #24
  port = 49152
  max_length = 255
  tout_open = 1
  tout_rec = 1
  text_id = 0
  tout = 1
  eret = 0
  rret = 0
  stopcon = FALSE; 
;WHILE TRUE DO 
con_begin:
  IF TASK(1)<>1 THEN
    MC execute fotorobot 
  END
  CALL open_socket;Connecting communication 
  IF sock_id<0 THEN
    IF stopcon==TRUE THEN
      GOTO exit
    END
    GOTO con_begin
  END
  PRINT "Connection established"
cyc_begin:
  IF stopcon==TRUE THEN
    GOTO exit
  END
  tout_rec = 5
  CALL recv;Receiving the result of processing 1 
  IF rret==-34024 THEN
    PRINT "Recieve timeout"
    GOTO cyc_begin
  END
  IF rret==-34025 THEN
    PRINT "Connection error"
    CALL close_socket
    GOTO con_begin
  END
  IF rret==0 THEN
    PRINT $recv_buf[1]
    IF $recv_buf[1]=="AIM" THEN
      $action = "AIM"
    END
    IF $recv_buf[1]=="HOME" THEN
      $action = "HOME"
    END
    IF $recv_buf[1]=="WAIT" THEN
      $action = "WAIT"
    END
    IF $recv_buf[1]=="DRAW" THEN
      drawfinished = FALSE
      $sdata[1] = "OK"
      CALL send(eret,$sdata[1])
      tout_rec = 60
      CALL recv
      points_length = VAL($recv_buf[1])
      PRINT "Points len",points_length
      eret = 0
      $sdata[1] = "OK"
      CALL send(eret,$sdata[1])
      $fin = ""
      recieved_point = 0
      WHILE $fin=="" DO
        CALL recv
        IF $recv_buf[1]=="STOPDRAW" THEN
          $fin = "OK"
          $action = "STOPDRAW"
          eret = 0
          $sdata[1] = "OK"
          CALL send(eret,$sdata[1])
          GOTO recv_end
        END
    ;IF SIG(2050) 
    ; $action = "STOPDRAW"
    ; GOTO recv_end
    ;END
        IF $recv_buf[1]=="ENDRECV" THEN
          $fin = "OK"
        ELSE
          FOR i = 0 TO 2 STEP 1
            $temp = $DECODE($recv_buf[1],":",0)
            dpt[recieved_point,i] = VAL($temp)
            PRINT dpt[recieved_point,i]
            $temp = $DECODE($recv_buf[1],":",1)
          END
          recieved_point = recieved_point+1
          IF recieved_point*100/points_length>5 THEN; recieved_point==50 THEN 
            $action = "DRAW"
          END
          $uploaded = $ENCODE(/F6.2,recieved_point*100/points_length)+" %"
        END
recv_end:
        eret = 0
        $sdata[1] = "OK"    
        CALL send(eret,$sdata[1])
      END
    ;print "receiveAudio"
    WHILE drawfinished!=TRUE
    IF SIG(2050) 
      $action = "STOPDRAW"
    END
    ;tout_rec = 10
    ;print $recv_buf[1]
    ;CALL recv
        ;IF $recv_buf[1]=="STOPDRAW" THEN
        ; $action = "STOPDRAW"
        ;  eret = 0
         ; $sdata[1] = "OK"
        ;  CALL send(eret,$sdata[1])
        ;END
    
    END
      ;WAIT drawfinished==TRUE
    
    
      $sdata[1] = "DRAWOK"
      CALL send(eret,$sdata[1])
    END
  END
  GOTO cyc_begin
;END 
exit:
  CALL close_socket;Closing communication 
exit_end:
.END
.PROGRAM fotorobotsetup () #20
  WHILE TRUE DO
    IF SIG (gp_home) THEN
      HERE #home_point
    END
    IF SIG (gp_aim1) THEN
      HERE #aim_point
    END
    IF SIG (gp_aim2) THEN
      HERE #aim_point1
    END
    IF SIG (gp_a1) THEN
      HERE a1
    END
    IF SIG (gp_endp) THEN
      HERE #endp
    END
    IF SIG (gp_a2) THEN
      HERE a2
    END
    IF SIG (gp_a3) THEN
      HERE a3
    END
    IF SIG (gp_a4) THEN
      HERE a4
    END
    IF SIG (gp_frame) THEN
      POINT startp = FRAME (a2, a3, a4, a1)
    END
    CALL pointtostr ("#home_point", .$rs)
    IFPWOVERWRITE 1, 1 = "#home_point: " + .$rs
    CALL pointtostr ("#aim_point", .$rs)
    IFPWOVERWRITE 1, 2 = "#aim_point: " + .$rs
    CALL pointtostr ("#aim_point1", .$rs)
    IFPWOVERWRITE 1, 3 = "#aim_point1: " + .$rs
    CALL pointtostr ("#endp", .$rs)
    IFPWOVERWRITE 1, 3 = "#aim_point1: " + .$rs
    CALL pointtostr ("a1", .$rs)
    IFPWOVERWRITE 1, 4 = "a1: " + .$rs
    CALL pointtostr ("a2", .$rs)
    IFPWOVERWRITE 2, 1 = "a2: " + .$rs
    CALL pointtostr ("a3", .$rs)
    IFPWOVERWRITE 2, 2 = "a3: " + .$rs
    CALL pointtostr ("a4", .$rs)
    IFPWOVERWRITE 2, 3 = "a4: " + .$rs
    CALL pointtostr ("startp", .$rs)
    IFPWOVERWRITE 2, 4 = "startp: " + .$rs
  END
.END
.PROGRAM open_socket() #167;Starting c ommunication
  er_count = 0
listen:
  TCP_LISTEN retl,port
  IF retl<0 THEN
    IF er_count>=5 THEN
      PRINT "Connection with PC is failed (LISTEN). Program is stopped."
      sock_id = -1
      GOTO exit
    ELSE
      er_count = er_count+1
      PRINT "TCP_LISTEN error=",retl,"    error count=",er_count
      GOTO listen
    END
  ELSE
    PRINT "TCP_LISTEN OK ",retl
  END
  er_count = 0
accept:
  TCP_ACCEPT sock_id,port,tout_open,ip[1]
  IF sock_id<0 THEN
    IF er_count>=5 THEN
      PRINT "Connection with PC is failed (ACCEPT). Program is stopped."
      TCP_END_LISTEN ret,port
      sock_id = -1
    ELSE
      er_count = er_count+1
      PRINT "TCP_ACCEPT error id=",sock_id,"  error count=",er_count
      GOTO accept
    END
  ELSE
    PRINT "TCP_ACCEPT OK id=",sock_id
  END
exit:
.END
.PROGRAM recv() #40829;Communication Receiving data
  .num = 0
  tcp_recv rret,sock_id,$recv_buf[1],.num,tout_rec,max_length
  IF rret<0 THEN
    PRINT "TCP_RECV error in RECV",rret
    $recv_buf[1] = "000"
  ELSE
    IF .num>0 THEN
      PRINT "TCP_RECV OK  in RECV",rret
    ELSE
      $recv_buf[1] = "000"
    END
  END
.END
.PROGRAM send(.ret,.$data) #33403;Communication Sending data
  $send_buf[1] = .$data
  buf_n = 1
  .ret = 1
  tcp_send .ret,sock_id,$send_buf[1],buf_n,tout
  IF .ret<0 THEN
    .ret = -1
    PRINT "TCP_SEND error in SEND",.ret
  ELSE
    PRINT "TCP_SEND OK  in SEND",.ret
  END
.END
.PROGRAM t1() #0
  TDRAW 0,0,0,0,35
  TDRAW 0,0,0,0,-70
  JMOVE #aim_point
  JMOVE #aim_add1
  JMOVE #aim_add2
  JMOVE #aim_again
  JMOVE #aim_again2
.END
.PROGRAM tcp_recv() #135;Communication Receiving data
  .num = 0
  tcp_recv rret,sock_id,$recv_buf[1],.num,tout_rec,max_length
  IF rret<0 THEN
    PRINT "TCP_RECV error in RECV",rret
    $recv_buf[1] = "000"
  ELSE
    IF .num>0 THEN
      PRINT "TCP_RECV OK  in RECV",rret
    ELSE
      $recv_buf[1] = "000"
    END
  END
.END
.PROGRAM tcp_send(.ret,.$data) #0;Communication Sending data
  $send_buf[1] = .$data
  buf_n = 1
  .ret = 1
  tcp_send .ret,sock_id,$send_buf[1],buf_n,tout
  IF .ret<0 THEN
    .ret = -1
    PRINT "TCP_SEND error in SEND",.ret
  ELSE
    PRINT "TCP_SEND OK  in SEND",.ret
  END
.END
.PROGRAM transtostr (.pt,.$string) ; 
      PRINT 0: "Aaa"
      DECOMPOSE .data[0] = .pt
      .$string = ""
      FOR .i = 0 TO 5
        TYPE .data[.i]
        .$string = .$string + $ENCODE (/D, .data[.i]) + ";"
      END
.END
.PROGRAM jointtostr(.#pt,.$string)
      POINT .#temp = .#pt
      DECOMPOSE .data[0] = .#temp
      .$string = ""
      FOR .i = 0 TO 5
        TYPE .data[.i]
        .$string = .$string + $ENCODE (/D, .data[.i]) + ";"
      END
.END
.PROGRAM pointtostr(.$pos,.$res)
      DECOMPOSE .data[0] = STRTOPOS(.$pos)
      .$res = ""
      FOR .i = 0 TO 5
        .valu = ROUND(.data[.i])
        .$res = .$res + $ENCODE (/D, .valu)  + ", "
      END
.END
.PROGRAM Comment___ () ; Comments for IDE. Do not use.
	; @@@ PROJECT @@@
	; @@@ HISTORY @@@
	; @@@ INSPECTION @@@
	; @@@ CONNECTION @@@
	; KROSET R01
	; 127.0.0.1
	; 9105
	; @@@ PROGRAM @@@
	; 0:close_socket:F
	; 0:fotorobot:F
	; 0:fotorobotcalib:F
	; 0:fotorobotpc:F
	; 0:fotorobotsetup:F
	; 0:open_socket:F
	; 0:recv:F
	; 0:send:F
	; 0:t1:F
	; 0:tcp_recv:F
	; 0:tcp_send:F
	; 0:transtostr:F
	; .trans 
	; .pt 
	; .$string 
	; 0:jointtostr:F
	; .#pt 
	; .$rs 
	; 0:pointtostr:F
	; .$pos 
	; .$res 
	; @@@ TRANS @@@
	; @@@ JOINTS @@@
	; @@@ REALS @@@
	; @@@ STRINGS @@@
	; @@@ INTEGER @@@
	; @@@ SIGNALS @@@
	; gp_home 
	; gp_aim1 
	; gp_aim2 
	; gp_a1 
	; gp_a2 
	; gp_a3 
	; gp_a4 
	; gp_frame 
	; gp_endp 
	; @@@ TOOLS @@@
	; @@@ BASE @@@
	; @@@ FRAME @@@
	; @@@ BOOL @@@
.END
.REALS
buf_n = 1
drawed_points = 594
drawfinished = -1
er_count = 5
eret = 0
i = 3
ip[1] = 192
ip[2] = 168
ip[3] = 0
ip[4] = 100
max_length = 255
points_length = 594
port = 49152
recieved_point = 594
ret = 0
retl = 0
rret = -34025
stopcon = 0
text_id = 0
tout = 60
tout_open = 5
tout_rec = 5
watched = -1
gp_home = 2001
gp_aim1 = 2002
gp_aim2 = 2003
gp_a1 = 2004
gp_a2 = 2005
gp_a3 = 2006
gp_a4 = 2007
gp_frame = 2008
gp_endp = 2009
.END
.STRINGS
$action = ""
$fin = "OK"
$percent = "100.00 %"
$recv_buf[1] = "000"
$sdata[1] = "DRAWOK"
$send_buf[1] = "DRAWOK"
$snd[0] = "asdasdasd"
$state = "STOP"
$temp = ":"
$uploaded = "100.00 %"
.END
