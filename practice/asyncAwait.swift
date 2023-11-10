//
//  asyncAwait.swift
//  practice
//
//  Created by loudi on 11/7/23.
//

import SwiftUI

class DownloadImageAsyncImageLoader {

}



class asyncAwaitBootcamp : ObservableObject {
    @Published var dataArray : [String] = []
    

    
    
    func getAuther1() async {
        let auther1 = "Auther1 : \(Thread.current)"
        self.dataArray.append(auther1)
        
        
       try? await Task.sleep(nanoseconds: 2_000_000_000)
        let auther2 = "Auther2 : \(Thread.current)"
        self.dataArray.append(auther2)
        
        await MainActor.run(body: {
            self.dataArray.append(auther2)
        })
    }
    
    
    
    
}



struct asyncAwait: View {
    @StateObject private var viewmodel = asyncAwaitBootcamp()
    var body: some View {
        List{
            ForEach(viewmodel.dataArray, id: \.self) { data in
                Text(data)
                Text("aa")
            }
        }
        .onAppear{
            Task{
               await viewmodel.getAuther1()
            }
//            viewmodel.addTitle1()
//            viewmodel.addTitle2()
        }
    }
}

struct asyncAwait_Previews: PreviewProvider {
    static var previews: some View {
        asyncAwait()
    }
}
