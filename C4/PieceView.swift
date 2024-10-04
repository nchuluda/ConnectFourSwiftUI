//
//  PieceView.swift
//  C4
//
//  Created by Nathan on 10/1/24.
//

import SwiftUI

struct PieceView: View {
    var player: Int
    
    var color: Color {
        if player == 0 { return .white }
        else if player == 1 { return .yellow }
        else if player == 2 { return .red }
        else { return .white }
    }
    
    var body: some View {
        Circle()
            .frame(width: 40, height: 40)
            .foregroundColor(color)
    }
}

//#Preview {
//    PieceView(player: 1)
//}
