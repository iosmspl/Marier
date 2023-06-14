//
//  LikeSuperLikeModel.swift
//  Marier
//
//  Created by MacBook M1 on 05/06/23.
//

import Foundation
 // like superlike dislike parame
struct likeParem: Encodable{
   let likeBy: String?
   let likeTo: String?
   let isLiked: Bool?
}
struct SuperlikeParem: Encodable{
   let likedBy: String?
   let likedTo: String?
   let isSuperLike: Bool?
}
struct DislikeParem: Encodable{
   let dislikeBy: String?
   let dislikeTo: String?
}

// like-by-other model

struct likesByOthers: Codable{
    let data: [LikeByOtherData]?
    let message: String?
    enum CodingKeys: String,CodingKey {
        case data = "data"
        case message = "message"
    }
}
struct LikeByOtherData: Codable{
    let likeTo: String?
    let isLiked: Bool?
    let likeBy: LikeBy?
    
}
struct LikeBy: Codable{
    let _id: String?
    let name: String?
    let sex: String?
    let avatar: String?
}
// dislikeby other model
struct dislikeByOthers: Codable{
    let data: [DisLikeByOtherData]?
    let message: String?
    enum CodingKeys: String,CodingKey {
        case data = "data"
        case message = "message"
    }
}
struct DisLikeByOtherData: Codable{
    let dislikeTo: String?
    let dislikeBy: DislikeBy?
    
}
struct DislikeBy: Codable{
    let _id: String?
    let name: String?
    let sex: String?
    let avatar: String?
}
