// useful video https://www.youtube.com/watch?v=Bml5-9RR4Hk
import Vapor
var gametraker = [[[Int?]]]()
var gamenum = -1

func gamereturn() -> [[Int?]]{
    var x = [[Int?]]()
    x = gametraker[0]
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
    app.post("newgame",":diffuculty") { req -> String in
        let diff = req.parameters.get("diffuculty", as: String.self)!
        let tomp = Emptyier().callall(dof:diff)
        gametraker.append(tomp)
        gamenum += 1
        return("\(gamenum)")
        
    }
    app.get("callgam",":gamenumb") { req -> String in
        let gameumb = req.parameters.get("gamenumb", as: Int.self)!
        var x = [[Int?]]()
        x = gametraker[gameumb]
        
        return ("\(x)")
    }
    app.get("cell",":gamenumb",":row",":cell") { req -> String in
        let gameumb = req.parameters.get("gamenumb", as: Int.self)!
        let rownumb = req.parameters.get("row", as: Int.self)!
        let cellnumb = req.parameters.get("cell", as: Int.self)!
        var x = [[Int?]]()
        var y = [Int?]()
        x = gametraker[gameumb]
        y = x[rownumb]
        let z = y[cellnumb]
        return ("\(z)")
    }
    app.put("xcell",":gamenhub",":row",":cell",":changed") { req -> String in
        let gamehub = req.parameters.get("gamenhub", as: Int.self)!
        let rownumb = req.parameters.get("row", as: Int.self)!
        let cellnumb = req.parameters.get("cell", as: Int.self)!
        let changenumb = req.parameters.get("changed", as: Int.self)!

        var x = [[Int?]]()
         x = gametraker[gamehub]
        var y = x[rownumb]
        y[cellnumb] = changenumb
        x[rownumb] = y
        gametraker[gamehub] = x
        
 
        return("hi")       
    }
 
}
