public struct ColorMatchingGame {
    public var targetColorName: String
    public var chosenColorKeys: [String]
    public var gameOver: Bool
    
    public init(targetColorName: String, chosenColorKeys: [String], gameOver: Bool) {
        self.targetColorName = targetColorName
        self.chosenColorKeys = chosenColorKeys
        self.gameOver = gameOver
    }
}
