// useful video https://www.youtube.com/watch?v=Bml5-9RR4Hk
import Vapor
var gameTracker = [[[Int?]]]()
var gameNumber = -1

func gameReturn() -> [[Int?]]{
    var x = [[Int?]]()
    x = gameTracker[0]
    return x
}
func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "hello"
    }

    app.post("game","create",":diffuculty") { req -> String in
        guard let diff = req.parameters.get("diffuculty", as: String.self) else{
            return("please enter apporiate variable")
        }

        let check  = ["easy","medium","hard","insane"]
        if check.contains(diff){
            print("work")
        }else{
            return("400 Bad Request (difficulty specified doesn't match requirements)")
        }
        let tomp = Emptyier().callall(dof:diff)
        gameTracker.append(tomp)
        gameNumber += 1
        return("\(gameNumber)")
        
    }


    //gets the sudoku board
    app.get("game","call",":gamenumb") { req -> String in
        let gameumb = req.parameters.get("gamenumb", as: Int.self)!
        if gameumb >= gameTracker.count{
            return("400 Bad Request (filter specified doesn't match requirements)")
        }
        var x = [[Int?]]()
        x = gameTracker[gameNumber]
        
        return ("\(x)")
    }


    //gets the sudoku board
    app.get("game","cellcall",":gamenumb",":row",":cell") { req -> String in
        guard let gameumb = req.parameters.get("gamenumb", as: Int.self)
        else{
            return("please enter an apporiate value")
        }
        guard let rowNumber = req.parameters.get("row", as: Int.self)
        else{
            return("please enter an apporiate value")
        }
        guard let cellNumber = req.parameters.get("cell", as: Int.self)
        else{
            return("please enter an apporiate value")
        }
        if gameumb >= gameTracker.count{
            return("400 Bad Request (RowIndex is out of range 0 ... 8)")
        }
        if rowNumber < 0 || rowNumber > 9{
            return("400 Bad Request (cellIndex is out of range 0 ... 8)")
        }
        if cellNumber < 0 || cellNumber > 9{
            return("400 Bad Request (cellIndex is out of range 0 ... 8)")
        }
        

        var x = [[Int?]]()
        var y = [Int?]()
        x = gameTracker[gameNumber]
        y = x[rowNumber]
        let z = y[cellNumber]
        return ("\(z)")
    }

    
    app.put("game","ccell",":gamenhub",":row",":cell",":changed") { req -> String in
        guard let gamehub = req.parameters.get("gamenhub", as: Int.self)
        else{
            return("choose a number")
        }
        guard let rowNumb = req.parameters.get("row", as: Int.self)
        else{
            return("choose a number")
        }
        guard let cellNumb = req.parameters.get("cell", as: Int.self)
        else{
            return("choose a number")
        }
        guard let changenumb = req.parameters.get("changed", as: Int.self)
        else{
            return("choose a number")
        }
           //gives out the respective warnings when a error is made                                                        
        if gamehub >= gameTracker.count{
            return("enter the id that has been created or make more games")
        }
        if rowNumb < 0 || rowNumb > 9{
            return("400 Bad Request (RowIndex is out of range 0 ... 8)")
        }
        if cellNumb < 0 || cellNumb > 9{
            return("400 Bad Request (cellIndex is out of range 0 ... 8)")
        }
        if changenumb <= 0 || changenumb > 9{
            return("400 Bad Request (value is out of range 1 ... 9 or null)")
        }
        

        var x = [[Int?]]()
         x = gameTracker[gamehub]
        var y = x[rowNumb]
        y[cellNumb] = changenumb
        x[rowNumb] = y
        gameTracker[gamehub] = x
        
 
        return("hi")       
    }
 
}
