//
//  SwiftUIView.swift
//  practice
//
//  Created by loudi on 11/3/23.
//

import SwiftUI


class BallPlayers : ObservableObject {
    
    struct player : Identifiable {
        let id = UUID().uuidString
        let name : String
        let pts : Int
        let ring : Bool
    }
    
   @Published var players : [player] = []
    
    func loadData5() {
        let player1 = player(name: "kobe", pts: 81, ring: true)
        let player2 = player(name: "melo", pts: 64, ring: false)
        let player3 = player(name: "RJ09", pts: 38, ring: false)
        
        players.append(player1)
        players.append(player2)
        players.append(player3)
    }
}




struct SwiftUIView: View {
    @StateObject var ballPlayers : BallPlayers = BallPlayers()
    var body: some View {
        VStack{
            List {
                ForEach(ballPlayers.players) { player in
                    HStack{
                        Text(player.name)
                        Spacer()
                        Text("Most Points : \(player.pts)")
                        Spacer()
                        Text("Ring?  " + player.ring.description)



                    }
                }
            }
        }
        .navigationTitle("Bsketball Players")
        .onAppear{
            ballPlayers.loadData5()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SwiftUIView()
        }
    }
}
