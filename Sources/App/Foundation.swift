/*import Vapor
//var x = [:]
var sudokuBoardsMap = [Int:[[Int]]]()
var countBoards = 0
func scrambler (rotat:[Int],track:Int) ->[Int]{
    var count = 1 //keeps track of the numbers
    var fir = [Int]() //stores first part of sudoku board
    var sec = [Int]() //stores second part of sudoku board
    var f = [Int]() //stores the final and is returned to become the next row
    for i in rotat{ //loops through previous array to shift them to left
        if count <= track { //uses track to see how many to take off the front
            fir.append(i) //add to a first array
            count += 1
        }
        else{
            sec.append(i) //add to a seconf array
            count += 1
        }
    }
    f = sec + fir //combines the arrays together
    return f
}//call the function for every row could have been done more effiecently but couldnt think



//also couldnt think of a better method to print them all in less lines

func generateBoard()->[[Int]]{
    var x = [1,2,3,4,5,6,7,8,9]
    x.shuffle()
    //shuffles to create a first line this is easier than using logic to try to generate a new line
    print(x)
    //prints the first line
    //var counter = 1
    ///stores all the lines for the sudoku board

    var row2 = [Int]()
    var row3 = [Int]()
    var row4 = [Int]()
    var row5 = [Int]()
    var row6 = [Int]()
    var row7 = [Int]()
    var row8 = [Int]()
    var row9 = [Int]()
    row2 = (scrambler(rotat:x,track:3))
    row3 = (scrambler(rotat:row2,track:3))
    row4 = (scrambler(rotat:row3,track:1))
    row5 = (scrambler(rotat:row4,track:3))
    row6 = (scrambler(rotat:row5,track:3))
    row7 = (scrambler(rotat:row6,track:1))
    row8 = (scrambler(rotat:row7,track:3))
    row9 = (scrambler(rotat:row8,track:3))
    var board = Array(repeating: Array(repeating:0, count: 9), count: 9)
for c in 0..<9{

        board[0][c] = x[c]
        board[1][c] = row2[c]
        board[2][c] = row3[c]
        board[3][c] = row4[c]
        board[4][c] = row5[c]
        board[5][c] = row6[c]
        board[6][c] = row7[c]
        board[7][c] = row8[c]
        board[8][c] = row9[c]

    }

    //board[1] = x
    print(row2)
    print(row3)
    print(row4)
    print(row5)
    print(row6)
    print(row7)
    print(row8)
    print(row9)
    return board
}
func routes(_ app: Application) throws {
    app.get("Veom"){ req -> String in
        return "It works!"
    }

    app.get("games",":id") { req -> [[Int]] in
        let empty = [[0,0,0],
                     [0,0,0]]
        
        
        
            
        let countBoardIdstr = req.parameters.get("id")!
        let countBoardId = Int(countBoardIdstr)
        if let sudokuBoard = sudokuBoardsMap[countBoardId!] {
            
            return sudokuBoard
        }
        
        return empty
    }
    app.post("games") { req -> Int in
       
        print("inside post")
        countBoards+=1
        print(countBoards)
        var newSudokuBoard = generateBoard()
        print(newSudokuBoard)
        sudokuBoardsMap[countBoards] = newSudokuBoard
 return countBoards
    }
}
 */

// Hardcoded, minimizes need for dynamic code later
