//
//  try23.swift
//  practice
//
//  Created by loudi on 11/8/23.
//

import SwiftUI

struct try23: View {
    @State var image : [UIImage] = []
    let url = URL(string: "https://picsum.photos/200")
    var body: some View {
        VStack{
            ForEach(image, id: \.self) { image in
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100,height: 100)
            }
        }
        .task {
            do{
                async let fetchImage1 = image24()
                async let fetchImage2 = image24()
                
                let (image1,image2) = await (try fetchImage1, try fetchImage2)
                
                self.image.append(contentsOf: [image1,image2])
            } catch {
                
            }
        }
    }
    func image24() async throws -> UIImage {
        do {
            let (data, _) = try await URLSession.shared.data(from: url!, delegate: nil)
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

struct try23_Previews: PreviewProvider {
    static var previews: some View {
        try23()
    }
}

