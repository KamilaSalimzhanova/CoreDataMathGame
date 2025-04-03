import Foundation

final class AdditionGameViewModel: ObservableObject {
    @Published var gameModel: GameModel = GameModel.defaultGame
    private var problemCount = 0
    private var nextLevelAfter = 5
    
    private var score: Int { gameModel.getScore() }
    private var timeToMoveToNextLevel: Bool { problemCount % nextLevelAfter == 0 } // 5, 10, 15 - move
    private var number1: Int { gameModel.getNumber1() }
    private var number2: Int { gameModel.getNumber2() }
    private var possibleSolutions: [Int] { gameModel.getSolutions().shuffled() }
    private var answer: Int { gameModel.getAnswer() }
}
