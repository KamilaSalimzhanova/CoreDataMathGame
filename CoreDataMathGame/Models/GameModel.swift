import Foundation

struct gameModel: Identifiable {
    let id = UUID()
    var level: Int
    var score: Int
    var speed: Int
    var lives: Int
    var currentProblem: ProblemModel
    
    var gameOver: Bool { lives == 0 }
    
    static let defaultGame: gameModel = .init(level: 1, score: 0, speed: 1, lives: 3)
    
    private init(level: Int, score: Int, speed: Int, lives: Int) {
        self.level = level
        self.score = score
        self.speed = speed
        self.lives = lives
        self.currentProblem = ProblemModel(level: level)
    }

    mutating func updateScore(val: Int) {
        level > 0 ? (currentProblem.checkSolution(value: val) ? (score += level) : (lives -= 1)) : nil
    }
}
