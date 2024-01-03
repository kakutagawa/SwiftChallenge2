//
//  Challenge2View.swift
//  SwiftChallenge2
//
//  Created by 芥川浩平 on 2023/12/24.
//

import SwiftUI

class Profile: ObservableObject {
    let name: String = "芥川"
    @Published var age: Int = 25

    func happyBirthday() {
        age += 1
    }
}

struct Challenge2View: View {
    @StateObject private var profile = Profile()

    var body: some View {
        VStack(spacing: 20) {
            Text("名前:\(profile.name)")
            Text("年齢:\(profile.age)歳")
            Button {
                profile.happyBirthday()
            } label: {
                Image(systemName: "birthday.cake.fill")
                Text("誕生日")
            }
        }
    }
}

#Preview {
    Challenge2View()
}
