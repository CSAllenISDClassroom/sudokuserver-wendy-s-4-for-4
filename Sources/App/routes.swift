// useful video https://www.youtube.com/watch?v=Bml5-9RR4Hk
import Vapor
var gametracker = [[[Int?]]]()
var gamenum = -1

func gamereturn() -> [[Int?]]{
    var x = [[Int?]]()
    x = gametracker[0]
    return x
}
func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "hello"
    }
    app.get("nohello") { req -> String in
        return "498837"
    }
    app.post("game","create",":diffuculty") { req -> String in
        guard let diff = req.parameters.get("diffuculty", as: String.self) else{
            return("please enter apporiate variable")
        }

        let check  = ["easy","medium","hard","insane"]
        if check.contains(diff){
            print("work")
        }else{
            return("please enter a valid diffuculty")
        }
        let tomp = Emptyier().callall(dof:diff)
        gametracker.append(tomp)
        gamenum += 1
        return("\(gamenum)")
        
    }
    //gets the sudoku board
    app.get("game","call",":gamenumb") { req -> String in
        let gameumb = req.parameters.get("gamenumb", as: Int.self)!
        if gameumb >= gametracker.count{
            return("enter the id that has been created or make more games")
        }
        var x = [[Int?]]()
        x = gametracker[gameumb]
        
        return ("\(x)")
    }
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
            return("enter the id that has been created or make more games")
        }
        if rownumb < 0 || rownumb > 9{
            return("choose a row number between 0-8")
        }
        if cellnumb < 0 || cellnumb > 9{
            return("choose a cell number between 0-8")
        }
        
        var x = [[Int?]]()
        var y = [Int?]()
        x = gametracker[gameumb]
        y = x[rownumb]
        let z = y[cellnumb]
        return ("\(z)")
    }
    
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
            return("choose a row number between 0-8")
        }
        if cellnumb < 0 || cellnumb > 9{
            return("choose a cell number between 0-8")
        }
        if changenumb <= 0 || changenumb > 9{
            return("the number you want to change must be between 1-9")
        }
        
        var x = [[Int?]]()
         x = gametracker[gamehub]
        var y = x[rownumb]
        y[cellnumb] = changenumb
        x[rownumb] = y
        gametracker[gamehub] = x
        
 
        return("hi")       
    }
 
}
