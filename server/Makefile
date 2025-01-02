CC = gcc
LIB = -lfcgi
TARGET = serv

all: clean server

server: server.c
	$(CC) $^ $(LIB) -o $(TARGET)

clean:
	rm -rf $(TARGET)