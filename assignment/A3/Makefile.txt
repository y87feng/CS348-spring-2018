# put the name of your application here:
#NAME= adhoc

###############################################
# don't touch anything below this line
###############################################
DB2PATH = /home/db2inst2/sqllib
# The following compile and link options are for the gcc
CC=gcc

CFLAGS=-I$(DB2PATH)/include 
#LIBS=-L$(DB2PATH)/lib -R$(DB2PATH)/lib -ldb2
LIBS=-L$(DB2PATH)/lib -ldb2


all: $(NAME)

$(NAME): $(NAME).sqc util.o
	db2 connect to cs348
	db2 prep $(NAME).sqc bindfile
	db2 bind $(NAME).bnd
	db2 connect reset
	$(CC) $(CFLAGS) -c $(NAME).c 
	$(CC) $(CFLAGS) -o $(NAME) $(NAME).o util.o $(LIBS)

clean:
	rm -f $(NAME) $(NAME).c $(NAME).o $(NAME).bnd

util.o : util.c
	$(CC) -c util.c $(CFLAGS)


