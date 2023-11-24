##
## Copyright (c) 2023 by Sebastian Pipping
## Apache License 2.0
##

Output ./actual.mp4
Output ./actual.txt

Require bash
Require seq
Require ttyplot

Set Width 1024
Set Height 400
Set Padding 0
Set FontFamily "Liberation Mono"
Set FontSize 11

Set TypingSpeed 150ms

Set Shell bash

# Expecting dimension info, version display, help display
Type "echo ${COLUMNS}x${LINES}"
Enter
Type "ttyplot -v"
Enter
Type "ttyplot -h"
Enter
Sleep 0.5s
Screenshot ./actual-0.png
Sleep 0.2s

# Expecting "Waiting for input..."
Type "{ sleep 1.5; seq 10; sleep 1; } | ttyplot -2 -c X"
Enter
Sleep 0.75s
Screenshot ./actual-1.png
Sleep 0.2s

# Expecing fully drawn, no saying "stdin closed", yet
Sleep 1s
Screenshot ./actual-2.png
Sleep 0.2s

# Expecing fully drawn plus "stdin closed"
Sleep 1.25s
Screenshot ./actual-3.png
Sleep 0.2s

# Expecting to be back at the shell
Ctrl+C
Sleep 0.5s
Screenshot ./actual-4.png
Sleep 0.2s
