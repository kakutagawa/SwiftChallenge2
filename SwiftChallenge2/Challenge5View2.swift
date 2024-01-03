//
//  Challenge5View2.swift
//  SwiftChallenge2
//
//  Created by 芥川浩平 on 2024/01/02.
//

import SwiftUI

struct ToDo: Codable {
    var id: Int
    var userId: Int
    var title: String
    var completed: Bool
}

final class APIClient2: ObservableObject {
    @Published var todos: [ToDo] = []

    func request() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let todo = try JSONDecoder().decode([ToDo].self, from: data)
            Task { @MainActor in
                self.todos = todo
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct Challenge5View2: View {
    @StateObject private var apiClient = APIClient()

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(apiClient.todos, id: \.id) { todo in
                    HStack(spacing: 24) {
                        VStack(spacing: 8) {
                            Text("ユーザーID: \(todo.userId)")
                                .font(.caption)
                            if todo.completed {
                                Image(systemName: "checkmark.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16, height: 16)
                                    .foregroundStyle(.green)
                            }
                        }
                        Text(todo.title)
                            .font(.callout)
                    }
                    .frame(height: 80)
                    Divider()
                }
                .padding(.horizontal, 16)
            }
        }
        .onAppear {
            Task {
                await apiClient.request()
            }
        }
    }
}

#Preview {
    Challenge5View2()
}
