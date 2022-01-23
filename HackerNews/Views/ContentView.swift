//
//  ContentView.swift
//  HackerNews
//
//  Created by shehan karunarathna on 2022-01-22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView{
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailsView(url: post.url)) {
                    HStack{
                        Text(String(post.points))
                        Text(post.title).frame( alignment: .center)
                    }
                }
                
                
            }
           
            
                .navigationBarTitle("Hacker News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



