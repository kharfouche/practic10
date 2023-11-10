//
//  test100.swift
//  practice
//
//  Created by loudi on 11/6/23.
//

import SwiftUI


class NFLManger {
    
    var isPresented : Bool = true
    
    func loadNfl() throws -> String {
        if isPresented {
            return "new Fucking SHit"
        } else {
            throw URLError(.badURL)
        }
    }
}





class NfLViewModel : ObservableObject {
    
    @Published var nfltext : String = "NFL players"
    
    let manger = NFLManger()
    
    func callNfl() {
        
        do {
            let result = try manger.loadNfl()
            self.nfltext = result
        } catch {
            self.nfltext = error.localizedDescription
        }
    }
    
    func callNfl2() {
        
        let result = try? manger.loadNfl()
        
        if let result {
            self.nfltext = result
        }
    }
}

struct test100: View {
    @StateObject var viewModel = NfLViewModel()
    var body: some View {
        Text(viewModel.nfltext)
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(width: 300, height: 300)
            .background(Color.indigo)
            .cornerRadius(25)
            .onTapGesture {
                viewModel.callNfl2()
            }
    }
}

struct test100_Previews: PreviewProvider {
    static var previews: some View {
        test100()
    }
}
