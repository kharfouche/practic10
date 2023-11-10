//
//  binding.swift
//  practice
//
//  Created by loudi on 11/2/23.
//

import SwiftUI

struct binding: View {
    @State var color1 = Color.red
    @State var num = 0
    var body: some View {
        ZStack{
            color1
                .ignoresSafeArea()
            VStack{
                Text("\(num)")
                .foregroundColor(.white)
                binding2(color1: $color1, num: $num)
            }
        }
        
    }
}

struct binding2: View {
    @Binding var color1 : Color
    @Binding var num : Int
    var body: some View {
            VStack{
                Button {
                    color1 = Color.green
                    num += 1
                } label: {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 50, height: 50)
                        .overlay {
                            Text("add")
                                .foregroundColor(.white)
                        }
                }
        }
    }
}



struct binding_Previews: PreviewProvider {
    static var previews: some View {
        binding()
    }
}
