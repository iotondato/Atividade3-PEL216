//
//  node.swift
//  Atividade3
//
//  Created by Brenno Tondato de Faria on 07/08/19.
//  Copyright © 2019 Brenno Tondato de Faria. All rights reserved.
//

import Foundation

class Node<T: Equatable>{
    var boardsList: Array<Node<Int>>
    var parentNode: Node? = nil
    var board: Array<Int>
    
    init(initialBoard: Array<T>) {
        self.board = initialBoard as! Array<Int>
        self.boardsList = []
    }
    
    func printBoard() {
        var c = 0
        print()
        for _ in 0...2{
            for _ in 0...2{
                print(self.board[c], terminator: " ")
                c+=1
            }
            print()
        }
        print()
    }
    
    func rightMove(board: Array<Int>, index: Int){
        if index % 3 < 2 {
            var boardCopy = board
            
            let temp = boardCopy[index + 1]
            boardCopy[index + 1] = boardCopy [index]
            boardCopy [index] = temp
            
            let childNode = Node<Int>(initialBoard: boardCopy)
            self.boardsList.append(childNode)
            childNode.parentNode = (self as! Node<Int>)
        }
    }
    
    func leftMove(board: Array<Int>, index: Int){
        if index % 3 > 0{
            var boardCopy = board
            
            let temp = boardCopy[index - 1]
            boardCopy [index - 1]  = boardCopy[index]
            boardCopy[index] = temp
            
            let childNode = Node<Int>(initialBoard: boardCopy)
            self.boardsList.append(childNode)
            childNode.parentNode = (self as! Node<Int>)
        }
    }
    //
    func upMove(board: Array<Int>, index: Int){
        if index - 3 >= 0 {
            var boardCopy = board
            
            let temp = boardCopy[index - 3]
            boardCopy[index - 3] = boardCopy[index]
            boardCopy[index] = temp
            
            let childNode = Node<Int>(initialBoard: boardCopy)
            self.boardsList.append(childNode)
            childNode.parentNode = (self as! Node<Int>)
        }
        
    }
    //
    func downMove(board: Array<Int>, index: Int){
        if index + 3 < board.count {
            var boardCopy = board
            
            let temp = boardCopy[index + 3]
            boardCopy[index + 3] = boardCopy[index]
            boardCopy[index] = temp
            
            let childNode = Node<Int>(initialBoard: boardCopy)
            self.boardsList.append(childNode)
            childNode.parentNode = (self as! Node<Int>)
        }
    }
    
    func isGoal() -> Bool {
        var goal = true
        var head = self.board[0]
        
        for i in 0...self.board.count-1{
            if head > self.board[i]{
                goal = false
            }
            head = self.board[i]
        }
        
        return goal
    }
    
    func isTheSame(node: Node<T>) -> Bool {
        var comparisonResult = true
        
        if (self.board != node.board){
            comparisonResult  = false
        }
        
        return comparisonResult
    }
    
    func expandNode() {
        var index = 0
        for i in 0...self.board.count - 1{
            if self.board[i] == 0 {
                index = i
            }
        }
        
        rightMove(board: self.board, index: index)
        leftMove(board: self.board, index: index)
        upMove(board: self.board, index: index)
        downMove(board: self.board, index: index)
        
    }
}


