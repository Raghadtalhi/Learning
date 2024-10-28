//
//  tesst2.swift
//  ttest
//
//  Created by Raghad Altalhi on 20/04/1446 AH.
//

import SwiftUI

struct UpdateGoal: View {
    @State private var learningGoal: String = "Swift"
    @State private var selectedDuration: String = "Month"
    @State private var text: String = ""
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                // Navigation bar elements
                HStack {
                    Button(action: {
                        // Back action
                    }) {
                        NavigationLink(destination: CurrentDay()){
                          Image(systemName: "chevron.left")
                                .foregroundColor(.orange)
                            Text("Back")
                                .foregroundColor(.orange)
                        }
                    }
                    
                    Spacer()
                    Text("Learning goal")
                        .font(.title2)
                        .bold()
                    Spacer()
                    
                        Button(action: {
                            // Update action
                        }) {
                            NavigationLink(destination: CurrentDay()){
                                Text("Update")
                                    .foregroundColor(.orange)
                            }
                        }
                }
                .padding()
                
                // Learning goal input section
                VStack(alignment: .leading, spacing: 16) {
                    Text("I want to learn")
                        .font(.headline)
                    
                    // Borderless TextField
                    TextField("Swift", text: $text)
                        .padding(10)
                        .background(Color.clear) // No background, no border
                        .foregroundColor(.white)  // Text color
                        .font(.system(size: 18))  // Font size
                        .padding(.horizontal)
                    
                    Text("I want to learn it in a")
                        .font(.headline)
                    
                    // Duration selection buttons
                    HStack {
                        DurationButton(title: "Week", selectedDuration: $selectedDuration)
                        DurationButton(title: "Month", selectedDuration: $selectedDuration)
                        DurationButton(title: "Year", selectedDuration: $selectedDuration)
                    }
                }
                .padding()
                
                Spacer()
            }
            
        }  .navigationBarBackButtonHidden(true)
    }
    
    // Button component for duration selection
    struct DurationButton: View {
        var title: String
        @Binding var selectedDuration: String
        
        var body: some View {
            Button(action: {
                selectedDuration = title
            }) {
                Text(title)
                    .padding()
                    .background(selectedDuration == title ? Color.orange : Color(UIColor.systemGray6))
                    .foregroundColor(selectedDuration == title ? .white : .black)
                    .cornerRadius(8)
            }
        }
    }
}

        struct LearningGoalView_Previews: PreviewProvider {
            static var previews: some View {
                UpdateGoal()
            }    }


#Preview {
    UpdateGoal()
}
