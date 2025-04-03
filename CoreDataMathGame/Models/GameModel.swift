import Foundation

struct GameModel: Identifiable {
    // MARK: - Static variable
    static let defaultGame: GameModel = .init(level: 1, score: 0, speed: 1, lives: 3)
    
    // MARK: - Struct properties
    let id = UUID()
    var level: Int
    var score: Int
    var speed: Int
    var lives: Int
    var currentProblem: ProblemModel
    
    // MARK: - Computed property
    var gameOver: Bool { lives == 0 }
    
    // MARK: - Initializer of singleton struct
    init(level: Int, score: Int, speed: Int, lives: Int) {
        self.level = level
        self.score = score
        self.speed = speed
        self.lives = lives
        self.currentProblem = ProblemModel(level: level)
    }

    // MARK: - Mutating function
    mutating func updateScore(val: Int) {
        level > 0 ? (currentProblem.checkSolution(value: val) ? (score += level) : (lives -= 1)) : nil
    }
    
    mutating func setCurrentProblem(_ newCurrentProblem: ProblemModel) {
        self.currentProblem = newCurrentProblem
    }
    
    mutating func setLevel() {
        self.level += 1
    }
    
    mutating func increaseScore() {
        self.score += min(level, 10)
    }
    
    mutating func loseLife() {
        self.lives = max(self.lives - 1, 0)
        self.score = max(self.score - 2, 0)
    }
    
    mutating func reset() {
        level = 1
        score = 0
        speed = 1
        lives = 3
    }
    
    // MARK: - Public functions Get
    func getScore() -> Int { self.score }
    func getNumber1() -> Int { self.currentProblem.number1 }
    func getNumber2() -> Int { self.currentProblem.number2 }
    func getSolutions() -> [Int] { self.currentProblem.solutions }
    func getAnswer() -> Int { self.currentProblem.answer }
    func getLevel() -> Int { self.level }
    func getLives() -> Int { self.lives }
}
