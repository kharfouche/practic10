//
//  test100000.swift
//  practice
//
//  Created by loudi on 11/8/23.
//

import SwiftUI


class nbaMnager {
    
    var isBool : Bool = false
    
    
    func nbaCheck() throws -> String {
        if isBool {
            return "New Nba String"
        } else {
            throw URLError(.badURL)
        }
    }
    
    
}


class Nba: ObservableObject {
    
    @Published var text : String = "NO DAtA yets"
    
    let manager = nbaMnager()
    
    
    func check() {
        
        do {
            let newTitle = try manager.nbaCheck()
            self.text = newTitle
        } catch {
            self.text = error.localizedDescription
        }
    }
}




struct test100000: View {
    @StateObject var vm = Nba()
    var body: some View {
        
        VStack{
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.indigo)
                .frame(width: 200, height: 200)
                .overlay {
                    Text(vm.text)
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    vm.check()
                }
        }
    }
}

struct test100000_Previews: PreviewProvider {
    static var previews: some View {
        test100000()
    }
}
