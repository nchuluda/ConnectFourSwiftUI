////
////  Model.swift
////  C4
////
////  Created by Nathan on 9/30/24.
////
//
import SwiftUI

class ConnectFourGame: ObservableObject {
    var board = [
        [Piece(), Piece(), Piece(), Piece(), Piece(), Piece(), Piece()],
        [Piece(), Piece(), Piece(), Piece(), Piece(), Piece(), Piece()],
        [Piece(), Piece(), Piece(), Piece(), Piece(), Piece(), Piece()],
        [Piece(), Piece(), Piece(), Piece(), Piece(), Piece(), Piece()],
        [Piece(), Piece(), Piece(), Piece(), Piece(), Piece(), Piece()],
        [Piece(), Piece(), Piece(), Piece(), Piece(), Piece(), Piece()]
    ]
    
    @Published var currentPlayer = 1
    @Published var pieceOffset: CGFloat = 0
    
    var gameOver = false
    
    var winner: Int = 0
    
    var validLocations: [Int] {
        getValidLocations()
    }
    
    var dropLocations: [Int] = [-145, -94, -47, 0, 47, 94, 145]
    
    var fallingPieces: [FallingPiece] = [
        FallingPiece(player: 2, xOffset: -144, yOffset: 120),
        FallingPiece(player: 2, xOffset: -96, yOffset: 120),
        FallingPiece(player: 1, xOffset: -48, yOffset: 120),
        FallingPiece(player: 2, xOffset: 0, yOffset: 120),
        FallingPiece(player: 1, xOffset: 48, yOffset: 120),
        FallingPiece(player: 1, xOffset: 96, yOffset: 120),
        FallingPiece(player: 1, xOffset: 145, yOffset: 120),
        
        FallingPiece(player: 1, xOffset: -144, yOffset: 72),
        FallingPiece(player: 2, xOffset: -96, yOffset: 72),
        FallingPiece(player: 2, xOffset: -48, yOffset: 72),
        FallingPiece(player: 1, xOffset: 0, yOffset: 72),
        FallingPiece(player: 1, xOffset: 48, yOffset: 72),
        FallingPiece(player: 2, xOffset: 96, yOffset: 72),
        FallingPiece(player: 1, xOffset: 145, yOffset: 72)
        
    ]
    
    var tokenDrag: some Gesture {
            DragGesture()
            .onChanged { [self] value in
                    if value.location.x < -122.5  && validLocations.contains(0) {
                        withAnimation {
                            pieceOffset = -145
                        }
                    } else if value.location.x < -75.5 && validLocations.contains(1) {
                        withAnimation {
                            pieceOffset = -94
                        }
                    } else if value.location.x < -23.5 && validLocations.contains(2) {
                        withAnimation {
                            pieceOffset = -47
                        }
                    } else if value.location.x < 23.5 && validLocations.contains(3) {
                        withAnimation {
                           pieceOffset = 0
                        }
                    } else if value.location.x < 75.5 && validLocations.contains(4) {
                        withAnimation {
                            pieceOffset = 47
                        }
                    } else if value.location.x <= 122.5 && validLocations.contains(5) {
                        withAnimation {
                            pieceOffset = 94
                        }
                    } else if value.location.x > 122.5 && validLocations.contains(6) {
                        withAnimation {
                            pieceOffset = 145
                        }
                    }
                }
        
//                .onEnded { _ in
//                    switch self.pieceOffset {
//                    case -145:
//                        self.processTurn(col: 0)
//                    case -94:
//                        self.processTurn(col: 1)
//                    case -47:
//                        self.processTurn(col: 2)
//                    case 0:
//                        self.processTurn(col: 3)
//                    case 47:
//                        self.processTurn(col: 4)
//                    case 94:
//                        self.processTurn(col: 5)
//                    case 145:
//                        self.processTurn(col: 6)
//                    default:
//                        break
//                    }
//                }
        }
    
