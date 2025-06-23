import SwiftUI

struct ContentView: View {
  @State var total = "0"
  @State var mode: CalculatorMode = .notSet
  
  var body: some View {
    
    ZStack {
      Color(.black)
        .ignoresSafeArea(.all)
      VStack {
        Spacer()
        TotalText(value: total)
        ButtonGrid(total: $total)
      }
    }
  }
  
  func getSum() {
    total = "alupa"
  }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}
