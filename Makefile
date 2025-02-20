CC = gcc
CFLAGS = -Wall -Wextra -O2 -fPIC
AR = ar
ARFLAGS = rcs

SRC_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build
LIB_NAME = nightwatch

SOURCES = $(wildcard $(SRC_DIR)/*.c)
OBJECTS = $(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/%.o, $(SOURCES))

STATIC_LIB = $(BUILD_DIR)/lib$(LIB_NAME).a
SHARED_LIB = $(BUILD_DIR)/lib$(LIB_NAME).so

all: $(STATIC_LIB) $(SHARED_LIB)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -I$(INCLUDE_DIR) -c $< -o $@

$(STATIC_LIB): $(OBJECTS)
	$(AR) $(ARFLAGS) $@ $^

$(SHARED_LIB): $(OBJECTS)
	$(CC) -shared -o $@ $^

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

install: all
	mkdir -p /usr/local/lib /usr/local/include/$(LIB_NAME)
	cp $(STATIC_LIB) $(SHARED_LIB) /usr/local/lib/
	cp $(INCLUDE_DIR)/*.h /usr/local/include/$(LIB_NAME)/

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all install clean test
