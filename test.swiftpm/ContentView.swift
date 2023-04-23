import SwiftUI

struct ContentView: View {
    
    @State var data: Double = 3
    @State var isTiming: Bool = true
    @State var tam: Double = 500
    
    @State private var countTimer = 0
    @State private var timerRunning = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Vista origen ")
                    .font(.system(size: 33))
                    .onReceive(timer) {_ in
                        if countTimer > 0 && timerRunning{
                            countTimer -= 1
                        }else{
                            timerRunning = false
                        }
                        
                    }
                    .frame(width: timerRunning ? 80 : 700, height: 90)
                    .background(Color.red)
                    .foregroundColor(timerRunning ? .red : .white)
                    .animation(.spring())
                
                NavigationLink(destination: destino(isTiming: true, duracion: 1, tam: 500)) {
                    Text("Ir a vista destino")
                }
                
                ButtonView(text: "Start")

                
            }
        }.navigationViewStyle(.stack)
    }
}

struct ButtonView: View {
    @State private var countTimer = 0
    @State private var timerRunning = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var text: String
    
    var body: some View{
        
        NavigationLink {
            View2()
        } label: {
            Text(text)
                .onReceive(timer) {_ in
                    if countTimer > 0 && timerRunning{
                        countTimer -= 1
                    }else{
                        timerRunning = false
                    }
                    
                }
                .font(.system(size:45, weight: .medium, design: .rounded))
                .frame(width: timerRunning ? 20 : 250, height: timerRunning ? 20 : 80)
                .foregroundColor(timerRunning ? .blue : .white)
                .background(.blue)
                .cornerRadius(90)
                .shadow(radius: 10)
                .animation(.spring())
                .hoverEffect(.automatic)
                                                
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "|")
    }
}
