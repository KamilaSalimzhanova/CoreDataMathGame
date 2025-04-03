import Foundation
import CoreData

final class HighScoreViewModel: ObservableObject {
    private let context = PersistenceController.shared.viewContext 
    @Published var highScores: [HighScoreEntity] = []

    init() {
        fetchHighScores()
    }
    
    private func fetchHighScores() {
        let request: NSFetchRequest<HighScoreEntity> = HighScoreEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "score", ascending: false)]
        do {
            highScores = try context.fetch(request)
        } catch {
            print("Error fetching high scores: \(error.localizedDescription)")
        }
    }
    
    private func saveHighScore() {
        do {
            try context.save()
            fetchHighScores()
        } catch {
            print("Error saving high score")
        }
    }
}
