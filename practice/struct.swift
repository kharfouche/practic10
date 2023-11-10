//
//  struct.swift
//  practice
//
//  Created by loudi on 11/2/23.
//

import SwiftUI


class UserViewModel: ObservableObject {
    var users : [user] = []
    
    func userLoad() {
       let user1 = user(namr: "lou", username: "@Lou", followers: 55)
       let user2 = user(namr: "lou2", username: "@Lou2", followers: 555)
       let user3 =  user(namr: "lou3", username: "@Lou3", followers: 555)
        
        users.append(user1)
        users.append(user2)
        users.append(user3)

        
    }
}




struct user : Identifiable {
    let id = UUID().uuidString
    let namr : String
    let username : String
    let followers : Int
}

struct struct2: View {
    //Use @StateObject first time then use @ObservedObject
   @StateObject var userViewModel : UserViewModel = UserViewModel()
    
    var body: some View {
        List{
            ForEach(userViewModel.users  ) { user in
                HStack{
                    Text(user.namr)
                    Text(user.username)
                    Spacer()
                    Text("\(user.followers)")
                }
            }
        }
        .onAppear{
            userViewModel.userLoad()
        }
    }
}

struct struct2_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            struct2()
        }
    }
}
