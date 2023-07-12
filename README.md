# CS 450 Machine Problem 1

## Objectives

After completing this machine problem, you should be able to:

1. Accept and clone a GitHub-based machine problem repository
2. Build, boot, and work on xv6
3. Implement some user-level Unix utilities in xv6 using its provided system
   calls and libraries


## Overview

For this machine problem you will implement basic versions of three standard Unix utilities for the xv6 operating system. While you won't be making any changes to the kernel, you will be working with the kernel's system call interface and the small user library it provides.

To do this, you will need to set up a development environment consistent with the one we'll use to test your submissions. We'll provide instructions for doing this on Linux, Mac, and Windows.


## Starting the Docker container

We've set up a [Docker](https://www.docker.com) image that contains all the tools you'll need to build and test your xv6 implementations. If you don't already have Docker installed, you should download and run the installer for your platform (Windows, macOS, and Linux are supported) from the [Docker website](https://www.docker.com/).

On Windows, if Docker fails to start up correctly after installation, you may need to [install the Windows Subsystem for Linux (WSL)](https://learn.microsoft.com/en-us/windows/wsl/install) and [enable virtualization](https://docs.docker.com/desktop/troubleshoot/topics/#virtualization) to run Docker.

Once Docker is installed and running, you'll use it to start a container in the root directory of the repository you cloned earlier. In a terminal, `cd` into the repository root, and use the platform-appropriate command below:

- For Linux / macOS, you can run the following command:

      docker run -itv $(PWD):/mp -w /mp --name cs450xv6 --rm cs450/xv6 bash

  Alternatively, we include a Makefile target that runs the above command for you --- to use it, just do:

      make docker

- For Windows, run the following command:

      docker run -itv %cd%:/mp -w /mp --name cs450xv6 --rm cs450/xv6 bash

Either way, the first time you invoke Docker, it will download the image from [Docker Hub](https://hub.docker.com/r/cs450/xv6), which may take a few minutes. Once the image is downloaded, Docker will start an interactive shell in a container running the image. If successful, you will get a prompt like this:

    root@3e1c6cbe4f79:/mp#

The directory `/mp` within the container is a mirror of the root directory of the repository you cloned earlier. You can edit source code from within the container (we installed a bunch of useful tools for you), or you can edit them in an external IDE -- any changes you make will be synchronized between the host and the container.

To exit the container, you can run `exit` or press Ctrl-D. The `--rm` option in the command above will cause Docker to remove the container when you exit it, so you don't need to worry about cleaning up.


## Building and booting xv6

From within the container (inside the `/mp` directory), you can build xv6 by just running the command `make`. This will take a little while, and should end with output that looks like:

    ./mkfs fs.img README _cat _echo _forktest _grep _init _kill ...
    nmeta 59 (boot, super, log blocks 30 inode blocks 26, ...
    balloc: first 702 blocks have been allocated
    balloc: write bitmap block at sector 58

Now you can boot up xv6 in the QEMU emulator with the command `make qemu-nox`. This should end in the following output:

    Booting from Hard Disk...
    xv6...
    cpu1: starting 1
    cpu0: starting 0
    sb: size 1000 nblocks 941 ninodes 200 nlog 30 logstart 2 inodestart 32 bmap start 58
    init: starting sh
    $

You're now running xv6 in an emulator (within a container)! You can explore a bit, and when you're ready to exit the xv6 session use the key sequence "`^a x`" (i.e., hit the 'a' key while holding down the control key, then release both and hit the 'x' key) --- `^a` is a special prefix key used to send the emulator an interrupt sequence.


## Implementing UNIX utilities

For this lab, you will be implementing three Unix utilities: `tr`, `zip`, and `unzip`. Each utility will require that you add a new source file and a corresponding entry to the `UPROGS` definition in `Makefile`.

The utilities are specified next.


### `tr`

The `tr` ("translate") utility, per the manual page, "copies the standard input to the standard output with substitution or deletion of selected characters." It is convenient in situations where we'd like to convert between line ending characters, lower/uppercase text, delete extraneous characters, etc.

When invoking `tr`, we can provide it with two strings of equal length. The first string is the list of characters to replace, and the second is the list of characters to replace them with. 

Here's a typical interaction --- notice that because `tr` uses standard input and the command line buffers input by line, after invoking the utility it translates input on a line-by-line basis. (The line starting with '`$`' is the command prompt and entered command; this is followed by alternating lines of input and output text.)

    $ tr abc 123
    abracadabra
    12r131d12r1
    A man a plan a canal
    A m1n 1 pl1n 1 31n1l

To end input we use the `^D` (Ctrl-D) keypress, which sends an end-of-file (EOF)
character to `tr`. 

Here's another interaction where we use the `-d` flag to indicate that we want
to delete the characters in the string from the input.

    $ tr -d abc
    abracadabra
    rdr
    a man a plan a canal
     mn  pln  nl

When we want to use `tr` to process the contents of a file, we typically do so using a shell feature known as *I/O redirection*. Suppose we have a file named "test.txt" with the following data:


    apples,bananas,cats
    this-is-not-a-fruit

We can run `tr` on it as follows:

    $ tr ,- +! < test.txt
    apples+bananas+cats
    this!is!not!a!fruit

The '`<`' character indicates that the shell should take the contents of the named file ("test.txt") and use it as standard input to `tr`.

Below we use `tr` on the same file, with the `-d` option:

    $ tr -d ,- < test.txt
    applesbananascats
    thisisnotafruit


### `zip`

`zip` is a compression utility. The actual Unix `zip` utility supports a number of different compression algorithms, but we'll be using a very simple form of compression known as [run-length encoding](https://en.wikipedia.org/wiki/Run-length_encoding) (described below). `zip` will take a filename when invoked and output the compressed version of that file to standard output.

Because the output of `zip` is not intended to be human readable, we use I/O redirection again to send the compressed output to a file. Here's how we might use `zip` to compress the contents of the file "test.txt" into "test.zip".

    $ zip test.txt > test.zip

The '`>`', in this case, tells the shell to send the standard output of `zip` into the named file on the right.

The run-length compression algorithm works by simply scanning for identical adjacent bytes in the input file and printing just a single copy to the output preceded by a count. For instance, if the input is as follows:

    aaaaaaaaaabbbbbcccdde

Run-length encoding would nominally output:

    10a5b3c2d1e

Critically, however, since we need to be able to read and decode the compressed output (say, to obtain the original uncompressed version), the encoder will consistently print out each count as a 4-byte integer. This means that while the input to `zip` may be ASCII (and therefore human-readable), its output will not be. 

You may find it help to implement another utility to print out a "hex dump" (i.e., the byte-by-byte contents of a file in hexadecimal representation). In the sample interaction below, we assume the file "test.txt" contains the sample input above (`aaaaaaaaaabbbbbcccdde`), and that `hd` is a hex dump utility.

    $ hd test.txt
    61 61 61 61 61 61 61 61 61 61 62 62 62 62 62 63 63 63 64 64 65 A

    $ zip test.txt > test.zip

    $ hd test.zip
    A 0 0 0 61 5 0 0 0 62 3 0 0 0 63 2 0 0 0 64 1 0 0 0 65 1 0 0 0 A 

Note that the hexadecimal ASCII codes for `a`, `b`, `c`, ... are `61`, `62`, `63`, ...., and the ASCII code for the newline character is `A`. After `zip`-ping the file, we see that the run-length encoded version consists of 30 total bytes. Each 5-byte sequence consists of a 4-byte integer (encoded in little-endian) followed by a 1-byte ASCII code from the uncompressed file. 

Because of the 4-byte integer encoding, the maximum count value that can be written is 4,294,967,296. While this is theoretically a problem, you don't need to worry about it for the assignment (it can also be easily solved by separating over-long runs of identical bytes into separate run-length encodings).

### `unzip`

`unzip` is invoked with the filename of a file compressed by `zip`, and prints out the uncompressed version to standard output.

Given the output file "test.zip" from the previous example, here's `unzip` in action:

    $ unzip test.zip
    aaaaaaaaaabbbbbcccdde


## Edge cases

Your implementations of the `tr`, `zip`, and `unzip` utilities described above
will go into the source files "tr.c", "zip.c", and "unzip.c" 

The working specifications of the three utilities are presented in the previous
section, but there are some details / edge cases to consider:

1. When the commands are invoked without any arguments or the incorrect number
   of arguments, they should print usage information and exit.

2. If `tr` is given replacement and substitution strings of different lengths,
   it should print the error message "STRING1 and STRING2 must have the same
   length" and exit.

3. If the specified file doesn't exist (or can't be opened for another reason),
   both `zip` and `unzip` should print an error and exit.


### System calls and library functions

x86 provides a number of system calls and library functions that you can use for
your implementations. The header files containing the declarations for
functions (and related constants) that you'll need for your work include
"user.h", "types.h", and "fcntl.h"

In particular, you may find the following functions useful:

    // system calls
    int exit(void);
    int open(const char*, int);
    int read(int, void*, int);
    int write(int, const void*, int);
    int close(int);

    // library functions
    void printf(int, const char*, ...);
    char* gets(char*, int max);
    char* strchr(const char*, char c);
    int strcmp(const char*, const char*);

Note that there are no fancy buffered I/O library functions (e.g., `scanf`). You'll need to work with raw file descriptors and system calls to open and read files. You may find it helpful to check out the implementations of `cat` (in "cat.c") and the shell (in `sh.c`) for examples of how to do this.

One important detail: make sure to call `exit()` to terminate your program (instead of just returning from main) --- this is needed to ensure the process terminates cleanly.


## Testing and Evaluation

Remember that all your testing should be done within the container you set up in
the first part of this lab! If you don't do this, it's possible differences
between our environment and yours will make your code fail (this is especially
true of later assignments), and you won't get any credit for your work at all!

After adding your code to the "tr.c", "zip.c", and "unzip.c" files, you'll need to add the corresponding user programs to the Makefile. The Makefile is already set up to build the "cat", "echo", etc., programs, so you can use those as examples for how to add your own.

If you wish to add additional files to your xv6 image that don't require compilation (e.g., a text file containing a sample input for your `zip` utility), look for how the "README" file is added to the image to see how to do this.

Build the updated xv6 image by running `make`. Sometimes, you may need to run `make clean` before running `make` to ensure that the build process starts from a clean slate. If there are no errors, you can run the image in QEMU by typing `make qemu-nox`. 

### Score breakdown

Each of the three utilities is worth 10 points, for a total of 30 points. We're not providing a test suite for this assignment, as you won't be making any changes to the xv6 kernel. Instead, we'll be grading your work manually, according to the specifications above, while making sure that you haven't unnecessarily tinkered with any of the xv6 kernel code.

Have fun with this one --- it's a good chance to warm up your C programming skills and get a feel for the xv6 environment!


## Submission

To submit your work, simply add all the new source files you created and commit and push your work to your GitHub repository. You may wish to check your GitHub repository page to make sure you pushed everything successfully.
