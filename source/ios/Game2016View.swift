import SwiftUI

struct Game2016View: View {
    @EnvironmentObject private var environment: ServiceEnvironment
    let universeId: Int
    let placeId: Int

    @State private var showPlayerList = true
    @State private var showChat = true
    @State private var showBackpack = false
    @State private var showMenu = false
    @State private var health: Double = 1.0
    @State private var chatText = ""

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                // Game viewport placeholder. The real Roblox runtime is intentionally separate.
                LinearGradient(
                    colors: [Color(red: 0.08, green: 0.10, blue: 0.14), Color(red: 0.16, green: 0.18, blue: 0.22)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack(spacing: 0) {
                    topBar
                    Spacer()
                    bottomHud(width: proxy.size.width, height: proxy.size.height)
                }

                if showPlayerList {
                    PlayerList2016()
                        .frame(maxWidth: proxy.size.width > 700 ? 260 : 220)
                        .padding(.top, 54)
                        .padding(.trailing, 10)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                }

                if showChat {
                    Chat2016(text: $chatText)
                        .frame(width: proxy.size.width > 700 ? 340 : 280,
                               height: proxy.size.height > 650 ? 230 : 190)
                        .padding(.leading, 10)
                        .padding(.top, 54)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                }

                if showBackpack {
                    Backpack2016()
                        .padding(16)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                }

                if showMenu {
                    Menu2016(
                        onResume: { showMenu = false },
                        onBackpack: {
                            showMenu = false
                            showBackpack = true
                        }
                    )
                    .padding(24)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
        .statusBar(hidden: true)
        .preferredColorScheme(.dark)
        .navigationBarBackButtonHidden(true)
        .task {
            _ = await environment.service.game(universeId: universeId)
        }
    }

    private var topBar: some View {
        HStack(spacing: 8) {
            Text("ROBLOX")
                .font(.system(size: 18, weight: .bold, design: .rounded))
            Spacer()
            Button {
                showChat.toggle()
            } label: {
                Image(systemName: "message.fill")
            }
            Button {
                showPlayerList.toggle()
            } label: {
                Image(systemName: "person.2.fill")
            }
            Button {
                showBackpack = true
            } label: {
                Image(systemName: "shippingbox.fill")
            }
            Button {
                showMenu = true
            } label: {
                Image(systemName: "line.3.horizontal")
            }
        }
        .foregroundStyle(.white)
        .padding(.horizontal, 12)
        .frame(height: 44)
        .background(Color.black.opacity(0.55))
    }

    private func bottomHud(width: CGFloat, height: CGFloat) -> some View {
        ZStack {
            HStack(alignment: .bottom) {
                Health2016(value: health)
                    .frame(width: min(220, width * 0.38))

                Spacer()

                Joystick2016()
                    .frame(width: 112, height: 112)

                Spacer()

                JumpButton2016()
                    .frame(width: 82, height: 82)
            }
            .padding(.horizontal, 18)
            .padding(.bottom, 16)

            if height > 500 {
                HStack(spacing: 8) {
                    ForEach(0..<4, id: \.self) { index in
                        Text("\(index + 1)")
                            .font(.caption.bold())
                            .frame(width: 42, height: 42)
                            .background(Color.black.opacity(0.55))
                            .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.white.opacity(0.5), lineWidth: 1))
                    }
                }
                .padding(.bottom, 118)
            }
        }
    }
}

private struct Panel2016<Content: View>: View {
    let title: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title.uppercased())
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(.white)
                .padding(.horizontal, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 30)
                .background(Color.black.opacity(0.72))

            content
                .background(Color.black.opacity(0.48))
        }
        .clipShape(RoundedRectangle(cornerRadius: 3))
        .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.white.opacity(0.18), lineWidth: 1))
        .shadow(radius: 8)
    }
}

private struct PlayerList2016: View {
    var body: some View {
        Panel2016(title: "Players") {
            VStack(alignment: .leading, spacing: 5) {
                Text("Player")
                Text("Builder")
                Text("RobloxPlayer")
                Text("Guest_2016")
            }
            .font(.system(size: 13))
            .foregroundStyle(.white)
            .padding(10)
        }
    }
}

private struct Chat2016: View {
    @Binding var text: String

    var body: some View {
        Panel2016(title: "Chat") {
            VStack(spacing: 8) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Builder: Welcome!")
                        Text("RobloxPlayer: hi")
                        Text("Guest_2016: have fun")
                    }
                    .font(.system(size: 12))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }

                HStack(spacing: 6) {
                    TextField("Type a message...", text: $text)
                        .textFieldStyle(.roundedBorder)
                    Button("Send") {
                        text = ""
                    }
                    .buttonStyle(.bordered)
                }
            }
            .padding(8)
        }
    }
}

private struct Health2016: View {
    let value: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text("HEALTH")
                .font(.system(size: 10, weight: .bold))
                .foregroundStyle(.white)
            GeometryReader { proxy in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color.black.opacity(0.65))
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color.green.opacity(0.9))
                        .frame(width: proxy.size.width * value)
                }
            }
            .frame(height: 12)
        }
    }
}

private struct Joystick2016: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black.opacity(0.34))
                .overlay(Circle().stroke(Color.white.opacity(0.35), lineWidth: 2))
            Circle()
                .fill(Color.white.opacity(0.12))
                .frame(width: 46, height: 46)
                .overlay(Circle().stroke(Color.white.opacity(0.45), lineWidth: 1))
        }
    }
}

private struct JumpButton2016: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black.opacity(0.36))
                .overlay(Circle().stroke(Color.white.opacity(0.35), lineWidth: 2))
            Text("JUMP")
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(.white)
        }
    }
}

private struct Backpack2016: View {
    let items = ["Sword", "Tool", "Blocks", "Camera", "Item 5", "Item 6"]

    var body: some View {
        Panel2016(title: "Backpack") {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 3), spacing: 8) {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    VStack(spacing: 4) {
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color.white.opacity(0.10))
                            .frame(height: 64)
                            .overlay(Text("\(index + 1)").font(.caption.bold()).foregroundStyle(.white))
                        Text(item)
                            .font(.caption2)
                            .foregroundStyle(.white)
                    }
                }
            }
            .padding(10)
        }
    }
}

private struct Menu2016: View {
    let onResume: () -> Void
    let onBackpack: () -> Void

    var body: some View {
        VStack(spacing: 8) {
            Text("GAME MENU")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(.white)
                .padding(.bottom, 4)

            Button("RESUME", action: onResume)
            Button("BACKPACK", action: onBackpack)
            Button("SETTINGS") { }
            Button("LEAVE") { }
        }
        .buttonStyle(MenuButtonStyle())
        .padding(18)
        .frame(maxWidth: 300)
        .background(Color.black.opacity(0.68))
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.white.opacity(0.22), lineWidth: 1))
    }
}

private struct MenuButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 13, weight: .bold))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 42)
            .background(configuration.isPressed ? Color.white.opacity(0.22) : Color.white.opacity(0.10))
            .overlay(Rectangle().stroke(Color.white.opacity(0.18), lineWidth: 1))
    }
}

#Preview {
    Game2016View(universeId: 0, placeId: 0)
        .environmentObject(ServiceEnvironment())
}
