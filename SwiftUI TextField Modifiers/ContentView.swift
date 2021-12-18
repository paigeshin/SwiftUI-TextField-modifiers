//
//  ContentView.swift
//  SwiftUI TextField Modifiers
//
//  Created by paige on 2021/12/19.
//

import SwiftUI

struct ContentView: View {
    
    @State var stateString: String = ""
    @State var emailString: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Text("Playing with TextField")
                .font(.largeTitle)
                .foregroundColor(.black)
            
            TextField("Place holder text", text: $stateString)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.init(top: 40, leading: 20, bottom: 100, trailing: 20))
            
            TextField("Enter an email address", text: $emailString, onEditingChanged: { status in
                print("Keyboard tapped status - \(status)")
                print(self.$emailString.wrappedValue)
            }) {
                print("The return key has been pressed")
            }
            .textContentType(.emailAddress)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .font(.subheadline)
            .fixedSize()
            .padding()
            
            SecureField("Enter your password", text: $password) {
                // on commit
                print("Returned pressed - done!")
            }
            .foregroundColor(.red)
            .frame(height: 40)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .border(.black, width: 0.4)
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
