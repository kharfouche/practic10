//
//  test10.swift
//  practice
//
//  Created by loudi on 11/5/23.
//

import SwiftUI


class CarViewModel: ObservableObject {
    
    struct Cars : Identifiable {
        let id = UUID().uuidString
        let make : String
        let model : String
        let year : Int
    }
    
    @Published var carLot : [Cars] = []
    
    init() {
        uploadData()
    }
    
    func uploadData() {
        
        let mustang = Cars(make: "Ford", model: "Mustang", year: 2015)
        let bmw = Cars(make: "bmw", model: "m3", year: 2009)
        let jeep = Cars(make: "jeep", model: "wrangler", year: 2014)

        carLot.append(contentsOf: [mustang,bmw,jeep])
        
    }
}




struct test10: View {
    @StateObject var carViewModel : CarViewModel = CarViewModel()
    var body: some View {
        NavigationStack{
            List {
                ForEach(carViewModel.carLot) { item in
                    NavigationLink {
                        test11(blue: item.model)
                    } label: {
                        Text(item.make)
                    }
                }
            }
        }
        .environmentObject(carViewModel)
    }
}

struct test10_Previews: PreviewProvider {
    static var previews: some View {
        test10()
    }
}


struct test11: View {
    @State var blue : String
    @EnvironmentObject var carViewModel : CarViewModel
    var body: some View{
        VStack{
                                Text(blue)

//            ForEach(carViewModel.carLot) { item in
//                VStack{
//                    Text(blue)
//                    Text(item.model)
//                }
//            }
        }
    }
}
