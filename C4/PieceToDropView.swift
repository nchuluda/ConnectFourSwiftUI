//
//  PieceToDropView.swift
//  C4
//
//  Created by Nathan on 10/1/24.
//

import SwiftUI

struct PieceToDropView: View {
    @EnvironmentObject var game: ConnectFourGame
    
    var body: some View {
        Circle()
            .frame(width: 40, height: 40)
            .foregroundStyle(game.currentPlayer == 1 ? .yellow : .red)
            .offset(x: game.pieceOffset)
            .gesture(game.tokenDrag)
            .onTapGesture(count: 2) {
                game.drop(at: game.pieceOffset)
            }
    }
}

//#Preview {
//    PieceToDropView().environmentObject(ConnectFourGame())
//}
