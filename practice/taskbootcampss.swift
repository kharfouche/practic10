//
//  taskbootcampss.swift
//  practice
//
//  Created by loudi on 11/8/23.
//

import SwiftUI

class GroupTaskManager {
   
    
    
    func fetchImages(urlString : String) async throws -> UIImage {
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        do {
         let (data, _) =  try await URLSession.shared.data(from: url, delegate: nil)
            if let image = UIImage(data: data){
                return image
            } else {
                throw URLError(.badURL)
            }
        } catch{
            throw error
        }
    }
    
    func taskgroupfr() async throws -> [UIImage] {
    return  try await withThrowingTaskGroup(of: UIImage.self) { group in
           
        var images : [UIImage] = []
        
//        group.addTask {
//            
//        }
        
        
        return images
        }
    }

}



class TaskViewModdel : ObservableObject {
    @Published  var images : [UIImage] = []
    
    
  
}

struct taskbootcampss: View {
    @StateObject var viewModel = TaskViewModdel()
    let colums = [GridItem(.flexible()), GridItem(.flexible())]
    let url = URL(string: "https://picsum.photos/200")
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVGrid(columns: colums) {
                    ForEach(viewModel.images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 150)
                    }
                }
                .padding(30)
            }
            .navigationTitle("task group")
        }
    }
}

struct taskbootcampss_Previews: PreviewProvider {
    static var previews: some View {
        taskbootcampss()
    }
}
