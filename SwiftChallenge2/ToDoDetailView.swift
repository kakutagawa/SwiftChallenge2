//
//  ToDoDetailView.swift
//  SwiftChallenge2
//
//  Created by 芥川浩平 on 2024/01/05.
//

import SwiftUI

struct ToDoDetailView: View {
    let todo: Todo

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("ユーザーID: \(todo.userId)")
                .font(.caption)
            Text("\(todo.title)")
                .font(.headline)
        }
        .padding(16)
        .navigationTitle(todo.completed ? "完了タスク" : "非完了タスク")
    }
}

#Preview {
    ToDoDetailView(todo: Todo(id: 1, userId: 1, title: "Hi", completed: true))
}
