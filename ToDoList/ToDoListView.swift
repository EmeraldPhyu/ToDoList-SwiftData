//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Emerald on 20/11/24.
//

import SwiftUI

struct ToDoListView: View {
	var toDos = ["Learn Swift", "Build Apps", "Learn to play new song", "Keep calm and Paint", "Go a Date", "Workout", "Meditate"]
	var body: some View {
		NavigationStack {
			List{
				ForEach(toDos, id: \.self) { toDo in
					NavigationLink {
						DetailView(passedValue: toDo)
					} label: {
						Text(toDo)
					}
				}
			}.navigationTitle("To Do List")
				.navigationBarTitleDisplayMode(.automatic)
				.listStyle(.plain)
		}
	}
}

#Preview {
	ToDoListView()
}
