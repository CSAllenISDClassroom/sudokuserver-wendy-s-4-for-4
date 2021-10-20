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
    app.get("nohello") { req -> String in
        return "498837"
    }
    app.post("game","create",":diffuculty") { req -> String in
        let diff = req.parameters.get("diffuculty", as: String.self)!
        let tomp = Emptyier().callall(dof:diff)
        gameTracker.append(tomp)
        gameNumber += 1
        return("\(gameNumber)")
        
    }
    app.get("game","call",":gameNumber") { req -> String in
        let gameNumber = req.parameters.get("gameNumber", as: Int.self)!
        var x = [[Int?]]()
        x = gameTracker[gameNumber]
        
        return ("\(x)")
    }
    app.get("game","cellCall",":gameNumber",":row",":cell") { req -> String in
        let gameNumber = req.parameters.get("gameNumber", as: Int.self)!
        let rowNumber = req.parameters.get("row", as: Int.self)!
        let cellNumber = req.parameters.get("cell", as: Int.self)!
        var x = [[Int?]]()
        var y = [Int?]()
        x = gameTracker[gameNumber]
        y = x[rowNumber]
        let z = y[cellNumber]
        return ("\(z)")
    }
    app.put("game","cell",":gameHub",":row",":cell",":changed") { req -> String in
        let gameHub = req.parameters.get("gameHub", as: Int.self)!
        let rowNumber = req.parameters.get("row", as: Int.self)!
        let cellNumber = req.parameters.get("cell", as: Int.self)!
        let changeNumber = req.parameters.get("changed", as: Int.self)!

        var x = [[Int?]]()
         x = gameTracker[gameHub]
        var y = x[rowNumber]
        y[cellNumber] = changeNumber
        x[rowNumber] = y
        gameTracker[gameHub] = x
        
 
        return("hi")       
    }
 
}
