obj-m := seq_file.o
#EXTRA_CFLAGS = -g -Wall
KERNELDIR := ~/code510/kernel/linux-3.10.103
PWD := $(shell pwd)
default:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
clean:
	make -C $(KERNELDIR) M=$(PWD) clean
