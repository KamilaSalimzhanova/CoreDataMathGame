import Foundation

struct ProblemModel: Identifiable {
    let id = UUID()
    let number1: Int
    let number2: Int
    let level: Int
    var solutions: [Int]
    
    var answer: Int { solutions[0] }
    
    init(level: Int) {
        self.level = level
        let lowerRange = (level - 1) * 5 // 0, 5, 10
        let upperRange = level * 5 // 5, 10, 15
        self.number1 = Int.random(in: lowerRange...upperRange)
        self.number2 = Int.random(in: lowerRange...upperRange)
        self.solutions = []
        self.solutions = generateSolution()
    }
    
    func checkSolution(value: Int) -> Bool {
        !solutions.isEmpty && value == answer
    }
    
    private func generateSolution() -> [Int] {
        var newSolution: [Int] = []
        newSolution.append(number1 + number2) // 27
        newSolution.append(number1 + number2 + 10) // 37
        let belowAnswer = max(0, (number1 + number2)-5) // 32
        let aboveAnswer = number1 + number2 + 5 // 32
        newSolution.append(Int.random(in: number1 + number2 + 1...aboveAnswer))
        newSolution.append(Int.random(in: belowAnswer..<number1 + number2))
        return newSolution.shuffled()
    }
}
