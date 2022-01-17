include ./makefile.conf
NAME=NeoPixel

STARTUP_DEFS=-D__STARTUP_CLEAR_BSS -D__START=main

# Need following option for LTO as LTO will treat retarget functions as
# unused without following option
CFLAGS+=-fno-builtin

LDSCRIPTS=-L. -L$(BASE)Library/Device/Nuvoton/M480/Source/GCC -T gcc_arm_128k.ld

LFLAGS=$(USE_NANO) $(USE_NOHOST) $(LDSCRIPTS) $(GC) $(MAP)

#$(NAME)-$(CORE).axf: main.c $(NAME).c $(STARTUP)
#	$(CC) $^ $(CFLAGS) $(LFLAGS) -o $@
IPATH= \
	. \
	../M480BSP/Library/CMSIS/Include \
	../M480BSP/Library/Device/Nuvoton/M480/Include \
	../M480BSP/Library/StdDriver/inc \
	User
SRC=$(wildcard \
	*.c \
	./User/*.c \
)
SRC_LIB=$(wildcard \
	../M480BSP/Library/Device/Nuvoton/M480/Source/*.c \
	../M480BSP/Library/Device/Nuvoton/M480/Source/GCC/*.c \
	../M480BSP/Library/StdDriver/src/*.c \
)
OBJS = $(patsubst %.c,./Objects/%.o,$(notdir $(SRC)))
OBJS_LIB = $(patsubst %.c,./Objects/%.o,$(notdir $(SRC_LIB)))

$(NAME): $(OBJS) $(OBJS_LIB)
	cd ./Objects && $(CC) *.o $(CFLAGS) $(LFLAGS) $(STARTUP) -o $@.axf $(addprefix -I ../,$(IPATH)) 
	$(CP) -O binary ./Objects/$@.axf ./Objects/$@.bin

$(OBJS): $(SRC)
	mkdir -p ./Objects
	cd ./Objects && $(CC) $(addprefix ../,$^) $(CFLAGS) -c $(addprefix -I ../,$(IPATH))

$(OBJS_LIB): $(SRC_LIB)
	mkdir -p ./Objects
	cd ./Objects && $(CC) $(addprefix ../,$^) $(CFLAGS) -c $(addprefix -I ../,$(IPATH))

.PHONY: clean

clean:
	rm -f ./Objects/*