//
//  FeedStoriesCellInfo.swift
//  Instagram zhan
//
//  Created by Mac Students on 16.02.2024.
//

import UIKit

struct FeedStoriesItemCellInfo {
    let image: UIImage
    let username: String
    let isAddButtonVisible: Bool
    let isNewStory: Bool
}

typealias FeedStoriesCellInfo = [FeedStoriesItemCellInfo]
