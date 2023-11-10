//
//  let try .swift
//  practice
//
//  Created by loudi on 11/8/23.
//

import SwiftUI

struct let_try_: View {
    @State private var images : [UIImage] = []
    let url = URL(string: "https://picsum.photos/200")
    var body: some View {
        NavigationStack{
            VStack{
                
                ForEach(images, id: \.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                }
                                   
            }
            .task {
                do{
                    async let asyncFunc1 = asyncCall()
                    async let asyncFunc2 = asyncCall()
                    
                    let (image1 , image4) = await (try asyncFunc1,try asyncFunc2)
                    self.images.append(contentsOf: [image1,image4])
                } catch{
                    
                }
//                asyncLet(image1 , image4) = (asyncFunc1,asyncFunc2)
//                images.append(image1 ?? Image(systemName: "Heart.fill"))
            }
        }
    }
    func asyncCall() async throws -> UIImage {
        do {
            let (data, _) = try await URLSession.shared.data(from: url!, delegate: nil)
            if let image = UIImage(data: data){
                return image
            } else {
                throw URLError(.badURL)
            }
            } catch {
                throw error
        }
    }
}

struct let_try__Previews: PreviewProvider {
    static var previews: some View {
        let_try_()
    }
}

