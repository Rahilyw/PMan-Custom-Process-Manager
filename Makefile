# Variables
CC = gcc
CFLAGS = -Wall -g
LIBS = -lreadline
SRC = src/PMan.c
TARGET = PMan

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $(SRC) $(LIBS) -o $(TARGET)

clean:
	rm -f $(TARGET) *.o *.exe ._*