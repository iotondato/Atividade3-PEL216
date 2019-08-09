//
//  searches.swift
//  Atividade3
//
//  Created by Brenno Tondato de Faria on 07/08/19.
//  Copyright © 2019 Brenno Tondato de Faria. All rights reserved.
//

import Foundation

class Searches {
    
    func BFSearch(root: Node<Int>) -> Array<Node<Int>>{
        var solution: Array<Node<Int>> = []
        var nodesOpened: Array<Node<Int>> = []
        var nodesClosed: Array<Node<Int>> = []
        var iterations = 0
        
        
        nodesOpened.append(root)
        var solutionFlag = false
        
        print("It: \(iterations)")
        
        while (nodesOpened.count > 0 && !solutionFlag) {
            let currentNode = nodesOpened[0]
            nodesClosed.append(currentNode)
            nodesOpened.removeFirst()
            
            currentNode.expandNode()
            iterations += 1
            //currentNode.printBoard()
            
            for i in 0...currentNode.boardsList.count - 1 {
                let currentChild = currentNode.boardsList[i]
                
                if currentChild.isGoal() {
                    print("Goal Found. 🎉 🎉 🎉")
                    solutionFlag = true
                    solution = pathToSolotion(solutionNode: currentChild)
                }
                
                if (!checkExistence(nodesList: nodesOpened, node: currentChild) &&
                    !checkExistence(nodesList: nodesClosed, node: currentChild)) {
                    
                    nodesOpened.append(currentChild)
                }
            }
        }
        return solution
    }
    
    func DFSearch(root: Node<Int>) -> Array<Node<Int>> {
        var solution: Array<Node<Int>> = []
        var nodesOpened: Array<Node<Int>> = []
        var nodesClosed: Array<Node<Int>> = []
        var iterations = 0
        
        nodesOpened.append(root)
        var solutionFlag = false
        
        while (nodesOpened.count > 0 && !solutionFlag) {
            let currentNode = nodesOpened[0]
            nodesClosed.append(currentNode)
            nodesOpened.removeFirst()
            
            currentNode.expandNode()
            iterations += 1
            //currentNode.printBoard()
            
            print("It: \(iterations)")
            
            for i in 0...currentNode.boardsList.count - 1 {
                let currentChild = currentNode.boardsList[i]
                
                if currentChild.isGoal() {
                    print("Goal Found. 🎉 🎉 🎉")
                    
                    solutionFlag = true
                    
                    solution = pathToSolotion(solutionNode: currentChild)
                }
                
                if (!checkExistence(nodesList: nodesOpened, node: currentChild) &&
                    !checkExistence(nodesList: nodesClosed, node: currentChild)) {
                    
                    nodesOpened.insert(currentChild, at: 0)
                }
            }
        }
        return solution
    }
    
    func AStarSearch(root: Node<Int>) -> Array<Node<Int>> {
        var solution: Array<Node<Int>> = []
        var nodesOpened: Array<Node<Int>> = []
        var nodesClosed: Array<Node<Int>> = []
        var iterations = 0
        
        nodesOpened.append(root)
        var solutionFlag = false
        
        while (nodesOpened.count > 0 && !solutionFlag) {
            let currentNode = nodesOpened[0]
            nodesClosed.append(currentNode)
            nodesOpened.removeFirst()
            
            currentNode.expandNode()
            iterations += 1
            
            var cScore = calcFScore(it: iterations, node: currentNode.boardsList[0])
            
            print("It: \(iterations)")
            
            for i in 0...currentNode.boardsList.count - 1 {
                let currentChild = currentNode.boardsList[i]
                
                if currentChild.isGoal() {
                    print("Goal Found. 🎉 🎉 🎉")
                    solutionFlag = true
                    solution = pathToSolotion(solutionNode: currentChild)
                }
                
            
                
                print(calcFScore(it: iterations, node: currentChild))
                
                
                if (!checkExistence(nodesList: nodesOpened, node: currentChild) &&
                    !checkExistence(nodesList: nodesClosed, node: currentChild) &&
                    cScore >= calcFScore(it: iterations, node: currentChild)) {
     
                    cScore = calcFScore(it: iterations, node: currentChild)
                    
                    nodesOpened.append(currentChild)
            
                    
                }
            }
        }
        return solution
    }
    
    func HillClimbSearch(root: Node<Int>) -> Array<Node<Int>> {
        var solution: Array<Node<Int>> = []
        var nodesOpened: Array<Node<Int>> = []
        var nodesClosed: Array<Node<Int>> = []
        var iterations = 0
        
        nodesOpened.append(root)
        var solutionFlag = false
        
        while (nodesOpened.count > 0 && !solutionFlag) {
            let currentNode = nodesOpened[0]
            nodesClosed.append(currentNode)
            nodesOpened.removeFirst()
            
            currentNode.expandNode()
            iterations += 1
            
            var cScore = manhattanDistance(board: currentNode.board)
            
            print("It: \(iterations)")
            
            for i in 0...currentNode.boardsList.count - 1 {
                let currentChild = currentNode.boardsList[i]
                
                if currentChild.isGoal() {
                    print("Goal Found. 🎉 🎉 🎉")
                    solutionFlag = true
                    solution = pathToSolotion(solutionNode: currentChild)
                }
                
                
                
                print(calcFScore(it: iterations, node: currentChild))
                
                
                if (!checkExistence(nodesList: nodesOpened, node: currentChild) &&
                    !checkExistence(nodesList: nodesClosed, node: currentChild) &&
                    cScore >= manhattanDistance(board: currentChild.board)) {
                    
                    cScore = manhattanDistance(board: currentChild.board)
                    nodesOpened.append(currentChild)
                }
            }
        }
        return solution
    }
    
    
    func calcFScore(it: Int, node: Node<Int>) -> Int {
        // Function to calculate de FScore for A* Algorithm
        return it + manhattanDistance(board: node.board)
    }
    
    func manhattanDistance(board: Array<Int>) -> Int {
        
        var c = 0
        var mDist = 0
        
        print()
        for i in 0...2{
            for j in 0...2{
                if board[c] == 0{
                    mDist = abs(0 - i) + abs(0 - j)
                }
                c+=1
            }
        }
        
        return mDist
    }
    
    func checkExistence(nodesList: Array<Node<Int>>, node: Node<Int>) -> Bool {
        var contains = false
        for i in nodesList{
            if i.isTheSame(node: node){
                contains = true
            }
        }
        return contains
    }
    
    func pathToSolotion(solutionNode:Node<Int>) -> Array<Node<Int>>{
        var currentNode = solutionNode
        var arrayPath: Array<Node<Int>> = []
        
        arrayPath.append(currentNode)
        
        while currentNode.parentNode != nil {
            currentNode = currentNode.parentNode!
            arrayPath.append(currentNode)
        }
        
        return arrayPath
    }
}
