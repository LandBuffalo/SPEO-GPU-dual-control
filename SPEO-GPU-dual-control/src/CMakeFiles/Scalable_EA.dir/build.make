# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /apps/skylake/software/core/cmake/3.10.2/bin/cmake

# The command to remove a file.
RM = /apps/skylake/software/core/cmake/3.10.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/cjin/SPEO/SPEO_GPU_master

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/cjin/SPEO/SPEO_GPU_master

# Include any dependencies generated for this target.
include src/CMakeFiles/Scalable_EA.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/Scalable_EA.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/Scalable_EA.dir/flags.make

src/CMakeFiles/Scalable_EA.dir/buffer_manage.cc.o: src/CMakeFiles/Scalable_EA.dir/flags.make
src/CMakeFiles/Scalable_EA.dir/buffer_manage.cc.o: src/buffer_manage.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cjin/SPEO/SPEO_GPU_master/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/Scalable_EA.dir/buffer_manage.cc.o"
	cd /home/cjin/SPEO/SPEO_GPU_master/src && /apps/skylake/software/compiler/gcc/7.3.0/openmpi/3.0.0/bin/mpicxx  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Scalable_EA.dir/buffer_manage.cc.o -c /home/cjin/SPEO/SPEO_GPU_master/src/buffer_manage.cc

src/CMakeFiles/Scalable_EA.dir/buffer_manage.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Scalable_EA.dir/buffer_manage.cc.i"
	cd /home/cjin/SPEO/SPEO_GPU_master/src && /apps/skylake/software/compiler/gcc/7.3.0/openmpi/3.0.0/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cjin/SPEO/SPEO_GPU_master/src/buffer_manage.cc > CMakeFiles/Scalable_EA.dir/buffer_manage.cc.i

src/CMakeFiles/Scalable_EA.dir/buffer_manage.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Scalable_EA.dir/buffer_manage.cc.s"
	cd /home/cjin/SPEO/SPEO_GPU_master/src && /apps/skylake/software/compiler/gcc/7.3.0/openmpi/3.0.0/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cjin/SPEO/SPEO_GPU_master/src/buffer_manage.cc -o CMakeFiles/Scalable_EA.dir/buffer_manage.cc.s

src/CMakeFiles/Scalable_EA.dir/buffer_manage.cc.o.requires:

.PHONY : src/CMakeFiles/Scalable_EA.dir/buffer_manage.cc.o.requires

src/CMakeFiles/Scalable_EA.dir/buffer_manage.cc.o.provides: src/CMakeFiles/Scalable_EA.dir/buffer_manage.cc.o.requires
	$(MAKE) -f src/CMakeFiles/Scalable_EA.dir/build.make src/CMakeFiles/Scalable_EA.dir/buffer_manage.cc.o.provides.build
.PHONY : src/CMakeFiles/Scalable_EA.dir/buffer_manage.cc.o.provides

src/CMakeFiles/Scalable_EA.dir/buffer_manage.cc.o.provides.build: src/CMakeFiles/Scalable_EA.dir/buffer_manage.cc.o


src/CMakeFiles/Scalable_EA.dir/island_EA.cc.o: src/CMakeFiles/Scalable_EA.dir/flags.make
src/CMakeFiles/Scalable_EA.dir/island_EA.cc.o: src/island_EA.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cjin/SPEO/SPEO_GPU_master/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/CMakeFiles/Scalable_EA.dir/island_EA.cc.o"
	cd /home/cjin/SPEO/SPEO_GPU_master/src && /apps/skylake/software/compiler/gcc/7.3.0/openmpi/3.0.0/bin/mpicxx  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Scalable_EA.dir/island_EA.cc.o -c /home/cjin/SPEO/SPEO_GPU_master/src/island_EA.cc

src/CMakeFiles/Scalable_EA.dir/island_EA.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Scalable_EA.dir/island_EA.cc.i"
	cd /home/cjin/SPEO/SPEO_GPU_master/src && /apps/skylake/software/compiler/gcc/7.3.0/openmpi/3.0.0/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cjin/SPEO/SPEO_GPU_master/src/island_EA.cc > CMakeFiles/Scalable_EA.dir/island_EA.cc.i

src/CMakeFiles/Scalable_EA.dir/island_EA.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Scalable_EA.dir/island_EA.cc.s"
	cd /home/cjin/SPEO/SPEO_GPU_master/src && /apps/skylake/software/compiler/gcc/7.3.0/openmpi/3.0.0/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cjin/SPEO/SPEO_GPU_master/src/island_EA.cc -o CMakeFiles/Scalable_EA.dir/island_EA.cc.s

