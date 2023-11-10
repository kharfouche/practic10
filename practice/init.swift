//
//  init.swift
//  practice
//
//  Created by loudi on 11/3/23.
//

import SwiftUI

struct init2: View {
    
    let title : String
    let color : Color
    let num : Int
    
    init(fruit: Fruits, num: Int) {
        self.num = num
        
        if fruit == .apple {
            self.title = "apples"
            self.color = .red
        } else {
            self.title = "apples"
            self.color = .orange
        }
      
    }
    
    
    
    enum Fruits {
        case apple
        case orange
    }
    
    var body: some View {
       RoundedRectangle(cornerRadius: 25)
            .foregroundColor(color)
            .frame(width: 100, height: 100)
            .overlay {
                VStack(spacing: 12){
                    Text(title)
                        .foregroundColor(.white)
                    Text("\(num)")
                        .foregroundColor(.white)
                }
            }
    }
}

struct init_Previews: PreviewProvider {
    static var previews: some View {
        init2(fruit: .orange, num: 34)
    }
}
