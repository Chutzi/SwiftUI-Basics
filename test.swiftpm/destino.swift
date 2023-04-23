//
//  destino.swift
//  test
//
//  Created by user238402 on 4/16/23.
//

import SwiftUI

struct destino: View {
    var isTiming: Bool
    var duracion: Double
    var tam: Double = 200
    @State private var scale: CGFloat = 1.0
    
    

    
    var body: some View {
        VStack {
            Button("Aaaaa") {
                
            }
            .hoverEffect(.automatic)
            .background(Color.black)
            Text(isTiming ? "Start" : "uwu").font(.system(size:45, weight: .medium, design: .rounded))
                .frame(width: tam, height: 80)
                .background(Color.red)
                .hoverEffect(.automatic)
                .animation(.easeIn(duration: duracion))
            
            Text("¡Hola, mundo!")
                .animation(.easeInOut(duration: duracion))

            Text("Hello, SwiftUI!")
                           .font(.largeTitle)
                           .scaleEffect(scale)
                           

                       Slider(value: $scale, in: 0.1...2.0, step: 0.1) // Use a slider to adjust the scaling factor
                           .padding(.horizontal)
            Text("Rotate").rotation3DEffect(.degrees(90), axis: (x : 1, y: 0, z:0))
                
        }
    }
}

struct destino_Previews: PreviewProvider {
    static var previews: some View {
        destino(isTiming: true, duracion: 1, tam: 500)
    }
}
