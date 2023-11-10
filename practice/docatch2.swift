//
//  docatch2.swift
//  practice
//
//  Created by loudi on 11/10/23.
//

import SwiftUI


class doManger {
    
    
    let isPub : Bool = false
    
    
    func do1() throws -> String {
        if isPub {
            return "new1"
        } else {
            throw URLError(.badServerResponse)
        }
    }
}




class doCatch : ObservableObject {
    @Published var text : String = "Old 1"
    
    let manger = doManger()
    
    func newText() {
        do {
            let newText2 = try manger.do1()
            self.text = newText2
        } catch {
            self.text = error.localizedDescription
        }
    }
    
}


struct docatch2: View {
    @StateObject var vm = doCatch()
    var body: some View {
        Text(vm.text)
            .frame(width: 100,height: 100)
            .background(Color.indigo)
            .onTapGesture {
                vm.newText()
            }
    }
}

struct docatch2_Previews: PreviewProvider {
    static var previews: some View {
        docatch2()
    }
}