src/CMakeFiles/Scalable_EA.dir/island_EA.cc.o.requires:

.PHONY : src/CMakeFiles/Scalable_EA.dir/island_EA.cc.o.requires

src/CMakeFiles/Scalable_EA.dir/island_EA.cc.o.provides: src/CMakeFiles/Scalable_EA.dir/island_EA.cc.o.requires
	$(MAKE) -f src/CMakeFiles/Scalable_EA.dir/build.make src/CMakeFiles/Scalable_EA.dir/island_EA.cc.o.provides.build
.PHONY : src/CMakeFiles/Scalable_EA.dir/island_EA.cc.o.provides

src/CMakeFiles/Scalable_EA.dir/island_EA.cc.o.provides.build: src/CMakeFiles/Scalable_EA.dir/island_EA.cc.o


src/CMakeFiles/Scalable_EA.dir/main.cc.o: src/CMakeFiles/Scalable_EA.dir/flags.make
src/CMakeFiles/Scalable_EA.dir/main.cc.o: src/main.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cjin/SPEO/SPEO_GPU_master/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/CMakeFiles/Scalable_EA.dir/main.cc.o"
	cd /home/cjin/SPEO/SPEO_GPU_master/src && /apps/skylake/software/compiler/gcc/7.3.0/openmpi/3.0.0/bin/mpicxx  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Scalable_EA.dir/main.cc.o -c /home/cjin/SPEO/SPEO_GPU_master/src/main.cc

src/CMakeFiles/Scalable_EA.dir/main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Scalable_EA.dir/main.cc.i"
	cd /home/cjin/SPEO/SPEO_GPU_master/src && /apps/skylake/software/compiler/gcc/7.3.0/openmpi/3.0.0/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cjin/SPEO/SPEO_GPU_master/src/main.cc > CMakeFiles/Scalable_EA.dir/main.cc.i

src/CMakeFiles/Scalable_EA.dir/main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Scalable_EA.dir/main.cc.s"
	cd /home/cjin/SPEO/SPEO_GPU_master/src && /apps/skylake/software/compiler/gcc/7.3.0/openmpi/3.0.0/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cjin/SPEO/SPEO_GPU_master/src/main.cc -o CMakeFiles/Scalable_EA.dir/main.cc.s

src/CMakeFiles/Scalable_EA.dir/main.cc.o.requires:

.PHONY : src/CMakeFiles/Scalable_EA.dir/main.cc.o.requires

src/CMakeFiles/Scalable_EA.dir/main.cc.o.provides: src/CMakeFiles/Scalable_EA.dir/main.cc.o.requires
	$(MAKE) -f src/CMakeFiles/Scalable_EA.dir/build.make src/CMakeFiles/Scalable_EA.dir/main.cc.o.provides.build
.PHONY : src/CMakeFiles/Scalable_EA.dir/main.cc.o.provides

src/CMakeFiles/Scalable_EA.dir/main.cc.o.provides.build: src/CMakeFiles/Scalable_EA.dir/main.cc.o


src/CMakeFiles/Scalable_EA.dir/master.cc.o: src/CMakeFiles/Scalable_EA.dir/flags.make
src/CMakeFiles/Scalable_EA.dir/master.cc.o: src/master.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cjin/SPEO/SPEO_GPU_master/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/CMakeFiles/Scalable_EA.dir/master.cc.o"
	cd /home/cjin/SPEO/SPEO_GPU_master/src && /apps/skylake/software/compiler/gcc/7.3.0/openmpi/3.0.0/bin/mpicxx  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Scalable_EA.dir/master.cc.o -c /home/cjin/SPEO/SPEO_GPU_master/src/master.cc

src/CMakeFiles/Scalable_EA.dir/master.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Scalable_EA.dir/master.cc.i"
	cd /home/cjin/SPEO/SPEO_GPU_master/src && /apps/skylake/software/compiler/gcc/7.3.0/openmpi/3.0.0/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cjin/SPEO/SPEO_GPU_master/src/master.cc > CMakeFiles/Scalable_EA.dir/master.cc.i

src/CMakeFiles/Scalable_EA.dir/master.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Scalable_EA.dir/master.cc.s"
	cd /home/cjin/SPEO/SPEO_GPU_master/src && /apps/skylake/software/compiler/gcc/7.3.0/openmpi/3.0.0/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cjin/SPEO/SPEO_GPU_master/src/master.cc -o CMakeFiles/Scalable_EA.dir/master.cc.s

