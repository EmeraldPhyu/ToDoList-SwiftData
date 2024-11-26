//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Emerald on 20/11/24.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
	//Fetches data from swiftData's modelContainer, Trigger view update
	@Query var toDos: [ToDo]
	@State private var sheetIsPresented = false
	@Environment(\.modelContext) var modelContext
	
	var body: some View {
		NavigationStack {
			List{
				ForEach(toDos) { toDo in
					VStack (alignment: .leading){
						HStack {
							Image(systemName: toDo.isCompleted ? "checkmark.rectangle" : "rectangle")
								.onTapGesture {
									toDo.isCompleted.toggle()
									guard let _ = try?  modelContext.save() else {
										print("Error: Save after .toggle on toDoListView did not work.")
										return
									}
								}
							
							NavigationLink {
								DetailView(toDo:toDo)
							} label: {
								Text(toDo.item)
							}
							.swipeActions {
								Button("Delete", role: .destructive) {
									modelContext.delete(toDo)
									guard let _ = try? modelContext.save() else {
										print("Error: Save")
										return
									}
								}
							}
						}.font(.title2)
						HStack {
							Text(toDo.dueDate.formatted(date: .abbreviated, time: .shortened))
								.foregroundStyle(.secondary)
							if toDo.reminderIsOn {
								Image(systemName: "calendar.badge.clock")
									.symbolRenderingMode(.multicolor)
							}
						}
					}
				}
				.onDelete(perform: { indexSet in
					indexSet.forEach({modelContext.delete(toDos[$0])})
					guard let _ = try? modelContext.save() else {
						print("Error: Save After .delete on ToDolistView did not work.")
						return
					}
				})
			}.navigationTitle("To Do List")
				.navigationBarTitleDisplayMode(.automatic)
				.listStyle(.plain)
				.sheet(isPresented: $sheetIsPresented){
					NavigationStack {
						DetailView(toDo: ToDo())
					}
				}
				.toolbar {
					ToolbarItem(placement: .topBarTrailing) {
						Button("", systemImage: "plus") {
							sheetIsPresented.toggle()
						}
					}
				}
		}
	}
}

#Preview {
//	ToDoListView().modelContainer(for: ToDo.self, inMemory: true)
	ToDoListView()
		.modelContainer(ToDo.preview)
}
