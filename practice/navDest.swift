//
//  navDest.swift
//  practice
//
//  Created by loudi on 11/5/23.
//

import SwiftUI

struct navDest: View {
    var body: some View {
        NavigationStack{
            VStack{
                
                ForEach(0..<10) { x in
                    NavigationLink(value: x) {
                        Text("apple \(x)")
                        
                    }
                }
            }
            .navigationDestination(for: Int.self) { item in
                secondView(names: item)
            }
    }
}

struct navDest_Previews: PreviewProvider {
    static var previews: some View {
        navDest()
    }
}

    struct secondView : View {
        @State var names : Int
        var body: some View{
            Text("\(names)")
        }
    }
}
