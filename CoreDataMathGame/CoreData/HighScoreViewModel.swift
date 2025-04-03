import Foundation
import CoreData

final class HighScoreViewModel: ObservableObject {
    @Published var highScores: [HighScoreEntity] = []
    private let context = PersistenceController.shared.viewContext
    
    private var minHighScore: Int64? {
        highScores.isEmpty ? nil : highScores.last?.score
    }
    
    // MARK: - Init function
    init() {
        fetchHighScores()
    }
    
    // MARK: - Public functions
    func addHighScore(name: String, highScore: Int64) {
        let entity = HighScoreEntity(context: context)
        entity.name = name
        entity.score = highScore
        saveHighScore()
    }
    
    func updateEntity(_ entity: HighScoreEntity, newName: String) {
        entity.name = newName
        saveHighScore()
    }
    
    func deleteHighScore(_ entity: HighScoreEntity) {
        context.delete(entity)
        saveHighScore()
    }
    
    func isNewHighScore(_ score: Int64) -> Bool {
        if score <= 0 { return false }
        if let minHighScore {
            return minHighScore < score || highScores.count < 100
        }
        return true
    }
    
    // MARK: - Private functions
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
