//
//  DetailView.swift
//  ToDoList
//
//  Created by Emerald on 20/11/24.
//

import SwiftUI

struct DetailView: View {
	var passedValue: String // Don't initialize it - it will passed from the parent view
	@Environment(\.dismiss) private var dismiss
    var body: some View {
			VStack{
				Image(systemName: "swift")
					.resizable()
					.scaledToFit()
					.foregroundStyle(.orange)
					Text("You are Swifty Legend\n And you are passed over the value : \(passedValue)")
					.font(.largeTitle)
					.multilineTextAlignment(.center)
				Spacer()
				Button("Get Back!") {
					dismiss()
				}
			}.padding()
		}
}

#Preview {
	DetailView(passedValue: "")
}
