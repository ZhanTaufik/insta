//
//  FeedPostItemInfo.swift
//  Instagram zhan
//
//  Created by Mac Students on 16.02.2024.
//

import UIKit

struct FeedPostItemInfo {
    let userImage: UIImage
    let username: String
    let postSubtitle: String
    let postImage: UIImage
    let numberOfLikes: Int
    let comment: CommentShortInfo?
}

struct CommentShortInfo {
    let username: String
    let commentText: String
}
