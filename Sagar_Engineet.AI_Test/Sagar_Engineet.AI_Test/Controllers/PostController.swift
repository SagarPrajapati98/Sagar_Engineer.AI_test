//
//  PostController.swift
//  Sagar_Engineet.AI_Test
//
//  Created by pcq196 on 17/12/19.
//  Copyright © 2019 pcq196. All rights reserved.
//

import Foundation

final class PostController{
    
    static let share:PostController = PostController()
    
    func getPosts(pagenumber:Int,complition:@escaping(_ posts:Post) -> Void){
        RequestManger.share.requestwithget(url: API.getPostList+"\(pagenumber)") { (success, posts, message) in
            if success{
                let allPosts = try? JSONDecoder().decode(Post.self, from: posts)
                if let listPost = allPosts{
                    complition(listPost)
                }
            }
        }
    }
}
