
public class Scram {
    var x = [Int]()
    func create() {
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

<<<<<<< HEAD

    func scrambler (rotate:[Int],track:Int) ->[Int]{
=======
//makes sure to scramle the entire sudoku board
    func scrambler (rotat:[Int],track:Int) ->[Int]{
>>>>>>> 1525620de47081a95ca4833413e191a82a1d6b7e

        var count = 1 //keeps track of the numbers
        var first = [Int]() //stores first part of sudoku board
        var second = [Int]() //stores second part of sudoku board
        var f = [Int]() //stores the final and is returned to become the next row
        for i in rotate{ //loops through previous array to shift them to left
            if count <= track { //uses track to see how many to take off the front
                first.append(i) //add to a first array
                count += 1
            }
            else{
                second.append(i) //add to a second array
                count += 1
            }
        }
        f = second + first //combines the arrays together

        return f
    }
    func combiner() ->[[Int]] {
        create()
        row1 = scrambler(rotate:x,track:3)
        row2 = scrambler(rotate:row1,track:3)
        row3 = scrambler(rotate:row2,track:3)
        row4 = scrambler(rotate:row3,track:3)
        row5 = scrambler(rotate:row4,track:3)
        row6 = scrambler(rotate:row5,track:3)
        row7 = scrambler(rotate:row6,track:3)
        row8 = scrambler(rotate:row7,track:3)
        row9 = scrambler(rotate:row8,track:3)
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

