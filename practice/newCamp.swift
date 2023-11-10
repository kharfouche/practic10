//
//  newCamp.swift
//  practice
//
//  Created by loudi on 11/6/23.
//

import SwiftUI

struct newCamp: View {
    @State var offset : CGSize = .zero
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(width: 100,height: 100)
            .offset(offset)
            .gesture(
            DragGesture()
                .onChanged{ value in
                    withAnimation(.spring()) {
                        offset = value.translation
                    }
                }
                .onEnded{ value in
                    withAnimation(.spring()){
                        offset = .zero
                    }
                }
            )
    }
}

struct newCamp_Previews: PreviewProvider {
    static var previews: some View {
        newCamp()
    }
}

struct newCamp2: View {
    @State var name : String
    var body: some View {
        Text(name)
    }
}
