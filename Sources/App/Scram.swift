
public class Scram {
    var x = [Int]()
    func crea() {
     x = [1,2,3,4,5,6,7,8,9]
    x.shuffle()
    }
    var box = [[Int]]()
    var row1 = [Int]()
    var row2 = [Int]()
    var row3 = [Int]()
    var row4 = [Int]()
    var row5 = [Int]()
    var row6 = [Int]()
    var row7 = [Int]()
    var row8 = [Int]()
    var row9 = [Int]()
    

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
    }      
    func combiner() ->[[Int]] {
        crea()
        row1 = scrambler(rotat:x,track:3)
        row2 = scrambler(rotat:row1,track:3)
        row3 = scrambler(rotat:row2,track:3)
        row4 = scrambler(rotat:row3,track:3)
        row5 = scrambler(rotat:row4,track:3)
        row6 = scrambler(rotat:row5,track:3)
        row7 = scrambler(rotat:row6,track:3)
        row8 = scrambler(rotat:row7,track:3)
        row9 = scrambler(rotat:row8,track:3)
        box.append(row1)
        box.append(row2)
        box.append(row3)
        box.append(row4)
        box.append(row5)
        box.append(row6)
        box.append(row7)
        box.append(row8)
        box.append(row9)

        return box
    }

    
}    
    
    //call the function for every row could have been done more effiecently but couldnt think
let finale = Scram().combiner()
//print(finale)