src/CMakeFiles/Scalable_EA.dir/master.cc.o.requires:

.PHONY : src/CMakeFiles/Scalable_EA.dir/master.cc.o.requires

src/CMakeFiles/Scalable_EA.dir/master.cc.o.provides: src/CMakeFiles/Scalable_EA.dir/master.cc.o.requires
	$(MAKE) -f src/CMakeFiles/Scalable_EA.dir/build.make src/CMakeFiles/Scalable_EA.dir/master.cc.o.provides.build
.PHONY : src/CMakeFiles/Scalable_EA.dir/master.cc.o.provides

src/CMakeFiles/Scalable_EA.dir/master.cc.o.provides.build: src/CMakeFiles/Scalable_EA.dir/master.cc.o


src/CMakeFiles/Scalable_EA.dir/migrate.cc.o: src/CMakeFiles/Scalable_EA.dir/flags.make
src/CMakeFiles/Scalable_EA.dir/migrate.cc.o: src/migrate.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cjin/SPEO/SPEO_GPU_master/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/CMakeFiles/Scalable_EA.dir/migrate.cc.o"
	cd /home/cjin/SPEO/SPEO_GPU_master/src && /apps/skylake/software/compiler/gcc/7.3.0/openmpi/3.0.0/bin/mpicxx  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Scalable_EA.dir/migrate.cc.o -c /home/cjin/SPEO/SPEO_GPU_master/src/migrate.cc

src/CMakeFiles/Scalable_EA.dir/migrate.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Scalable_EA.dir/migrate.cc.i"
	cd /home/cjin/SPEO/SPEO_GPU_master/src && /apps/skylake/software/compiler/gcc/7.3.0/openmpi/3.0.0/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cjin/SPEO/SPEO_GPU_master/src/migrate.cc > CMakeFiles/Scalable_EA.dir/migrate.cc.i

src/CMakeFiles/Scalable_EA.dir/migrate.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Scalable_EA.dir/migrate.cc.s"
	cd /home/cjin/SPEO/SPEO_GPU_master/src && /apps/skylake/software/compiler/gcc/7.3.0/openmpi/3.0.0/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cjin/SPEO/SPEO_GPU_master/src/migrate.cc -o CMakeFiles/Scalable_EA.dir/migrate.cc.s

src/CMakeFiles/Scalable_EA.dir/migrate.cc.o.requires:

.PHONY : src/CMakeFiles/Scalable_EA.dir/migrate.cc.o.requires

src/CMakeFiles/Scalable_EA.dir/migrate.cc.o.provides: src/CMakeFiles/Scalable_EA.dir/migrate.cc.o.requires
	$(MAKE) -f src/CMakeFiles/Scalable_EA.dir/build.make src/CMakeFiles/Scalable_EA.dir/migrate.cc.o.provides.build
.PHONY : src/CMakeFiles/Scalable_EA.dir/migrate.cc.o.provides

src/CMakeFiles/Scalable_EA.dir/migrate.cc.o.provides.build: src/CMakeFiles/Scalable_EA.dir/migrate.cc.o


src/CMakeFiles/Scalable_EA.dir/random.cc.o: src/CMakeFiles/Scalable_EA.dir/flags.make
src/CMakeFiles/Scalable_EA.dir/random.cc.o: src/random.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cjin/SPEO/SPEO_GPU_master/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object src/CMakeFiles/Scalable_EA.dir/random.cc.o"
	cd /home/cjin/SPEO/SPEO_GPU_master/src && /apps/skylake/software/compiler/gcc/7.3.0/openmpi/3.0.0/bin/mpicxx  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Scalable_EA.dir/random.cc.o -c /home/cjin/SPEO/SPEO_GPU_master/src/random.cc

src/CMakeFiles/Scalable_EA.dir/random.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Scalable_EA.dir/random.cc.i"
	cd /home/cjin/SPEO/SPEO_GPU_master/src && /apps/skylake/software/compiler/gcc/7.3.0/openmpi/3.0.0/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cjin/SPEO/SPEO_GPU_master/src/random.cc > CMakeFiles/Scalable_EA.dir/random.cc.i

