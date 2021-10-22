public class Emptyier {
    var fullBoard = Scram().combiner()         
    var doneBoard = [[Int]]()
    var cleaned = [[Int?]]()

    func eraser(diff:String){
        var countempt = 0
        //    var checker = 0
        var diffnumber = 0
        switch diff{
        case "easy":
            diffnumber = 2
        case "medium":
            diffnumber = 4
        case "hard":
            diffnumber = 6
        case "hell":
            diffnumber = 8
        default:
            print("not a choice please renter level diffuculty")
        }             
        
        for x in fullBoard{
            var newx = [Int]()
            newx = x
            
            repeat{
                let delete = Int.random(in: 0..<9)
                newx[delete] = 0
                countempt = 0

                for y in newx{
                    if y == 0{      
                        countempt += 1
                    }
                    else{
                    }
                }
            }while countempt < diffnumber
            //        print(newx)
            doneBoard.append(newx)                   
        }
    }
    
    func cleaner() {
        var counter = 0
        for x in doneBoard{
            var xx = [Int?]()
            xx = x
            counter = 0
            for y in x{        
                if y == 0{
                    xx[counter] = nil
                    counter += 1
                }
                else{
                    
                    counter += 1
                }
            }
            cleaned.append(xx)
            
            
        }
        func cleaner2() {
            
        }
    }
    
    func callall(dof:String) -> [[Int?]] {
        eraser(diff:dof)
        cleaner()
        return cleaned
    }
    
}
var finsihed = Emptyier().callall(dof:"easy")
