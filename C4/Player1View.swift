//
//  Player1View.swift
//  C4
//
//  Created by Nathan on 10/1/24.
//

import SwiftUI

struct Player1View: View {
    @EnvironmentObject var game: ConnectFourGame
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 150, height: 80)
                .foregroundColor(.yellow)
                .opacity(game.currentPlayer == 1 ? 0.8 : 0.3)
                .shadow(color: .gray, radius: game.currentPlayer == 1 ? 5 : 0, x: 0, y: 5)
            Text("Player 1")
                .font(.title.bold())
        }
    }
}

#Preview {
    Player1View().environmentObject(ConnectFourGame())
}
