//
//  safeAreaButton.swift
//  practice
//
//  Created by loudi on 11/6/23.
//

import SwiftUI

struct safeAreaButton: View {
    var body: some View {
        NavigationStack{
            ZStack{
                    Color.indigo.ignoresSafeArea()
                
//                Menu("Hello", content: {
//                    Button("one") {
//
//                    }
//                    Button("two") {
//
//                    }
//                    Button("three") {
//
//                    }
//                }).foregroundColor(.white)
                
                    .safeAreaInset(edge: .bottom, alignment: .trailing, spacing: nil) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.yellow)
                            .clipShape(Circle())
                            .padding()
                    }
            }
        }
    }
}

struct safeAreaButton_Previews: PreviewProvider {
    static var previews: some View {
        safeAreaButton()
    }
}
