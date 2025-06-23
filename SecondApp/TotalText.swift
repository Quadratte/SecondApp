import SwiftUI


struct TotalText: View {
  
  var value = "Result"
  
  var body: some View {
    
    Text(value)
      .frame(width: 320, height: 80, alignment: .bottomTrailing)
      .font(.system(size: 70))
      //.background(.white)
      .foregroundColor(.white)
    
    
  }
}
