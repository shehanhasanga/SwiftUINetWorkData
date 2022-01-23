//
//  PostData.swift
//  HackerNews
//
//  Created by shehan karunarathna on 2022-01-22.
//

import Foundation

struct ResultData:Decodable{
    let hits:[Post]
}

struct Post:Decodable, Identifiable{
    var id: String {
        return objectID
    }
    
    let points:Int
    let objectID:String
    let title:String
    let url:String?
    
    
}
