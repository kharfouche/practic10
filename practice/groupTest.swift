////
////  groupTest.swift
////  practice
////
////  Created by loudi on 11/9/23.
////
//
//
////"https://picsum.photos/200"
//
//import SwiftUI
//
//
//class task2Manger {
//    
//    
//    
//    
//    func groupTasks() async throws -> [UIImage] {
//        
//        let urlStrings = [
//            "https://picsum.photos/200",
//            "https://picsum.photos/200",
//            "https://picsum.photos/200",
//            "https://picsum.photos/200"
//        ]
//        
//        var images1 : [UIImage] = []
//        
//        return try await withThrowingTaskGroup(of: UIImage?.self) { group in
//            for urls in urlStrings {
//                group.addTask {
//                    try? await self.imageFetch(UrlString: urls)
//                }
//            }
//            
//            for try await image in group {
//                if let image2 = image {
//                    images1.append(contentsOf: image2)
//                }
//            }
//            return images1
//            
//        }
//    }
//    
//    
//    
//    func imageFetch(UrlString : String) async throws -> UIImage {
//        
//        guard let url = URL(string: UrlString) else {throw URLError(.badURL) }
//        do {
//            let (data,_) = try await URLSession.shared.data(from: url, delegate: nil)
//            if let image = UIImage(data: data) {
//                return image
//            } else {
//                throw URLError(.badURL)
//            }
//        } catch {
//            throw error
//        }
//    }
//}
//
//
//
//
//
//
//
//
//
//
//class group2Class : ObservableObject {
//    
//    @Published var image : [UIImage] = []
//    
//    let manger = task2Manger()
//    
//    
//    
//}
//
//struct groupTest: View {
//    @StateObject var viewModel = group2Class()
//    var body: some View {
//        VStack{
//            ForEach(viewModel.image, id: \.self) { image in
//                Image(uiImage: image)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 100, height: 100)
//            }
//        }
//    }
//}
//
//struct groupTest_Previews: PreviewProvider {
//    static var previews: some View {
//        groupTest()
//    }
//}
