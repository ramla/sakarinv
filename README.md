# sakarinv
Sakarin villapaitapelin kosto

Tested to work on Linux only

To run in Windows: 
  - install stack
  - click the green code button and choose "Download ZIP", unpack and navigate to sakarinv-master directory in cmd.exe

NOTE: to quit ghci, type :q and press enter
  - in cmd.exe run stack ghci, stack will install ghci for you
  - in cmd.exe run stack ghci --package random
  - in cmd.exe run stack ghci --package ansi-terminal

To run ghci, in cmd.exe run stack ghci
  In ghci:
  - run :set -package random
  - run :l sakarinv.hs

Known issues: on Windows you run into an error when accepting the challenge to make Sakari wear the jumper