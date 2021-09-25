// useful video https://www.youtube.com/watch?v=Bml5-9RR4Hk
import Vapor
var gametraker = [[[Any]]]()
var gamenum = -1

func gamereturn() -> [[Any]]{
    var x = [[Any]]()
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
        var x = [[Any]]()
        x = gametraker[gameumb]
        
        return ("\(x)")
    }
    app.get("cell",":gamenumb",":row",":cell") { req -> String in
        let gameumb = req.parameters.get("gamenumb", as: Int.self)!
        let rownumb = req.parameters.get("row", as: Int.self)!
        let cellnumb = req.parameters.get("cell", as: Int.self)!
        var x = [[Any]]()
        var y = [Any]()
        x = gametraker[gameumb]
        y = x[rownumb]
         
        return ("\(y[cellnumb])")
    }
}
