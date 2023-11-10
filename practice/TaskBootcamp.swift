//
//  TaskBootcamp.swift
//  practice
//
//  Created by loudi on 11/7/23.
//

import SwiftUI

class TaskBootcampViewModel : ObservableObject {
    
    @Published var image : UIImage? = nil
    @Published var image2 : UIImage? = nil

    
    
    func fetchImage() async {
        do {
            guard let url = URL(string: "https://picsum.photos/200") else {return}
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            self.image = UIImage(data: data)
        } catch {
            print(error.localizedDescription )
        }
    }
    func fetchImage2() async {
        do {
            guard let url = URL(string: "https://picsum.photos/200") else {return}
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            self.image2 = UIImage(data: data)
        } catch {
            print(error.localizedDescription )
        }
    }
}



struct TaskBootcamp: View {
    @StateObject var viewModel = TaskBootcampViewModel()
    var body: some View {
        VStack{
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100,height: 100)
            }
            if let image = viewModel.image2  {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100,height: 100)
            }
        }
        .onAppear{
            Task{
                await viewModel.fetchImage()
            }
            Task{
                await viewModel.fetchImage2()
            }
        }
    }
}

struct TaskBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TaskBootcamp()
    }
}
