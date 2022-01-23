//
//  NetworkManager.swift
//  HackerNews
//
//  Created by shehan karunarathna on 2022-01-22.
//

import Foundation
import UIKit

class NetworkManager :ObservableObject{
    @Published var posts = [Post]()
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data , response, error in
                if(error == nil){
                    let decorder = JSONDecoder()
                    if let safeData = data{
                        do {
                            let results = try decorder.decode(ResultData.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            
                        } catch {
                            print("------------------------------")
                            print(error)
                        }
                      
                    }
                    
                } else{
                    
                }
            }
            task.resume()
        }
    }
}
