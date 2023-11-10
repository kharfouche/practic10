//
//  lastOne.swift
//  practice
//
//  Created by loudi on 11/8/23.
//

import SwiftUI

struct lastOne: View {
    let url = URL(string: "https://picsum.photos/200")
    @State var image34 : [UIImage] = []
    var body: some View {
        VStack{
            ForEach(image34, id: \.self) { image in
                Image(uiImage: image)
            }
        }
        .task {
            do {
                async let fetch1 = imageFunc()
                async let fetch2 = imageFunc()
                
                let (image1, image2) = await (try fetch1,try fetch2)
                
                self.image34.append(contentsOf: [image1,image2])
            } catch {
                
            }

        }
    }
    func imageFunc() async throws -> UIImage {
        do {
            let (data,_) = try await URLSession.shared.data(from: url!, delegate: nil)
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

struct lastOne_Previews: PreviewProvider {
    static var previews: some View {
        lastOne()
    }
}
