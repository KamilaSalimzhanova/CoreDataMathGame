import Foundation
import CoreData

final class HighScoreViewModel: ObservableObject {
    @Published var highScores: [HighScoreEntity] = []
    private let context = PersistenceController.shared.viewContext
    
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
