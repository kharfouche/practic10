//
//  DoCatchTry.swift
//  practice
//
//  Created by loudi on 11/6/23.
//

import SwiftUI

class DoCatchTryViewModel222 {
    
    let isActive: Bool = true
    
    func getTitle3() throws -> String {
        if isActive{
            return "New Title boiii"
        } else {
            throw URLError(.badServerResponse)
        }
    }
}

class DoCatchTryViewModel : ObservableObject {
    
    @Published var text : String = "Hello my name is loudi"
    let manger = DoCatchTryViewModel222()
    
    
    
    func fetchTitle() {
        do {
            let result = try manger.getTitle3()
            self.text = result
        }
        catch {
            self.text = error.localizedDescription
        }
        
        
        
        if let result = try? manger.getTitle3() {
            self.text = result
        }
        
        
        
        
        
    }
}



struct DoCatchTry: View {
    @StateObject var viewModel = DoCatchTryViewModel()
    var body: some View {
        Text(viewModel.text)
            .foregroundColor(.white)
            .frame(width: 300, height: 300)
            .background(Color.indigo)
            .onTapGesture {
                viewModel.fetchTitle()
  
            }
    }
}

struct DoCatchTry_Previews: PreviewProvider {
    static var previews: some View {
        DoCatchTry()
    }
}
