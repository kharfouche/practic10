//
//  Toolbarsss.swift
//  practice
//
//  Created by loudi on 11/6/23.
//

import SwiftUI

struct Toolbarsss: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color.indigo.ignoresSafeArea()
                Text("Hello it's me ")
                    .foregroundColor(.white)
            }
            .navigationTitle("Toolbar")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.white)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "gear")
                }
            }
//            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

struct Toolbarsss_Previews: PreviewProvider {
    static var previews: some View {
        Toolbarsss()
    }
}
