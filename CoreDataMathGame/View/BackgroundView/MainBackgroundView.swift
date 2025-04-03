import SwiftUI

struct MainBackgroundView: View {
    let colorList: [Color]
    let opacity: Double
    
    init(colorList: [Color] = [.pink, .red, .yellow], opacity: Double = 0.7) {
        self.colorList = colorList
        self.opacity = opacity
    }
    
    var body: some View {
        LinearGradient(colors: colorList, startPoint: .topLeading, endPoint: .bottomTrailing)
            .opacity(opacity)
            .ignoresSafeArea()
    }
}

struct MainBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        MainBackgroundView()
    }
}
