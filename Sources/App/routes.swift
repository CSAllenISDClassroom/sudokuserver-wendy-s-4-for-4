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
    app.post("newgame") { req -> String in
        let tomp = Emptyier().callall(dof: "easy")
        gametraker.append(tomp)
        gamenum += 1
        return("\(gamenum)")
        
    }
    app.get("callgam","gamenumb") { req -> String in
        let gameumb = Int(req.parameters.get("gamenumb")!)!
        var x = [[Int?]]()
        x = gametraker[gameumb]
        return ("\(x)")
    }
}
