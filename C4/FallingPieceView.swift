//
//  FallingPieceView.swift
//  C4
//
//  Created by Nathan on 10/2/24.
//

import SwiftUI

struct FallingPieceView: View {
    @State var yOffset1: CGFloat = 0
    @State var yOffset2: CGFloat = 0
    @State var yOffset3: CGFloat = 0
    @State var yOffset4: CGFloat = 0
    
    var body: some View {
        VStack {
            HStack {
                Button("Drop Pieces") {
                    withAnimation(.easeIn(duration: 1)) {
                        yOffset1 = 500
                        yOffset2 = 600
                        yOffset3 = 450
                        yOffset4 = 700
                    }
                }
                Button("Reset") {
                        yOffset1 = 0
                        yOffset2 = 0
                        yOffset3 = 0
                        yOffset4 = 0
                }
            }
            VStack {
                HStack {
                    Circle()
                        .foregroundStyle(.red)
                        .frame(width: 40, height: 40)
                        .offset(y: yOffset1)
                        .shadow(radius: 10)
                    Circle()
                        .foregroundStyle(.yellow)
                        .frame(width: 40, height: 40)
                        .offset(y: yOffset2)
                    Circle()
                        .foregroundStyle(.red)
                        .frame(width: 40, height: 40)
                        .offset(y: yOffset3)
                    Circle()
                        .foregroundStyle(.red)
                        .frame(width: 40, height: 40)
                        .offset(y: yOffset4)
                    Circle()
                        .foregroundStyle(.yellow)
                        .frame(width: 40, height: 40)
                        .offset(y: yOffset2)
                    Circle()
                        .foregroundStyle(.yellow)
                        .frame(width: 40, height: 40)
                        .offset(y: yOffset1)
                    Circle()
                        .foregroundStyle(.yellow)
                        .frame(width: 40, height: 40)
                        .offset(y: yOffset3)
                }
                HStack {
                    Circle()
                        .foregroundStyle(.yellow)
                        .frame(width: 40, height: 40)
                        .offset(y: yOffset2)
                    Circle()
                        .foregroundStyle(.red)
                        .frame(width: 40, height: 40)
                        .offset(y: yOffset4)
                    Circle()
                        .foregroundStyle(.red)
                        .frame(width: 40, height: 40)
                        .offset(y: yOffset1)
                    Circle()
                        .foregroundStyle(.red)
                        .frame(width: 40, height: 40)
                        .offset(y: yOffset3)
                    Circle()
                        .foregroundStyle(.yellow)
                        .frame(width: 40, height: 40)
                        .offset(y: yOffset1)
                    Circle()
                        .foregroundStyle(.red)
                        .frame(width: 40, height: 40)
                        .offset(y: yOffset4)
                    Circle()
                        .foregroundStyle(.yellow)
                        .frame(width: 40, height: 40)
                        .offset(y: yOffset2)
                }
            }
        }
    }
}

#Preview {
    FallingPieceView()
}
