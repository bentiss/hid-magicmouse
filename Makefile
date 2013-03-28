obj-$(CONFIG_HID_MAGICMOUSE)    += hid-magicmouse.o

KDIR := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)
default:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules

test: hid-magicmouse.ko
	rmmod hid_magicmouse ; insmod ./hid-magicmouse.ko

install: hid-magicmouse.ko
	/bin/bash install.sh

uninstall:
	/bin/bash restore.sh

clean:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean

