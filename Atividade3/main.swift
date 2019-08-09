//
//  main.swift
//  Atividade3
//
//  Created by Brenno Tondato de Faria on 05/08/19.
//  Copyright © 2019 Brenno Tondato de Faria. All rights reserved.
//

import Foundation

func menu() {
    print("==================================")
    print("1 - Depth First Search")
    print("2 - Breadth First Search")
    print("3 - Hill Climb Search")
    print("4 - A* Search")
    print("==================================")
}

menu()

let option = readLine()

let board = [1, 3, 2,
             0, 4, 5,
             6, 7, 8]

let node = Node<Int>(initialBoard: board)
let search = Searches()

switch option{
case "1":
    let dfSolution = search.DFSearch(root: node)
    
    if (dfSolution.count > 0){
        for i in dfSolution{
            i.printBoard()
        }
    }else{
        print("No Solution Found :{")
    }

case "2":
    let bfsSolution = search.BFSearch(root: node)
    
    if (bfsSolution.count > 0){
        for i in bfsSolution{
            i.printBoard()
        }
    }else{
        print("No Solution Found :{")
    }
    
case "3":
    let hillSolution = search.HillClimbSearch(root: node)
    
    if (hillSolution.count > 0){
        for i in hillSolution{
            i.printBoard()
        }
    }else{
        print("No Solution Found :{")
    }
    
case "4":
    let astarSolution = search.AStarSearch(root: node)
    
    if (astarSolution.count > 0){
        for i in astarSolution{
            i.printBoard()
        }
    }else{
        print("No Solution Found :{")
    }
default:
    print("Você não entrou com uma opção valida")
    menu()
    
}

