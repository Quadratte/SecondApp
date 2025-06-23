import SwiftUI

enum CalculatorMode {
  
  case notSet
  case addition
  case substraction
  case multiplication 
  
}

struct ButtonGrid: View {
  
  @Binding var total: String
  @State var currentMode: CalculatorMode = .notSet
  @State var lastButtonWasMode: Bool = false
  
  var body: some View {
    
    Grid {
      
      GridRow {
        CalculatorButton(buttonText: "1", action: numberWasPressed)
        CalculatorButton(buttonText: "2", action: numberWasPressed)
        CalculatorButton(buttonText: "3", action: numberWasPressed)
        CalculatorButton(buttonText: "+", color:.orange, action: modeWasPressed, mode: .addition)
      }
      GridRow {
        CalculatorButton(buttonText: "4", action: numberWasPressed)
        CalculatorButton(buttonText: "5", action: numberWasPressed)
        CalculatorButton(buttonText: "6", action: numberWasPressed)
        CalculatorButton(buttonText: "-", color: .orange, action: modeWasPressed, mode: .substraction)
      }
      GridRow {
        CalculatorButton(buttonText: "7", action: numberWasPressed)
        CalculatorButton(buttonText: "8", action: numberWasPressed)
        CalculatorButton(buttonText: "9", action: numberWasPressed)
        CalculatorButton(buttonText: "x", color: .orange, action: modeWasPressed, mode: .multiplication)
      }
      GridRow {
        CalculatorButton(buttonText: "0", buttonWidth: 167, action: numberWasPressed)
          .gridCellColumns(2)
        CalculatorButton(buttonText: "C", color: .gray, action: clearWasPressed)
        CalculatorButton(buttonText: "=", color: .orange, action: equalWasPressed)
      }
    }

  }
  
  func numberWasPressed(button: CalculatorButton) {
    if lastButtonWasMode {
      lastButtonWasMode = false
    }
    if let totalInt = Int(total + button.buttonText) {
      total = "\(totalInt)"
    } else {
      total = "Error"
    }
  }
  
  func modeWasPressed(button: CalculatorButton) {
    currentMode = button.mode
    lastButtonWasMode = true
    print(lastButtonWasMode)
    print("mode was pressed \(button.mode)")
    
  }
  
  func clearWasPressed(button: CalculatorButton) {
    total = "0"
  }
  
  func equalWasPressed(button: CalculatorButton) {
    if currentMode == .notSet || lastButtonWasMode {
      return
    }
  }
  
}

struct GridControl_Previews: PreviewProvider {
  static var previews: some View {
    ButtonGrid(total: .constant("1"))
  }
}
