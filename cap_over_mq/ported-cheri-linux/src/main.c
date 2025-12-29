#include <fcntl.h>
#include <sys/stat.h>
#include <mqueue.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <stddef.h>

//cap_over_mq

/*
 * CHERI CHANGES START
 * {
 *   "updated": ,
 *   "target_type": ,
 *   "changes": [
 *     "can't send a cap over a message queue"
 *   ],
 *   "change_comment": "need to send ptrdiff_t from base instead over message queue and recreate cap afterwards. Note assumes that all
 *    messages come out of a common pool and subobjbnds lenient compile option is default"
 * }
 * CHERI CHANGES END
 */

char msg[16][80];
char* msg1;
int main() {
    mqd_t mq;
    struct mq_attr attr;

    attr.mq_flags = 0;
    attr.mq_maxmsg = 16;
    attr.mq_msgsize = 8;
    attr.mq_curmsgs = 0;

    mq = mq_open("mq", O_CREAT | O_RDWR, 0644, &attr);
    if (mq == (mqd_t)-1) {
        perror("mq_open");
        return 1;
    }

    printf("Message queue opened/created successfully\n");
    int i;
    for(i=0;i<16;i++) 
    {

    printf("Message queue  msg %d sent successfully\n",i);
    msg1 = &msg[i][0];
    sprintf(msg1,"this is msg %d",i);
    ptrdiff_t off = msg1 - &msg[0][0];
    int r2 =  mq_send(mq,(char*)&off, 8,1);
    printf("i=%d\n",i);
    printf("send, %d\n", r2);
    if (r2<0) perror("mq_send");


    printf("Message queue  msg rx \n");
    char * result;
    unsigned int pri;
    ptrdiff_t result2;
    ssize_t   r =mq_receive(mq, (char *) &result2, 8, &pri);
    if (r<0) perror("recv");
    printf("got a result, %lx %zd\n",result2,r);
    result = &msg[0][0]+result2;
    printf(" msg is %s\n", result);
   }
    // Close the message queue
    if (mq_close(mq) == -1) {
        perror("mq_close");
        return 1;
    }

    // Unlink the message queue (optional, to remove it from the system)
    if (mq_unlink("mq") == -1) {
        perror("mq_unlink");
        return 1;
    }

    return 0;
}
