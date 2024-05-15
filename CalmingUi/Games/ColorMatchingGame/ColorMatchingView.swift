import SwiftUI

public struct ColorMatchingGameView: View {
    public let colors: [String: Color]
    public var game: ColorMatchingGame
    public var circleTapped: (String) -> Void
    
    public init(colors: [String: Color], game: ColorMatchingGame, circleTapped: @escaping (String) -> Void) {
        self.colors = colors
        self.game = game
        self.circleTapped = circleTapped
    }
    
    public var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                ForEach(game.chosenColorKeys.indices, id: \.self) { index in
                    Button(action: {
                        self.circleTapped(self.game.chosenColorKeys[index])
                    }) {
                        Circle()
                            .fill(colors[game.chosenColorKeys[index]] ?? Color.white)
                            .frame(width: circleSize, height: circleSize)
                    }
                    Spacer()
                }
            }
            Spacer()
            Text(game.targetColorName)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(textColorForName(game.targetColorName))
                .padding()
                .background(Color.black.opacity(0.8))
                .cornerRadius(10)
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
            Spacer()
            if game.gameOver {
                Button("Начать заново") {
                    // Сброс состояния для новой игры
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(10)
            }
        }
        .background(Color.black)
        .ignoresSafeArea()
    }
    
    private var circleSize: CGFloat {
        UIScreen.main.bounds.width / 3 - UIScreen.main.bounds.width * 0.1
    }
    
    private func textColorForName(_ name: String) -> Color {
        if let color = colors[name], game.chosenColorKeys.contains(name) {
            for key in game.chosenColorKeys where key != name {
                return colors[key] ?? .white
            }
        }
        return .white
    }
}

