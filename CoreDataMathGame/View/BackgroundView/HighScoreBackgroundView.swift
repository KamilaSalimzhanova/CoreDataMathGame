import SwiftUI

struct HighScoreBackgroundView: View {
    var body: some View {
        MainBackgroundView(colorList: [.blue, .red, .blue], opacity: 0.7)
    }
}

struct HighScoreBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        HighScoreBackgroundView()
    }
}
