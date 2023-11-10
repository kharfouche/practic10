//
//  ContentView.swift
//  practice
//
//  Created by loudi on 11/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var color1 = Color.red
    @State var number = 0
    
//
    var body: some View {
        ZStack {
            color1
                .ignoresSafeArea()
            VStack{
                Button {
                    color1 = Color.green
                } label: {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 100, height: 100)
                        .overlay {
                            Text("Click Me")
                                .foregroundColor(.white)
                        }
                }
                Text("\(number)")
                
                Button {
                    number += 1
                } label: {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 100, height: 100)
                        .overlay {
                            Text("Click Me now")
                                .foregroundColor(.white)
                        }
                }
          

                
                
                
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ContentView()
        }
    }
}
