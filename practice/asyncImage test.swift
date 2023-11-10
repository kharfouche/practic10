//
//  asyncImage test.swift
//  practice
//
//  Created by loudi on 11/10/23.
//

import SwiftUI

class AsyncManger {

    
    func getImage() async {
        
    }
    

}




class Asyncstuff : ObservableObject {
    
    @Published var image : UIImage? = nil
    
    let manger = AsyncManger()
    
    
}

struct asyncImage_test: View {
    @StateObject var vm = Asyncstuff()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct asyncImage_test_Previews: PreviewProvider {
    static var previews: some View {
        asyncImage_test()
    }
}
