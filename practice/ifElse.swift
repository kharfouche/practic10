//
//  ifElse.swift
//  practice
//
//  Created by loudi on 11/2/23.
//

import SwiftUI

struct ifElse: View {
    @State var circle2 : Bool = false
    @State var circle3 : Bool = false
    @State var color9 : Bool = false


    var body: some View {
        VStack {
            Spacer()
            
            Button {
                color9.toggle()
            } label: {
                Text("color is \(color9.description)")
            }

            RoundedRectangle(cornerRadius: 25)
                .frame(width: color9 ? 200 : 100, height: 100)
                .foregroundColor(color9 ? .yellow : .red)
            
            if circle2 {
                Circle()
                    .frame(width: 100 , height: 100)
            }
            
            if circle3{
                Rectangle()
                    .frame(width: 100 , height: 100)
            }
            
            if circle2 && circle3 {
                Rectangle()
                    .frame(width: 200 , height: 200)
            }
            
            Button {
                circle2.toggle()
            } label: {
                Text("Circle is \(circle2.description)")
                
            }
            
            Button {
                circle3.toggle()
            } label: {
                Text("rectangle is \(circle3.description)")
                
            }

        }
        
    }
}

struct ifElse_Previews: PreviewProvider {
    static var previews: some View {
        ifElse()
    }
}
