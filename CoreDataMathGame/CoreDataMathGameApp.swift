import SwiftUI

@main
struct CoreDataMathGameApp: App {
    @StateObject private var highScoreViewModel = HighScoreViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(highScoreViewModel)
        }
    }
}

