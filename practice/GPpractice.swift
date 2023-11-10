//
//  GPpractice.swift
//  practice
//
//  Created by loudi on 11/2/23.
//

import SwiftUI



struct GPpractice: View {
    
    let num : Int
    let color : Color
    let title: String
    
    init(num: Int, fruit: Fruits3) {
        self.num = num
//        self.color = color
//        self.title = title
        
        if fruit == .apple {
            self.title = "Apple"
            self.color = .red
        } else {
            self.color = .orange
            self.title = "orange"
        }
    }
   
    
//    init(let fruit2 = Fruits3 )
    
    enum Fruits3 {
        case apple
        case orange
    }

    
    var body: some View {
        ZStack{
//            Color.purple
//                .ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.red)
                .frame(width: 100,height: 100)
                .overlay {
                    VStack{
                        Text("apples")
                        Text("\(num)")

                        
                    }
                }
            
        }
    }
}

struct GPpractice_Previews: PreviewProvider {
    static var previews: some View {
        GPpractice(num: 55, fruit: .apple)
    }
}










