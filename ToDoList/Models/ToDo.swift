//
//  ToDo.swift
//  ToDoList
//
//  Created by Emerald on 22/11/24.
//

import Foundation
import SwiftData

@MainActor
@Model //macros
class ToDo {
	
	var item: String = ""
	var reminderIsOn = false
	var dueDate = Date.now + 60 * 60 * 24
	var notes = ""
	var isCompleted = false
	
	init(item: String = "" , reminderIsOn: Bool = false, dueDate: Date = Date.now + 60 * 60 * 24, notes: String = "", isCompleted: Bool = false) {
		self.item = item
		self.reminderIsOn = reminderIsOn
		self.dueDate = dueDate
		self.notes = notes
		self.isCompleted = isCompleted
	}
}

extension ToDo {
	static var preview: ModelContainer {
		let container = try! ModelContainer(for: ToDo.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
		//Add mock data

		container.mainContext.insert(ToDo(item: "Finish MockData with Swift Data", reminderIsOn: true, dueDate: Date.now, isCompleted: false))
		container.mainContext.insert(ToDo(item: "Finish 64 video", reminderIsOn: true, dueDate: Date.now + 60*60*24, notes: "Learning now", isCompleted: false))
		container.mainContext.insert(ToDo(item: "Finish 65 video", reminderIsOn: true, dueDate: Date.now + 60*60*24, notes: "Learning now", isCompleted: false))
		container.mainContext.insert(ToDo(item: "Finish 66 1 min only", reminderIsOn: true, dueDate: Date.now, isCompleted: false))
		container.mainContext.insert(ToDo(item: "Finish 67", reminderIsOn: true, dueDate: Date.now, isCompleted: false))
		
		return container
	}
}
