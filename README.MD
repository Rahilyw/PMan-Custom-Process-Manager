# PMan — Custom Process Manager
 
> A user-level process manager implemented in C with real-time `/proc` filesystem inspection.
 
![Language](https://img.shields.io/badge/Language-C-blue)
![Platform](https://img.shields.io/badge/Platform-Linux-green)
![Course](https://img.shields.io/badge/CSC%20360-Operating%20Systems-purple)
 
---
 
## Overview
 
PMan is a shell-like process manager that demonstrates core operating systems concepts in C. It creates and manages Linux background processes, delivers POSIX signal control (terminate, stop, resume), and reads live process statistics directly from the `/proc` filesystem — with no external dependencies.
 
**Key technical areas covered:**
- Process creation with `fork()` / `execvp()`
- POSIX signal delivery (`SIGTERM`, `SIGSTOP`, `SIGCONT`)
- Real-time process inspection via `/proc/<pid>/stat`
- Linked-list job tracking and interactive command parsing
---
 
## Getting Started
 
### 1. Compile test programs
 
```bash
gcc tests/inf.c -o tests/inf
gcc tests/args.c -o tests/args
```
 
### 2. Build PMan
 
```bash
make
```
 
### 3. Run PMan
 
```bash
./PMan
```
 
---
 
## Command Reference
 
| Command | Description |
|---|---|
| `bg <cmd>` | Start a program in the background |
| `bglist` | List all active background processes with their PIDs |
| `bgkill <pid>` | Send `SIGTERM` to terminate a process |
| `bgstop <pid>` | Send `SIGSTOP` to suspend a process |
| `bgstart <pid>` | Send `SIGCONT` to resume a stopped process |
| `pstat <pid>` | Print `comm`, `state`, `utime`, `stime`, `rss`, `voluntary_ctxt_switches`, and `nonvoluntary_ctxt_switches` from `/proc/<pid>/stat` |
 
---
 
## Usage Examples
 
**Start a background process**
```
> bg ./tests/inf a 1
Started background process with PID 12345
```
 
**List all background processes**
```
> bglist
PID: 12345, Command: ./tests/inf
Total background jobs: 1
```
 
**Inspect process statistics**
```
> pstat 12345
comm: ./tests/inf
state: S
utime: 150
stime: 30
rss: 2048
voluntary_ctxt_switches: 10
nonvoluntary_ctxt_switches: 2
```
 
**Stop and resume a process**
```
> bgstop 12345
Sent SIGSTOP (19) to process 12345
 
> bgstart 12345
Sent SIGCONT (18) to process 12345
```
 
**Kill a process**
```
> bgkill 12345
Sent SIGTERM (15) to process 12345
Process 12345 terminated
```
 
---
 
## Notes
 
- When running `inf` via `bg`, use the relative path to the compiled binary: `bg ./tests/inf a 1`
- `inf.c` requires two arguments (`a` and `1`) omitting them will cause it to exit immediately
- PMan tracks only processes it has spawned; externally started PIDs are not managed
---
 
## Project Info
 
| | |
|---|---|
| **Author** | Rahil Wijeyesekera |

🎓 Project Context:
This project was developed as part of the CSC 360: Operating Systems course at the University of Victoria. It serves as a practical exploration of POSIX thread synchronization and concurrent system design.

## ⚠️ Academic Integrity Notice

This repository is maintained for portfolio and educational purposes only. 
If you are currently enrolled in CSc 360 at the University of Victoria or a 
similar OS course, please note that using this code in your own 
assignments may constitute a violation of Academic Integrity policies.