    func drop(at pieceOffset: CGFloat) {
        switch self.pieceOffset {
        case -145:
            self.processTurn(col: 0)
        case -94:
            self.processTurn(col: 1)
        case -47:
            self.processTurn(col: 2)
        case 0:
            self.processTurn(col: 3)
        case 47:
            self.processTurn(col: 4)
        case 94:
            self.processTurn(col: 5)
        case 145:
            self.processTurn(col: 6)
        default:
            break
        }
    }
    
    func processTurn(col: Int) {
        if let nextOpenRow = getNextOpenRow(col: col) {
            // Drop piece into array for gameplay logic
            dropPiece(row: nextOpenRow, col: col, player: currentPlayer)
            
            // Drop piece behind board for falling pieces animation
            
            
            gameOver = checkForWin(player: currentPlayer)
            if gameOver {
                winner = currentPlayer
            }
            currentPlayer = nextPlayer(currentPlayer: currentPlayer)
        }
    }
    
    func addFallingPiece(col: Int, player: Int) {
        
    }
    
    func getValidLocations() -> [Int] {
        var validLocations: [Int] = []
        
        for col in (0...6) {
            if isValidLocation(col: col) {
                validLocations.append(col)
            }
        }
        return validLocations
    }
    
    
    func isValidLocation(col: Int) -> Bool {
        return board[5][col] == Piece(player: 0)
    }

    
    func getNextOpenRow(col: Int) -> Int? {
        for row in (0...5) {
            if board[row][col] == Piece(player: 0) {
                return row
            }
        }
        return nil
    }
    
    
    func dropPiece(row: Int, col: Int, player: Int) {
        board[row][col] = Piece(player: player)
        
        
    }
    
    
    func nextPlayer(currentPlayer: Int) -> Int {
        currentPlayer == 1 ? 2 : 1
    }
    
    
    func checkForWin(player: Int) -> Bool {
        // Horizontal
        for c in (0...3) {
            for r in (0...5) {
                if board[r][c] == Piece(player: player) && board[r][c + 1] == Piece(player: player) && board[r][c + 2] == Piece(player: player) && board[r][c + 3] == Piece(player: player) {
                    return true
                }
            }
        }
        
        // Vertical
        for c in (0...6) {
            for r in (0...2) {
                if board[r][c] == Piece(player: player) && board[r + 1][c] == Piece(player: player) && board[r + 2][c] == Piece(player: player) && board[r + 3][c] == Piece(player: player) {
                    return true
                }
            }
        }
        
        // Diagonal upwards
        for c in (0...3) {
            for r in (0...2) {
                if board[r][c] == Piece(player: player) && board[r + 1][c + 1] == Piece(player: player) && board[r + 2][c + 2] == Piece(player: player) && board[r + 3][c + 3] == Piece(player: player) {
                    return true
                }
            }
        }
        
        // Diagonal downwards
        for c in (0...3) {
            for r in (3...5) {
                if board[r][c] == Piece(player: player) && board[r - 1][c - 1] == Piece(player: player) && board[r - 2][c - 2] == Piece(player: player) && board[r - 3][c - 3] == Piece(player: player) {
                    return true
                }
            }
        }
        return false
    }
    
    func resetGame() {
        board = [
            [Piece(), Piece(), Piece(), Piece(), Piece(), Piece(), Piece()],
            [Piece(), Piece(), Piece(), Piece(), Piece(), Piece(), Piece()],
            [Piece(), Piece(), Piece(), Piece(), Piece(), Piece(), Piece()],
            [Piece(), Piece(), Piece(), Piece(), Piece(), Piece(), Piece()],
            [Piece(), Piece(), Piece(), Piece(), Piece(), Piece(), Piece()],
            [Piece(), Piece(), Piece(), Piece(), Piece(), Piece(), Piece()]
        ]
        
        currentPlayer = 1
        gameOver = false
    }
}
