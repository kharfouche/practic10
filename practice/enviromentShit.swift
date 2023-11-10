//
//  enviromentShit.swift
//  practice
//
//  Created by loudi on 11/3/23.
//

import SwiftUI


class IphoneViewModel : ObservableObject {
    
    
    @Published var products : [String] = []
    
    init() {
    getData()
    }
    
    func getData() {
        self.products.append(contentsOf: ["iphone", "iMac","Ipad","Ipod"])
    }
    
}

struct enviromentShit: View {
    @StateObject var iphoneViewModel : IphoneViewModel = IphoneViewModel()
    var body: some View {
        NavigationStack{
            List {
                ForEach(iphoneViewModel.products, id: \.self) { item in
                    NavigationLink(item) {
                        middleView(name: item)
                    }
                }
            }
            .navigationTitle("title")
        }
        .environmentObject(iphoneViewModel)
    }
}

struct middleView: View {
    let name : String
    var body: some View {
        
        NavigationLink {
            endView()

        } label: {
            Capsule()
                .frame(width: 200, height: 100)
                .overlay {
                    Text(name)
                        .foregroundColor(.white)
                }
        }
        
    }
}

struct endView: View {
    @EnvironmentObject var iphoneViewModels : IphoneViewModel
    var body: some View {
        VStack{
            ForEach(iphoneViewModels.products, id: \.self) { item in
                Text(item)

            }
        }
    }
}



struct enviromentShit_Previews: PreviewProvider {
    static var previews: some View {
            enviromentShit()
    }
}
