//
//  AddressItemType.swift
//  cov1
//
//  Created by Tobias Pechatschek on 04.04.21.
//

import Foundation

enum AddressItemType: String, Decodable, CaseIterable {
    case cryptocurrency, stablecoin, nft, dust
}
