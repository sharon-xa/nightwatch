# nightwatch

## Content
- [nightwatch](#nightwatch)
  - [Content](#content)
- [Build and Install](#build-and-install)
  - [Build](#build)
  - [Install](#install)
  - [Cleaning the Build](#cleaning-the-build)
- [Usage](#usage)
  - [1. Linking the Static Library](#1-linking-the-static-library)
  - [2. Linking the Shared Library](#2-linking-the-shared-library)
- [Development](#development)
  - [clangd LSP Setup](#clangd-lsp-setup)
  - [Formatting C Files](#formatting-c-files)

# Build and Install

## Build
To compile both **static** (`.a`) and **shared** (`.so`) versions of the library, run:  
```sh
make
```
This will:
- Compile source files from `src/`
- Place object files (`.o`) in the `build/` directory
- Generate:
  - `build/libnightwatch.a` (Static library)
  - `build/libnightwatch.so` (Shared library)

## Install
To install the library system-wide:  
```sh
sudo make install
```
This will:
- Copy **`libnightwatch.a`** and **`libnightwatch.so`** to `/usr/local/lib/`
- Copy header files from `include/` to `/usr/local/include/nightwatch/`

## Cleaning the Build
To remove compiled files:  
```sh
make clean
```

---

# Usage

## 1. Linking the Static Library
When using the static library (`.a`), compile your program with:  
```sh
gcc -Iinclude -Lbuild -lnightwatch main.c -o main
```

## 2. Linking the Shared Library
For the shared library (`.so`), use:  
```sh
gcc -Iinclude -Lbuild -lnightwatch main.c -o main
export LD_LIBRARY_PATH=build:$LD_LIBRARY_PATH
./main
```

---

# Development

## clangd LSP Setup
1. Bear is a tool that generates `compile_commands.json`, install [bear](https://github.com/rizsotto/Bear)
2. Generate compile_commands.json, Run:
```bash
bear -- make
```
3. clang should work with no issue.

## Formatting C Files
1. Use clang.
2. The `.clang-format` file is the file that contains all rules for formatting c code.
3. You should be good to go with any code editor you use just make sure it's using clang as the lsp.
