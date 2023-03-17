# Sakarin villapaitapelin kosto

**Movement keys:** hjkl

Tested to work on Linux only

**Known issues:** 
  - On Windows you run into an error when accepting the challenge to make Sakari wear the jumper. With luck you can win if you type in your movement after *y* before pressing enter.
  - Visualisation of vertical movement is vague beyond a couple rows from Sakari

## To run in Linux

  - click the green code button and choose "Download ZIP", unpack and navigate to sakarinv-master in a terminal
  - be brave and run the executable *./sakarinv*

**Or**

  - install stack with the install script: *wget -qO- https://get.haskellstack.org/ | sh*

  - compile by running *stack ghc -- --make -main-is Sakarinv sakarinv.hs*
  
  **NOTE:** this may require following some of the steps below
      
  - execute by running *./sakarinv*
  
**Or**

  **NOTE:** to quit ghci, type *:q* and press enter
      
  - run *stack ghci*, stack will install ghci for you
  - run *stack ghci --package random*
  - run *stack ghci --package ansi-terminal*

To run ghci, in cmd.exe run *stack ghci*

  In ghci:
  
  - run *:set -package random*
  - run *:l sakarinv.hs*
  - run *main*

## To run in Windows: 

  - click the green code button and choose "Download ZIP", unpack and navigate to sakarinv-master directory in cmd.exe
  - run sakarinv.exe
  
**Or**

  - install stack: https://get.haskellstack.org/stable/windows-x86_64-installer.exe

**Or**

  - in cmd.exe run *stack ghci*, stack will install ghci for you
  - compile by running *stack ghc -- --make -main-is Sakarinv sakarinv.hs*
  
  **NOTE:** this may require following some of the steps below

**Or**

  **NOTE:** to quit ghci, type *:q* and press enter
  
  - in cmd.exe run *stack ghci --package random*
  - in cmd.exe run *stack ghci --package ansi-terminal*

To run ghci, in cmd.exe run *stack ghci*

  In ghci:
  
  - run *:set -package random*
  - run *:l sakarinv.hs*
  - run *main*
