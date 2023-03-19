# Sakarin villapaitapelin kosto

**Movement keys:** hjkl

**Other controls:** qyn

### Known issues:
  - No visualisation of vertical movement above a couple rows from Sakari

## To run

  - get the release archive and extract
  - run linux executable *sakarinv* in a terminal
  - run windows executable *sakarinv.exe* in cmd.exe

## To compile

###  Step 1: 

install ghcup with installation script found at https://www.haskell.org/ghcup/

###  Step 2:
  
- in Linux:
  ```
  git clone https://github.com/ramla/sakarinv
  cd sakarinv
  cabal build
  cabal run
  ```

- in Windows: 
  * click the green code button and "Download ZIP"
  * unzip, run cmd.exe and navigate to sakarinv-master directory
  ```
  cabal build
  cabal run
  ```

Thanks
- Uni of Helsinki for hosting their Haskell MOOC which I did not yet finish
- Viljami
- Peeps at Functional Programming Discord for being super helpful <3
