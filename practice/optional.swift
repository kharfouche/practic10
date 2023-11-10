//
//  optional.swift
//  practice
//
//  Created by loudi on 11/2/23.
//

import SwiftUI

struct optional: View {
    @State var ids : String? = " "
    @State var text2 : String? = nil
    @State var isLoading : Bool = false
    var body: some View {
        VStack{
            Text("we are practing safe code")
            
            if let text1 = text2 {
                Text(text1)
                    .font(.largeTitle)
    
            }
            if isLoading {
                ProgressView()
            }
            
                        
            
            Spacer()
        }
        .navigationTitle("Safe coding")
        .onAppear{
            loadData2()
        }
    }
    func loadData() {
        
        if let isId = ids {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3 ) {
                text2 = "this is new data  \(isId)"
                isLoading = false
            }
        } else {
            text2 = "No ID Was Found"
        }
        
      
    }
    
    func loadData2() {
        guard let userId = ids else {
            text2 = "No ID Was Found"
            return
        }
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3 ) {
            text2 = "this is new data  \(userId)"
            isLoading = false
        }
        
        
    }
}

struct optional_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            optional()
        }
    }
}
