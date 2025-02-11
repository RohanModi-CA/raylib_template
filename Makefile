CC = gcc

# Executable name
EXECUTABLE = mygame

# Directories
RAYLIB_DIR = resources/lib/raylib
WORLD_FUNCS_DIR = resources/world_funcs

# Source files (ONLY .c files here!)
SOURCES = main.c \
#	$(WORLD_FUNCS_DIR)/buggs.c  # Add buggs.c here with its path

# Object files (automatically generated from SOURCES)
OBJECTS = $(SOURCES:.c=.o)

# --- Compilation Flags ---
# Common flags for all compilations
COMMON_CFLAGS = -Wall -g

# Include directories (for header files)
INCLUDES = -I$(RAYLIB_DIR) -I$(WORLD_FUNCS_DIR)

# CFLAGS for compilation (combining common flags and includes)
CFLAGS = $(COMMON_CFLAGS) $(INCLUDES)

# --- Linking ---
# Library directories (where to find libraries)
LDFLAGS = -L$(RAYLIB_DIR)

# Libraries to link (the actual libraries)
LIBS = -lraylib -lm

# --- Rules ---

# Default target: Build the executable
all: $(EXECUTABLE)

# Rule to link the executable
$(EXECUTABLE): $(OBJECTS)
	$(CC) -o $(EXECUTABLE) $(OBJECTS) $(LDFLAGS) $(LIBS)

# Rule to compile individual source files into object files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# --- Clean ---
# Rule to clean up the build
clean:
	rm -f $(OBJECTS) $(EXECUTABLE)

# Phony targets (targets that aren't actual files)
.PHONY: all clean
