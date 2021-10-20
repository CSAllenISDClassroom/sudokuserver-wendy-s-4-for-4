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
<<<<<<< HEAD
    app.get("game","call",":gameNumber") { req -> String in
        let gameNumber = req.parameters.get("gameNumber", as: Int.self)!
=======

    //gets the sudoku board
    app.get("game","call",":gamenumb") { req -> String in
        let gameumb = req.parameters.get("gamenumb", as: Int.self)!
        if gameumb >= gametracker.count{
            return("400 Bad Request (filter specified doesn't match requirements)")
        }
>>>>>>> 1525620de47081a95ca4833413e191a82a1d6b7e
        var x = [[Int?]]()
        x = gameTracker[gameNumber]
        
        return ("\(x)")
    }
<<<<<<< HEAD
    app.get("game","cellCall",":gameNumber",":row",":cell") { req -> String in
        let gameNumber = req.parameters.get("gameNumber", as: Int.self)!
        let rowNumber = req.parameters.get("row", as: Int.self)!
        let cellNumber = req.parameters.get("cell", as: Int.self)!
=======

    //gets the sudoku board
    app.get("game","cellcall",":gamenumb",":row",":cell") { req -> String in
        guard let gameumb = req.parameters.get("gamenumb", as: Int.self)
        else{
            return("please enter an apporiate value")
        }
        guard let rownumb = req.parameters.get("row", as: Int.self)
        else{
            return("please enter an apporiate value")
        }
        guard let cellnumb = req.parameters.get("cell", as: Int.self)
        else{
            return("please enter an apporiate value")
        }
        if gameumb >= gametracker.count{
            return("400 Bad Request (RowIndex is out of range 0 ... 8)")
        }
        if rownumb < 0 || rownumb > 9{
            return("400 Bad Request (cellIndex is out of range 0 ... 8)")
        }
        if cellnumb < 0 || cellnumb > 9{
            return("400 Bad Request (cellIndex is out of range 0 ... 8)")
        }
        
>>>>>>> 1525620de47081a95ca4833413e191a82a1d6b7e
        var x = [[Int?]]()
        var y = [Int?]()
        x = gameTracker[gameNumber]
        y = x[rowNumber]
        let z = y[cellNumber]
        return ("\(z)")
    }
<<<<<<< HEAD
    app.put("game","cell",":gameHub",":row",":cell",":changed") { req -> String in
        let gameHub = req.parameters.get("gameHub", as: Int.self)!
        let rowNumber = req.parameters.get("row", as: Int.self)!
        let cellNumber = req.parameters.get("cell", as: Int.self)!
        let changeNumber = req.parameters.get("changed", as: Int.self)!

=======
    
    app.put("game","ccell",":gamenhub",":row",":cell",":changed") { req -> String in
        guard let gamehub = req.parameters.get("gamenhub", as: Int.self)
        else{
            return("choose a number")
        }
        guard let rownumb = req.parameters.get("row", as: Int.self)
        else{
            return("choose a number")
        }
        guard let cellnumb = req.parameters.get("cell", as: Int.self)
        else{
            return("choose a number")
        }
        guard let changenumb = req.parameters.get("changed", as: Int.self)
        else{
            return("choose a number")
        }
           //gives out the respective warnings when a error is made                                                        
        if gamehub >= gametracker.count{
            return("enter the id that has been created or make more games")
        }
        if rownumb < 0 || rownumb > 9{
            return("400 Bad Request (RowIndex is out of range 0 ... 8)")
        }
        if cellnumb < 0 || cellnumb > 9{
            return("400 Bad Request (cellIndex is out of range 0 ... 8)")
        }
        if changenumb <= 0 || changenumb > 9{
            return("400 Bad Request (value is out of range 1 ... 9 or null)")
        }
        
>>>>>>> 1525620de47081a95ca4833413e191a82a1d6b7e
        var x = [[Int?]]()
         x = gameTracker[gameHub]
        var y = x[rowNumber]
        y[cellNumber] = changeNumber
        x[rowNumber] = y
        gameTracker[gameHub] = x
        
 
        return("hi")       
    }
 
}
