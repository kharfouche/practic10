//
//  resizebleSheetBootcamp.swift
//  practice
//
//  Created by loudi on 11/6/23.
//

import SwiftUI

struct resizebleSheetBootcamp: View {
    @State private var sheets : Bool = false
    var body: some View {
        VStack{
            Button {
                sheets.toggle()
            } label: {
                Text("Click me ")
            }
            .sheet(isPresented: $sheets) {
                secondView23()
                    .presentationDetents([.fraction(2/8)])
            }
        }
    }
}

struct resizebleSheetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        resizebleSheetBootcamp()
    }
}

struct secondView23 : View {
    var body: some View{
        Color.indigo.ignoresSafeArea()
    }
}
