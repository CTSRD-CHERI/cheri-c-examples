#example:  cap_over_mq

#Purpose: show a fix for what happens when trying to send a capability over a message queue


#Build:
    make   

#Run
./build/cap_over_mq 
Message queue opened/created successfully
Message queue  msg 0 sent successfully
i=0
send, 0
Message queue  msg rx 
got a result, 0 8
 msg is this is msg 0
Message queue  msg 1 sent successfully
i=1
send, 0
Message queue  msg rx 
got a result, 50 8
 msg is this is msg 1
Message queue  msg 2 sent successfully
i=2
send, 0
Message queue  msg rx 
got a result, a0 8
 msg is this is msg 2
Message queue  msg 3 sent successfully
i=3
send, 0
Message queue  msg rx 
got a result, f0 8
 msg is this is msg 3
Message queue  msg 4 sent successfully
i=4
send, 0
Message queue  msg rx 
got a result, 140 8
 msg is this is msg 4
Message queue  msg 5 sent successfully
i=5
send, 0
Message queue  msg rx 
got a result, 190 8
 msg is this is msg 5
Message queue  msg 6 sent successfully
i=6
send, 0
Message queue  msg rx 
got a result, 1e0 8
 msg is this is msg 6
Message queue  msg 7 sent successfully
i=7
send, 0
Message queue  msg rx 
got a result, 230 8
 msg is this is msg 7
Message queue  msg 8 sent successfully
i=8
send, 0
Message queue  msg rx 
got a result, 280 8
 msg is this is msg 8
Message queue  msg 9 sent successfully
i=9
send, 0
Message queue  msg rx 
got a result, 2d0 8
 msg is this is msg 9
Message queue  msg 10 sent successfully
i=10
send, 0
Message queue  msg rx 
got a result, 320 8
 msg is this is msg 10
Message queue  msg 11 sent successfully
i=11
send, 0
Message queue  msg rx 
got a result, 370 8
 msg is this is msg 11
Message queue  msg 12 sent successfully
i=12
send, 0
Message queue  msg rx 
got a result, 3c0 8
 msg is this is msg 12
Message queue  msg 13 sent successfully
i=13
send, 0
Message queue  msg rx 
got a result, 410 8
 msg is this is msg 13
Message queue  msg 14 sent successfully
i=14
send, 0
Message queue  msg rx 
got a result, 460 8
 msg is this is msg 14
Message queue  msg 15 sent successfully
i=15
send, 0
Message queue  msg rx 
got a result, 4b0 8
 msg is this is msg 15
`
