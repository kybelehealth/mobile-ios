//
//  InformationBlogViewModel.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

class InformationBlogViewModel {

    let pageTitle: String = "Information Blog"

    let items: [InformationBlog] = [
        InformationBlog(
            name: "Pregnant Nutrition",
            body: "Lorem ipsum dolor sit amet, dolor sit consectetur adipiscing elit. Nullipsu…",
            image: UIImage()
        )
    ]
}

struct InformationBlog {

    let name: String
    let body: String
    let image: UIImage
}
