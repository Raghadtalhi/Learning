import SwiftUI

struct ContentView: View {
    @State private var selectedDuration = "Month"
    @State private var topic = ""
    @State private var text: String = ""
    
    
    
    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                
                // Flame Icon
                Image("fire")
                    .resizable()
                    .frame(width: 118, height: 118)
                    .foregroundColor(.orange)
                    .padding(.top, -250)
                
                // Welcome Text
                Text("Hello Learner!")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, -70)
                    .padding(.leading, -132)
                
                Text("This app will help you learn everyday")
                    .foregroundColor(.gray2)
                    .padding(.top, -40)
                    .padding(.leading, -76)
                
                
                // Topic Input
                VStack(alignment: .leading) {
                    Text("I want to learn")
                        .font(.headline)
                        .padding(.top, 1)
                    
                    // Borderless TextField
                    TextField("Swift", text: $text)
                        .padding(10)
                        .background(Color.clear) // No background, no border
                        .foregroundColor(.white)  // Text color
                        .font(.system(size: 16))  // Font size
                        .padding(.horizontal, -5)
                }
                .padding(.horizontal)
                
                // Duration Picker
                VStack(alignment: .leading) {
                    Text("I want to learn it in a")
                        .font(.headline)
                        .padding(.top, -2)
                        .padding(.leading, -40)
                    
                    HStack {
                        ForEach(["Week", "Month", "Year"], id: \.self) { duration in
                            Button(action: {
                                selectedDuration = duration
                            }) {
                                Text(duration)
                                    .foregroundColor(selectedDuration == duration ? .orange : .white)
                                    .padding()
                                    .frame(width: 90, height: 37)
                                    .background(
                                        selectedDuration == duration ? Color.orange.opacity(0.2) : Color.gray.opacity(0.2)
                                    )
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                VStack{
                    // Start Button
                    Button(action: {
                    }) {
                        NavigationLink(destination: CurrentDay()){
                            Text("Start ")
                                .foregroundColor(.black)
                                .frame(width: 151, height: 52)
                                .background(Color.orange)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.top, -200)
                 //   .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
            .foregroundColor(.white)
            
        }   .navigationBarBackButtonHidden(true)
    }
}
    
 /* struct LearningAppView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    } */

#Preview {
    ContentView()
}
