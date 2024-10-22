//
//  CurrentDay.swift
//  Learning
//
//  Created by Raghad Altalhi on 18/04/1446 AH.
//

import SwiftUI

struct CurrentDay: View {
    @State private var streakCount = 10 // Example data for streak
    @State private var freezeCount = 2 // Example data for frozen days
    @State private var maxFreezes = 6
    @State private var selectedDate = Date() // For the current date
    @State private var selectedDay: Int? = 4 // Example selected day (4th day selected)
    @State private var frozenDays: [Int] = [6, 7] // Example frozen days
        @State private var streakDays: [Int] = [1, 2, 3] // Example streak days

    var body: some View {
        VStack(spacing: 30) {
            
            // Top Section: Title and Flame Icon
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(selectedDate, style: .date)
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("Learning Swift")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                Spacer()
                Image("fire")
                    .resizable()
                    .frame(width: 44, height: 44)
                    .foregroundColor(.orange)
            }
            .padding(.horizontal)
            
            // Calendar-like custom view
            VStack {
                HStack {
                    Text("September 2024")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.orange)
                }
                .padding(.horizontal)
                
                // Calendar days (dummy example)
                VStack {
                    HStack(spacing: 10) {
                        ForEach(1...7, id: \.self) { day in
                            dayButton(day: day)
                        }
                    }
                  
                }
                .padding(.horizontal)
                
                // Streak information
                HStack {
                    VStack {
                        Text("\(streakCount)🔥")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                        HStack {
                            Text("Day streak")
                                .foregroundColor(.gray)
                        }
                    }
                    Spacer()
                    VStack {
                        Text("\(freezeCount)🧊")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        HStack {
                            Text("Day freezed")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            // Log today button
            Button(action: {
                // Action for logging the day
                print("Logged as learned!")
            }) {
                Text("Log today\nas Learned")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .padding()
                    .frame(width: 320, height: 320)
                    .background(Color.orange)
                    .cornerRadius(180)
            }
            
            // Freeze day button
            Button(action: {
                // Action for freezing the day
                if freezeCount < maxFreezes {
                    freezeCount += 1
                }
            }) {
                Text("Freeze day")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding()
                    .frame(width: 162, height: 52)
                    .background(Color.blue.opacity(0.44))
                    .cornerRadius(10)
            }
            .padding(.horizontal, 40)
            
            // Freeze day info text
            Text("\(freezeCount) out of \(maxFreezes) freezes used")
                .foregroundColor(.gray)
            Spacer()
        }
    }
    
    // Function for creating the day buttons
    func dayButton(day: Int) -> some View {
        Button(action: {
            selectedDay = day
        }) {
            Text("\(day)")
                .padding()
                .frame(width: 40, height: 40)
                .background(selectedDay == day ? Color.orange : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(20)
        }
    }
}


#Preview {
    CurrentDay()
}
