# Stargate Controller
**This program can control a stargate from SGCraft with a computer**
___
## How To install:
1. move all the files and subdirectorys in this directory (except the readme) to the root computer
2. Connect Peripherals in `internal/conf.lua` and adjust the IDs in `internal/conf.lua`
3. Put Your addresses into `internal/addresses.lua`, they will be used by other programs
3. Restart the Computer or run `startup.lua`
___
## How To Use
- You should see some info on the connected monitor and the Computer
- You should see a list of available Commands, they should be pretty self explanatory
- Commands can be added simply by creating a file in the computer's root
### Commands:
- addr
    - Will Allow to Dial the Stargate to an address from the address book
- close
    - closes the Stargate
- dial
    - allows dialing to a given address
- info
    - prints some information
- iris
    - controls the Stargate's iris if it is installed
- prntaddr
    - prints the address book to paper using the connected printer