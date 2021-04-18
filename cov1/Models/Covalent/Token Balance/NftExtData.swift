//
//  NftExtData.swift
//  cov1
//
//  Created by Tobias Pechatschek on 06.04.21.
//

import Foundation

struct NftExtData: Decodable {
    var name: String?
    var description: String?
    var image: String
    var external_url: String?
    // var attributes: 
    var owner: String?
}
