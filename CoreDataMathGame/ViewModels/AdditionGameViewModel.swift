import Foundation

final class AdditionGameViewModel: ObservableObject {
    @Published var gameModel: GameModel = GameModel.defaultGame
    
    // MARK: - Private properties
    private var problemCount = 0
    private var nextLevelAfter = 5
    
    // MARK: - Computed properties
    var score: Int { gameModel.getScore() }
    var lives: Int { gameModel.getLives() }
    var levels: Int { gameModel.getLevel() }
    var timeToMoveToNextLevel: Bool { problemCount % nextLevelAfter == 0 } // 5, 10, 15 - move
    var number1: Int { gameModel.getNumber1() }
    var number2: Int { gameModel.getNumber2() }
    var possibleSolutions: [Int] { gameModel.getSolutions().shuffled() }
    var answer: Int { gameModel.getAnswer() }
    
    // MARK: - Public functions
    func generateNumbers() {
        gameModel.setCurrentProblem(ProblemModel(level: gameModel.getLevel()))
        problemCount += 1
        if timeToMoveToNextLevel {
            gameModel.setLevel()
        }
    }
    
    func increaseScore() { gameModel.increaseScore() }
    func loseLife() { gameModel.loseLife() }
    func reset() {
        gameModel.reset()
        problemCount = 0
    }
}
