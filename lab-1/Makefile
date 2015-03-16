CC	= arm-linux-gnueabihf-gcc
CFLAGS	= -O1 -Wall
LDFLAGS = -fno-stack-protector

objects	= fibseq.o fib.o
default: fibseq

.PHONY: default clean qemu

fibseq: $(objects)
	$(CC) $(LDFLAGS) -o $@ $^

fib.o: fib.s
fibseq.o: fibseq.c

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

%.o: %.s
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	rm -f $(objects) fibseq

QEMU_CMD = qemu-arm -L /usr/arm-linux-gnueabihf ./fibseq &
CMD = yes $$number | $(call QEMU_CMD) sleep .2
qemu: fibseq
	@for number in $(shell seq 5 30) ; do \
        $(call CMD) ; \
    	done
	



#	for j in 1 2 3 4;do\ 
#	CMD;\
#	sleep .1;\
#	done
#	@yes 6 | $(call QEMU_CMD)
#	@sleep .1
#	@sleep 1