src/CMakeFiles/Scalable_EA.dir/random.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Scalable_EA.dir/random.cc.s"
	cd /home/cjin/SPEO/SPEO_GPU_master/src && /apps/skylake/software/compiler/gcc/7.3.0/openmpi/3.0.0/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cjin/SPEO/SPEO_GPU_master/src/random.cc -o CMakeFiles/Scalable_EA.dir/random.cc.s

src/CMakeFiles/Scalable_EA.dir/random.cc.o.requires:

.PHONY : src/CMakeFiles/Scalable_EA.dir/random.cc.o.requires

src/CMakeFiles/Scalable_EA.dir/random.cc.o.provides: src/CMakeFiles/Scalable_EA.dir/random.cc.o.requires
	$(MAKE) -f src/CMakeFiles/Scalable_EA.dir/build.make src/CMakeFiles/Scalable_EA.dir/random.cc.o.provides.build
.PHONY : src/CMakeFiles/Scalable_EA.dir/random.cc.o.provides

src/CMakeFiles/Scalable_EA.dir/random.cc.o.provides.build: src/CMakeFiles/Scalable_EA.dir/random.cc.o


# Object files for target Scalable_EA
Scalable_EA_OBJECTS = \
"CMakeFiles/Scalable_EA.dir/buffer_manage.cc.o" \
"CMakeFiles/Scalable_EA.dir/island_EA.cc.o" \
"CMakeFiles/Scalable_EA.dir/main.cc.o" \
"CMakeFiles/Scalable_EA.dir/master.cc.o" \
"CMakeFiles/Scalable_EA.dir/migrate.cc.o" \
"CMakeFiles/Scalable_EA.dir/random.cc.o"

# External object files for target Scalable_EA
Scalable_EA_EXTERNAL_OBJECTS =

bin/Scalable_EA: src/CMakeFiles/Scalable_EA.dir/buffer_manage.cc.o
bin/Scalable_EA: src/CMakeFiles/Scalable_EA.dir/island_EA.cc.o
bin/Scalable_EA: src/CMakeFiles/Scalable_EA.dir/main.cc.o
bin/Scalable_EA: src/CMakeFiles/Scalable_EA.dir/master.cc.o
bin/Scalable_EA: src/CMakeFiles/Scalable_EA.dir/migrate.cc.o
bin/Scalable_EA: src/CMakeFiles/Scalable_EA.dir/random.cc.o
bin/Scalable_EA: src/CMakeFiles/Scalable_EA.dir/build.make
bin/Scalable_EA: src/CMakeFiles/Scalable_EA.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cjin/SPEO/SPEO_GPU_master/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX executable ../bin/Scalable_EA"
	cd /home/cjin/SPEO/SPEO_GPU_master/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Scalable_EA.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/Scalable_EA.dir/build: bin/Scalable_EA

.PHONY : src/CMakeFiles/Scalable_EA.dir/build

src/CMakeFiles/Scalable_EA.dir/requires: src/CMakeFiles/Scalable_EA.dir/buffer_manage.cc.o.requires
src/CMakeFiles/Scalable_EA.dir/requires: src/CMakeFiles/Scalable_EA.dir/island_EA.cc.o.requires
src/CMakeFiles/Scalable_EA.dir/requires: src/CMakeFiles/Scalable_EA.dir/main.cc.o.requires
src/CMakeFiles/Scalable_EA.dir/requires: src/CMakeFiles/Scalable_EA.dir/master.cc.o.requires
src/CMakeFiles/Scalable_EA.dir/requires: src/CMakeFiles/Scalable_EA.dir/migrate.cc.o.requires
src/CMakeFiles/Scalable_EA.dir/requires: src/CMakeFiles/Scalable_EA.dir/random.cc.o.requires

.PHONY : src/CMakeFiles/Scalable_EA.dir/requires

src/CMakeFiles/Scalable_EA.dir/clean:
	cd /home/cjin/SPEO/SPEO_GPU_master/src && $(CMAKE_COMMAND) -P CMakeFiles/Scalable_EA.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/Scalable_EA.dir/clean

src/CMakeFiles/Scalable_EA.dir/depend:
	cd /home/cjin/SPEO/SPEO_GPU_master && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cjin/SPEO/SPEO_GPU_master /home/cjin/SPEO/SPEO_GPU_master/src /home/cjin/SPEO/SPEO_GPU_master /home/cjin/SPEO/SPEO_GPU_master/src /home/cjin/SPEO/SPEO_GPU_master/src/CMakeFiles/Scalable_EA.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/Scalable_EA.dir/depend
