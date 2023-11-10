//
//  testinga.swift
//  practice
//
//  Created by loudi on 11/6/23.
//

import SwiftUI


class nhlManager {
    
    var isPublised : Bool = true
    
    func loadData() throws -> String {
        
        if isPublised {
            return "Kiwis"
        } else {
            throw URLError(.badURL)
        }
    }
    
}



class nhlViewModel : ObservableObject {
    
    @Published var text = "apples"
    
    let manager = nhlManager()
    
    
    func getData() {
        
        
     let result = try? manager.loadData()
        
        if let result {
            self.text = result
        }
        
//        do {
//            self.text = try manager.loadData()
//        } catch {
//            self.text = URLError(.badURL).localizedDescription
//        }
        
    }
   
}

struct testinga: View {
    @StateObject var viewModel = nhlViewModel()
    var body: some View {
        Text(viewModel.text)
            .frame(width: 100,height: 100)
            .background(Color.indigo)
            .onTapGesture {
                viewModel.getData()
            }
    }
}

struct testinga_Previews: PreviewProvider {
    static var previews: some View {
        testinga()
    }
}
