//
//  ContentView.swift
//  Learning
//
//  Created by Raghad Altalhi on 18/04/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var learningTopic: String = "" // TextField binding
    @State private var selectedDuration: String = "Month" // For the duration buttons
    
    var body: some View {
        VStack(spacing: 30) {
            // Fire Icon
            Image("fire")
                .resizable()
                .frame(width: 118, height: 118)
                .padding(.top, 35)
            
            VStack(alignment: .leading){
                // Greeting Text
                Text("Hello Learner!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                
                // Subtext
                Text("This app will help you learn everyday")
                    .foregroundColor(.gray)
            }
            

            // TextField for inputting learning topic
            VStack(alignment: .leading) {
                Text("I want to learn")
                    .font(.headline)
                    .foregroundColor(.white)
                
                TextField("Swift", text: $learningTopic)
                                   .padding()
                                   .background(Color.black)
                                   .border(.gray)
                                   .foregroundColor(.white)
                                   .accentColor(.orange)
            }
            .padding(.horizontal)
           
            
            VStack(alignment: .leading){
                // Duration Picker (Week, Month, Year)
                VStack(alignment: .leading) {
                    Text("I want to learn it in a")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    HStack {
                        DurationButton(title: "Week", isSelected: $selectedDuration)
                        DurationButton(title: "Month", isSelected: $selectedDuration)
                        DurationButton(title: "Year", isSelected: $selectedDuration)
                    }
                }
            }
            
            
            // Start Button
            Button(action: {
                // Handle start action here
                print("Learning \(learningTopic) in \(selectedDuration)")
            }) {
                Text("Start")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(width: 151, height: 52)
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            .padding(.bottom, 80)
        } 
    }
} 

// Custom Button for Duration Selection
struct DurationButton: View {
    var title: String
    @Binding var isSelected: String
    
    var body: some View {
        Button(action: {
            isSelected = title
        }) {
            Text(title)
                .font(.headline)
                .foregroundColor(isSelected == title ? .black : .white)
                .frame(width: 68, height: 37)
                .background(isSelected == title ? Color.orange : Color.gray)
                .cornerRadius(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
