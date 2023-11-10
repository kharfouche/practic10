//
//  asyncData.swift
//  practice
//
//  Created by loudi on 11/7/23.
//

import SwiftUI

class ImageViewModel : ObservableObject {
    
  @Published var image : UIImage? = nil
    
    func changeData() async {
        
        do {
            guard let url = URL(string: "https://picsum.photos/200") else {return}
            let (data, _) = try await URLSession.shared.data(from: url ,delegate: nil)
            self.image = UIImage(data: data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
}

struct asyncData: View {
    @StateObject var viewModel = ImageViewModel()
    var body: some View {
        VStack{
            
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
            }
            
        }
        .task {
          await viewModel.changeData()
        }
    }
}

struct asyncData_Previews: PreviewProvider {
    static var previews: some View {
        asyncData()
    }
}
