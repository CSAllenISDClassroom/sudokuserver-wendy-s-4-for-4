# Sudoku
Sudoku Board
This is a fully functional sudoku board generating api
sudoku-wendy-s-four-for-four
TEAM MEMBERS: Miguel Marquez, Kian Durrett, Vyom Nemade, Rohan Kalyanpura, Logan O'roark.

# Create a new game and chossing a diffuculty:
use post to create a new game

ex:

/game/create/(diffuculty)

/game/create/easy

/game/create/medium

/game/create/hard

/game/create/insane

This uses a post to call a function which will call another function to generate a board and then it will be passed on to the next function which will then delete random part of the rows for the whole arrays and then storing it in a variable.

# Calling a game 

use get to call a already created game


ex:

game/call/(id that was specified when game was created)

/game/call/0

/game/call/1

and so on you must post before you call

This will call a game from the storage if it was previoulsy created otherwise it will not work. First you must use the post function to create a new game then you will then use this call function to call a the game from the storage prpoerly,
The id is provided when you create the game

# get get a cell

use get to call a cell from a already created game

ex:

game/call/(gameid)/(rownumb)/(cellnumb)

/game/call/0/5/8

/game/call/0/0/0

This the same as calling a game except at the end you need to specify a row and cell number for the specified cell number you want to view. the row and cell number can not exceed 0-8 either way this will create an overflow error because that number does not exist as in a sudoku board since the rows 0-8 and cells 0-8

# change a cell game

use put to change a cell from a already created game

ex:

game/change/(gameid)/(rownumb)/(cellnumb)/(number you want to replace with)

/game/call/0/5/8/2

/game/call/0/5/8/4

/game/call/0/5/8/9

This the same as calling a game except at the end you need to specify a row and cell number for the specified cell number you want to view.And then you want to add on the number that you want to  replace in the sudoku board this number can be any number you want it to be but it must be Integer otherwise it will crash. This issue is still being worked on at the current moment. The row and cell number can not exceed 0-8 either way this will create an overflow error because that number does not exist as in a sudoku board since the rows 0-8 and cells 0-8

# Are you stressed calm down by looking at these beautiful images

![alt text](https://github.com/Rohan-Kalyanpura/Sudoku/blob/main/catstraight.jfif?raw=true)

![Alt text](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6PiIrozUhLrRh-Kx6meOhkNtgCTzxCIhxVsHF0-3_6rx660R7ILfPOCDqggCLz2S3TP0&usqp=CAU:* "Cat")

![Alt text](https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=640:* "Dog")

