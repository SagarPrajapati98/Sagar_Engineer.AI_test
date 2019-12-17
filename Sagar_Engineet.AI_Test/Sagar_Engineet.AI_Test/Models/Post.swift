//
//  Post.swift
//  Sagar_Engineet.AI_Test
//
//  Created by pcq196 on 17/12/19.
//  Copyright © 2019 pcq196. All rights reserved.
//

import Foundation
class _highlightResult : Codable {
    let title : Title?
    let url : Url?
    let author : Author?
    
    enum CodingKeys: String, CodingKey {
        
        case title = "title"
        case url = "url"
        case author = "author"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(Title.self, forKey: .title)
        url = try values.decodeIfPresent(Url.self, forKey: .url)
        author = try values.decodeIfPresent(Author.self, forKey: .author)
    }
    
}
class Author : Codable {
    let value : String?
    let matchLevel : String?
    let matchedWords : [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case value = "value"
        case matchLevel = "matchLevel"
        case matchedWords = "matchedWords"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        value = try values.decodeIfPresent(String.self, forKey: .value)
        matchLevel = try values.decodeIfPresent(String.self, forKey: .matchLevel)
        matchedWords = try values.decodeIfPresent([String].self, forKey: .matchedWords)
    }
    
}
class Hits : Codable {
    let created_at : String?
    let title : String?
    let url : String?
    let author : String?
    let points : Int?
    let story_text : String?
    let comment_text : String?
    let num_comments : Int?
    let story_id : String?
    let story_title : String?
    let story_url : String?
    let parent_id : String?
    let created_at_i : Int?
    let _tags : [String]?
    let objectID : String?
    let highlightResult : _highlightResult?
    var isActive:Bool = false;
    enum CodingKeys: String, CodingKey {
        
        case created_at = "created_at"
        case title = "title"
        case url = "url"
        case author = "author"
        case points = "points"
        case story_text = "story_text"
        case comment_text = "comment_text"
        case num_comments = "num_comments"
        case story_id = "story_id"
        case story_title = "story_title"
        case story_url = "story_url"
        case parent_id = "parent_id"
        case created_at_i = "created_at_i"
        case _tags = "_tags"
        case objectID = "objectID"
        case highlightResult = "_highlightResult"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        points = try values.decodeIfPresent(Int.self, forKey: .points)
        story_text = try values.decodeIfPresent(String.self, forKey: .story_text)
        comment_text = try values.decodeIfPresent(String.self, forKey: .comment_text)
        num_comments = try values.decodeIfPresent(Int.self, forKey: .num_comments)
        story_id = try values.decodeIfPresent(String.self, forKey: .story_id)
        story_title = try values.decodeIfPresent(String.self, forKey: .story_title)
        story_url = try values.decodeIfPresent(String.self, forKey: .story_url)
        parent_id = try values.decodeIfPresent(String.self, forKey: .parent_id)
        created_at_i = try values.decodeIfPresent(Int.self, forKey: .created_at_i)
        _tags = try values.decodeIfPresent([String].self, forKey: ._tags)
        objectID = try values.decodeIfPresent(String.self, forKey: .objectID)
        highlightResult = try values.decodeIfPresent(_highlightResult.self, forKey: .highlightResult)
    }
    
}

class Post : Codable {
    let hits : [Hits]?
    let nbHits : Int?
    let page : Int?
    let nbPages : Int?
    let hitsPerPage : Int?
    let exhaustiveNbHits : Bool?
    let query : String?
    let params : String?
    let processingTimeMS : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case hits = "hits"
        case nbHits = "nbHits"
        case page = "page"
        case nbPages = "nbPages"
        case hitsPerPage = "hitsPerPage"
        case exhaustiveNbHits = "exhaustiveNbHits"
        case query = "query"
        case params = "params"
        case processingTimeMS = "processingTimeMS"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        hits = try values.decodeIfPresent([Hits].self, forKey: .hits)
        nbHits = try values.decodeIfPresent(Int.self, forKey: .nbHits)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        nbPages = try values.decodeIfPresent(Int.self, forKey: .nbPages)
        hitsPerPage = try values.decodeIfPresent(Int.self, forKey: .hitsPerPage)
        exhaustiveNbHits = try values.decodeIfPresent(Bool.self, forKey: .exhaustiveNbHits)
        query = try values.decodeIfPresent(String.self, forKey: .query)
        params = try values.decodeIfPresent(String.self, forKey: .params)
        processingTimeMS = try values.decodeIfPresent(Int.self, forKey: .processingTimeMS)
    }
    
}

class Title : Codable {
    let value : String?
    let matchLevel : String?
    let matchedWords : [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case value = "value"
        case matchLevel = "matchLevel"
        case matchedWords = "matchedWords"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        value = try values.decodeIfPresent(String.self, forKey: .value)
        matchLevel = try values.decodeIfPresent(String.self, forKey: .matchLevel)
        matchedWords = try values.decodeIfPresent([String].self, forKey: .matchedWords)
    }
    
}

class Url : Codable {
    let value : String?
    let matchLevel : String?
    let matchedWords : [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case value = "value"
        case matchLevel = "matchLevel"
        case matchedWords = "matchedWords"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        value = try values.decodeIfPresent(String.self, forKey: .value)
        matchLevel = try values.decodeIfPresent(String.self, forKey: .matchLevel)
        matchedWords = try values.decodeIfPresent([String].self, forKey: .matchedWords)
    }
    
}
