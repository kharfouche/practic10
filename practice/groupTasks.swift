//
//  groupTasks.swift
//  practice
//
//  Created by loudi on 11/9/23.
//

import SwiftUI

class groupManager {
    
    
    func fetchImageWithAsyncLet() async throws -> [UIImage] {
        do {
            async let fetch1 = imageFunc(urlString: "https://picsum.photos/200")
            async let fetch2 = imageFunc(urlString: "https://picsum.photos/200")
            async let fetch3 = imageFunc(urlString: "https://picsum.photos/200")
            
            let (image1, image2, image3) = await (try fetch1,try fetch2,try fetch3)
            
            return [image1,image2,image3]
        } catch {
            throw error
        }
    }
    
    
    func fetchImageWithTaskGroup() async throws -> [UIImage] {
        
        let urlStrings = [
            "https://picsum.photos/200",
            "https://picsum.photos/200",
            "https://picsum.photos/200",
            "https://picsum.photos/200",
            "https://picsum.photos/200",
            "https://picsum.photos/200" ]
        
        return try await withThrowingTaskGroup(of: UIImage?.self) { group in
            var images : [UIImage] = []
            
//            ForEach(urlStrings, id: \.self) { url in
            
            for urlStrings in urlStrings {
                group.addTask {
                    try? await self.imageFunc(urlString: urlStrings)
                }
            }
            
            
            
//
            
            for try await image in group {
                if let image = image {
                    images.append(image )
                }
            }
            
            return images
        }
        
        
        
    }
    
    func imageFunc(urlString : String) async throws -> UIImage {
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        do {
            let (data,_) = try await URLSession.shared.data(from: url, delegate: nil)
            if let image = UIImage(data: data) {
               return image
            } else {
                throw URLError(.badURL)
            }
        } catch {
            throw error
        }
    }
}

class group : ObservableObject {
    
  @Published var images : [UIImage] = []
    
    let manger = groupManager()
    
    func getImages() async  {
        if let image = try? await manger.fetchImageWithTaskGroup() {
            self.images.append(contentsOf: image)
        }
    }
}

struct groupTasks: View {
    @StateObject var vm = group()
    var body: some View {
        VStack{
            ForEach(vm.images, id: \.self) { image in
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
            }
        }
        .task {
            await vm.getImages()
        }
    }
}

struct groupTasks_Previews: PreviewProvider {
    static var previews: some View {
        groupTasks()
    }
}
