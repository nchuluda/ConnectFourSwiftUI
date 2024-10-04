//
//  ContentView.swift
//  C4
//
//  Created by Nathan on 9/30/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var game: ConnectFourGame
    
    var body: some View {
        VStack {
            if game.gameOver {
                Text("Game Over")
                    .font(.largeTitle)
                Text("Player \(game.winner) Wins!")
                    .font(.largeTitle)
                Button("Reset") {
                    game.resetGame()
                }
            }
            if !game.gameOver {
                PieceToDropView()
            }
        }
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 360, height: 300)
                .foregroundStyle(.blue)
            
            // Visually display the played pieces on the gameboard
            ForEach(game.fallingPieces, id: \.self) { fallingPiece in
                Circle()
                    .frame(width: 40, height: 40)
                    .offset(x: fallingPiece.xOffset, y: fallingPiece.yOffset)
                    .foregroundStyle(fallingPiece.player == 1 ? .yellow : .red)
            }
            
            VStack {
                ForEach(game.board, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { piece in
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            
            
            // Old way of displaying pieces on board, possibly uneccessary? 
            VStack {
                ForEach(game.board.reversed(), id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { piece in
                            PieceView(player: piece.player)
                            
                        }
                    }
                }
            }
        }

        HStack {
            Player1View()
                .padding()
            Spacer()
            Player2View()
                .padding()
        }
    }
}

#Preview {
    ContentView().environmentObject(ConnectFourGame())
}
