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
  @State var savedInt: Int = 0
  @State var currentInt : Int = 0
  
  var body: some View {
    
    Grid {
      
      GridRow {
        CalculatorButton(buttonText: "1", action: numberWasPressed)
        CalculatorButton(buttonText: "2", action: numberWasPressed)
        CalculatorButton(buttonText: "3", action: numberWasPressed)
        CalculatorImageButton(buttonText: "plus", color:.orange, action: modeWasPressed, mode: .addition)
      }
      GridRow {
        CalculatorButton(buttonText: "4", action: numberWasPressed)
        CalculatorButton(buttonText: "5", action: numberWasPressed)
        CalculatorButton(buttonText: "6", action: numberWasPressed)
        CalculatorImageButton(buttonText: "minus", color: .orange, action: modeWasPressed, mode: .substraction)
      }
      GridRow {
        CalculatorButton(buttonText: "7", action: numberWasPressed)
        CalculatorButton(buttonText: "8", action: numberWasPressed)
        CalculatorButton(buttonText: "9", action: numberWasPressed)
        CalculatorImageButton(buttonText: "multiply", color: .orange, action: modeWasPressed, mode: .multiplication)
      }
      GridRow {
        CalculatorButton(buttonText: "0", buttonWidth: 167, action: numberWasPressed)
          .gridCellColumns(2)
        CalculatorButton(buttonText: "C", color: .gray, action: clearWasPressed)
        CalculatorImageButton(buttonText: "equal", color: .orange, action: equalWasPressed)
      }
    }

  }
  
  func numberWasPressed(button: CalculatorButton) {
    if lastButtonWasMode {
      lastButtonWasMode = false
      currentInt = 0
    }
    if let totalInt = Int("\(currentInt)" + button.buttonText) {
      currentInt = totalInt
      updateText()
    } else {
      total = "Error"
      currentInt = 0
    }
  }
  
  func modeWasPressed(button: CalculatorImageButton) {
    currentMode = button.mode
    lastButtonWasMode = true
    savedInt = Int(total)!
    
  }
  
  func clearWasPressed(button: CalculatorButton) {
    total = "0"
    currentMode = .notSet
    lastButtonWasMode = false
    savedInt = 0
    currentInt = 0
  }
  
  func equalWasPressed(button: CalculatorImageButton) {
    if currentMode == .notSet || lastButtonWasMode {
      return
    }
    if currentMode == .addition {
      savedInt += currentInt
    } else if currentMode == .substraction {
      savedInt -= currentInt
    } else if currentMode == .multiplication {
      savedInt *= currentInt
    }
    
    currentInt = savedInt
    updateText()
    lastButtonWasMode = true
  }
  
  func updateText() {
    if currentMode == .notSet {
      savedInt = currentInt
    }
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    total = formatter.string(for: currentInt) ?? "Error"
  }
  
}

struct GridControl_Previews: PreviewProvider {
  static var previews: some View {
    ButtonGrid(total: .constant("1"))
  }
}
