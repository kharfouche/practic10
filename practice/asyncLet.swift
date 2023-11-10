//
//  asyncLet.swift
//  practice
//
//  Created by loudi on 11/7/23.
//

import SwiftUI

struct asyncLet: View {
    @State private var images : [UIImage] = []
    let colums = [GridItem(.flexible()), GridItem(.flexible())]
    let url = URL(string: "https://picsum.photos/200")
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVGrid(columns: colums) {
                    ForEach(images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 150)
                    }
                }
                .padding(30)
            }
            .navigationTitle("Apples 😜")
            .task {
                do {
                    async let fetchImage1 = fetchImages()
                    async let fetchImage2 = fetchImages()
                    
                    let (image1,image2) = await (try fetchImage1, try fetchImage2)
                    self.images.append(contentsOf: [image1, image2])

                } catch {
                    
                }
            }
        }
    }
    
    func fetchImages() async throws -> UIImage {
        do {
         let (data, _) =  try await URLSession.shared.data(from: url!, delegate: nil)
            if let image = UIImage(data: data){
                return image
            } else {
                throw URLError(.badURL)
            }
        } catch{
            throw error
        }
    }
}

struct asyncLet_Previews: PreviewProvider {
    static var previews: some View {
        asyncLet()
    }
}
