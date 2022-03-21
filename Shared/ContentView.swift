//
//  ContentView.swift
//  Shared
//
//  Created by Jacob on 3/19/22.
//

import SwiftUI

struct ContentView: View {
    let defaults = UserDefaults.standard
    @State var toDoMsg: [String]
    @State var input: String = ""
    
    init()
    {
        toDoMsg = defaults.object(forKey: "toDoMsg") as? [String] ?? []
    }
    
    var body: some View {
        ZStack (alignment: .topTrailing) {
            HStack {
                Spacer()
                VStack {
                    Text("To Do List")
                        .font(.title)
                        .padding()
                    
                    VStack
                    {
                            ForEach(toDoMsg, id: \.self)
                            {
                                tempString in
                                //Text(tempString)
                                let tempBool: Bool? = defaults.bool(forKey: tempString)
                                
                                HStack {
                                    listElement(msg: tempString, isFilled: tempBool ?? false)
                                    Spacer()
                                }
                        }
                        
                        HStack
                        {
                            //input
                            TextField("Input Reminder", text: $input)
                            //button to submit
                            
                            Button(action: {
                                //pop up alert and add to array
                                toDoMsg.append(input)
                                defaults.set(toDoMsg, forKey: "toDoMsg")
                                input = ""
                            } )
                            {
                                Image(systemName: "plus")
                            }
                            
                        }
                    }
                    
                    Spacer()
                }
                Spacer()
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
