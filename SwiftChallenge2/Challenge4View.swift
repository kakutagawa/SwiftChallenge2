//
//  Challenge4View.swift
//  SwiftChallenge2
//
//  Created by 芥川浩平 on 2023/12/27.
//

import SwiftUI

enum Icons: String, CaseIterable {
    var id: String{ self.rawValue }
    case mic = "mic.fill"
    case message = "message.fill"
    case bubble = "bubble.fill"
    case phone = "phone.fill"
    case video = "video.fill"
}

struct Challenge4View: View {
    @State private var selectedIcon = Icons.mic
    @State private var selectedColor: Color = .red
    private let colorOptions: [Color] = [.red, .blue, .yellow, .green, .orange, .purple]

    var body: some View {
        VStack(spacing: 48) {
            Picker("", selection: $selectedIcon) {
                ForEach(Icons.allCases, id: \.self) { icon in
                    Image(systemName: icon.rawValue).tag(icon)
                }
            }
            .pickerStyle(.segmented)
            HStack(spacing: 24) {
                ForEach(colorOptions, id: \.self) { color in
                    Button {
                        self.selectedColor = color
                    } label: {
                        Circle()
                            .fill(color)
                            .frame(width: 28, height: 28)
                            .overlay(
                                Circle()
                                    .stroke(Color.black, lineWidth: selectedColor == color ? 3 : 0)
                            )
                    }
                }
            }
            Image(systemName: selectedIcon.rawValue)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .foregroundStyle(selectedColor)
        }
    }
}

#Preview {
    Challenge4View()
}
