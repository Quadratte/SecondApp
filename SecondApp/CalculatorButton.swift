import SwiftUI

struct CalculatorButton: View {
  
  var buttonText = "0"
  var buttonWidth: CGFloat = 80
  var color = Color(hue: 1.0, saturation: 0.0, brightness: 0.283)
  var action: (CalculatorButton) -> Void = { _ in  }
  var mode: CalculatorMode = .notSet
  var body: some View {
    
    Button {
      action(self)
    } label: {
      Text(buttonText)
        .font(.largeTitle)
        .frame(width: buttonWidth, height: 80, alignment: .center)
        .foregroundColor(.white)
        .background(color)
        .cornerRadius(20)
    }
  }
}

struct ButtonControl_Preview: PreviewProvider {
  static var previews: some View {
   CalculatorButton()
  }
}
