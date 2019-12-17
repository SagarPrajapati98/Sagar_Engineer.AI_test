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
    
    func getPosts(complition:@escaping(_ posts:Post) -> Void){
        RequestManger.share.requestwithget(url: API.getpostlist) { (success, posts, message) in
            if success{
                let allposts = try? JSONDecoder().decode(Post.self, from: posts)
                if let listpost = allposts{
                    complition(listpost)
                }
            }
        }
    }
}
