//
//  Player2View.swift
//  C4
//
//  Created by Nathan on 10/1/24.
//

import SwiftUI

struct Player2View: View {
    @EnvironmentObject var game: ConnectFourGame
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 150, height: 80)
                .foregroundColor(.red)
                .opacity(game.currentPlayer == 1 ? 0.3 : 0.8)
                .shadow(color: .gray, radius: game.currentPlayer == 1 ? 0 : 5, x: 0, y: 5)
            Text("Player 2")
                .font(.title.bold())
                
        }
    }
}

#Preview {
    Player2View().environmentObject(ConnectFourGame())
}
