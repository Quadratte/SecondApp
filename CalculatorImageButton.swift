import SwiftUI

struct CalculatorImageButton: View {
  
  var buttonText = "plus"
  var buttonWidth: CGFloat = 80
  var color = Color(hue: 1.0, saturation: 0.0, brightness: 0.283)
  var action: (CalculatorImageButton) -> Void = { _ in  }
  var mode: CalculatorMode = .notSet
  
  var body: some View {
    
    Button {
      action(self)
    } label: {
      Image(systemName: buttonText)
        .font(.largeTitle)
        .frame(width: buttonWidth, height: 80, alignment: .center)
        .foregroundColor(.white)
        .background(color)
        .cornerRadius(20)
    }
  }
}



