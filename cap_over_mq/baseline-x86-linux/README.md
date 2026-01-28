#example:  cap_over_mq

#Purpose: show what happens when trying to send a capability over a message queue


#Build:
    make   

#Run
    ./build/cap_over/mq

Message queue opened/created successfully
Message queue  msg 0 sent successfully
i=0
send, 0
Message queue  msg rx 
Segmentation fault (core dumped)


