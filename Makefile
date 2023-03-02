COMPILER := g++
OPTIONS := -std=c++20 -g -Wall
COMPILE := $(COMPILER) $(OPTIONS)
BUILD_DIR := build

all: $(BUILD_DIR)/main

$(BUILD_DIR)/main: main.cpp $(BUILD_DIR)/Image.o
	$(COMPILE) $< $(BUILD_DIR)/*.o -o $@

$(BUILD_DIR)/Image.o: src/Image.cpp build
	$(COMPILE) -c $< -o $@

# Make the build directory if it doesn't exist
build:
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)/*