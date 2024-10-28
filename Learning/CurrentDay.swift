//
//  ContentView.swift
//  ttest
//
//  Created by Raghad Altalhi on 19/04/1446 AH.
//

//
//  CurrentDay.swift
//  Learning
//
//  Created by Raghad Altalhi on 18/04/1446 AH.
//

import SwiftUI
enum DayStatus {
    case none
    case learned
    case frozen
}

struct CurrentDay: View {
    // Define a state to track the status of the current day
    @State private var dayStatus: DayStatus = .none
    @State private var streakCount = 10 // Example data for streak
    @State private var freezeCount = 2 // Example data for frozen days
    @State private var maxFreezes = 6
    @State private var SelectedDay = Date() // For the current date
    @State private var selectedDay: Int? = 4 // Example selected day (4th day selected)
    @State private var frozenDays: [Int] = [6, 7] // Example frozen days
    @State private var streakDays: [Int] = [1, 2, 3] // Example streak days
    @State private var isLearned: Bool = false
    @State private var isFrozen: Bool = false
    // Track how many freezes are used
    @State private var freezesUsed: Int = 2
    let totalFreezes = 6

    
    
    var body: some View {
        NavigationView{
            VStack(spacing: 14) {
                
                Spacer()
                Spacer()
                // Top Section: Title and Flame Icon
                HStack {
                    VStack(alignment: .leading) {
                        Text(SelectedDay, style: .date)
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("Learning Swift")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                   .padding(.top, 50)
                    
                    NavigationLink(destination: UpdateGoal()){
                        Image("fire")
                            .resizable()
                            .frame(width: 55, height: 55)
                            .padding(.leading, 63)
                    }
                    .padding(.top, 50)
                }

                // Calendar-like custom view
                VStack(alignment: .center) {
                    // days
                    let days: [String] =
                    ["Sun", "Mon", "Tue","Wed", "Thu", "Fri", "Sat"]
                    HStack {
                        Text("September 2024")
                            .fontWeight(.bold)
                        Image(systemName: "chevron.right")
                            .foregroundColor(.orange)
                            .multilineTextAlignment(.leading)
                            .padding()
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.left")
                            .frame(width: 15, height: 24)
                            .foregroundColor(.orange)
                        Image(systemName: "chevron.right")
                            .frame(width: 15, height: 24)
                            .foregroundColor(.orange)
                    }
                    
                    .padding(.horizontal)
                    
                    // day view
                    
                    HStack(spacing: 0){
                        ForEach(days,id: \.self){ day in
                            Text(day)
                                .font(.callout)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    // Calendar days (dummy example)
                    VStack {
                        HStack(spacing: 10) {
                            ForEach(1...7, id: \.self) { day in
                                dayButton(day: day)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        
                    }
                    .padding(.horizontal)
                    Rectangle() // for design
                        .foregroundColor(.gray2)
                        .frame(height: 1)
                    
                    // Streak information
                    HStack {
                        VStack {
                            Text("\(streakCount)🔥")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.orange)
                                .padding(.leading, 40)
                            
                            HStack {
                                Text("Day streak")
                                    .foregroundColor(.gray)
                                    .padding(.leading, 40)
                            }
                        }
                        
                        Spacer()
                        Rectangle()
                            .frame(width: 1)
                            .padding(.horizontal, 9)
                            .foregroundColor(.gray2)
                        
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
                } .border(.gray2)
                    .cornerRadius(5)
                                    
                Spacer()
                
                
                // Large Circle Button to Log Day as Learned or Frozen
                Button(action: {
                    if dayStatus == .none {
                        dayStatus = .learned
                        streakCount += 1
                        if let selectedDay = selectedDay, !streakDays.contains(selectedDay) {
                                streakDays.append(selectedDay) // Add the current day to streakDays
                            }
                    }
                })  {
                        ZStack {
                            // Circle background
                            Circle()
                                .fill(dayStatus == .frozen ? Color.dblue : (dayStatus == .learned ? Color.brown1 : Color.orange))                  .frame(width: 300, height: 300)
                            
                            // Conditional Text based on isLearned state
                            Text(dayStatus == .frozen ? "Day freezed" : (dayStatus == .learned ? "Learned Today" : "Log today \nas Learned"))                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                        
                    }
                .padding(.bottom, 40)
                
                
                VStack{
                    // Freeze Day Button
                    Button(action: {
                        if dayStatus == .none && freezesUsed < totalFreezes {
                            dayStatus = .frozen
                            freezeCount += 1
                            freezesUsed += 1
                            if let selectedDay = selectedDay, !frozenDays.contains(selectedDay) {
                                frozenDays.append(selectedDay) // Add the current day to frozenDays
                            }
                            
                        }
                    }) {
                        Text("Freeze day")
                            .foregroundColor(.white)
                            .padding()
                            .background(freezesUsed < totalFreezes ? Color.blue : Color.gray)
                            .cornerRadius(10)
                            .frame(width: 162, height: 52)
                        
                    }
                    .disabled(freezesUsed >= totalFreezes)
                    
                    // Display freeze usage information
                    Text("\(freezesUsed) out of \(totalFreezes) freezes used")
                        .foregroundColor(.gray)
                    
                } .padding(.bottom, 100)
                
            }
            
        }  .navigationBarBackButtonHidden(true)
            .navigationBarBackButtonHidden(true)
    }
        
        
        struct LearningView_Previews: PreviewProvider {
            static var previews: some View {
                CurrentDay()
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
                .background(streakDays.contains(day) ? Color.orange :
                                (frozenDays.contains(day) ? Color.blue : Color.gray))                .foregroundColor(.white)
                .cornerRadius(20)
            
        }
    }
    
    // Function for creating the day buttons
    func freezeButton(day: Int) -> some View {
        Button(action: {
            freezesUsed = day
        }) {
            Text("\(day)")
                .padding()
                .frame(width: 40, height: 40)
                .background(freezesUsed < totalFreezes ? Color.dblue : Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
            
        }
    }
    
}

#Preview {
    CurrentDay()
}
