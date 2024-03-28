//
//  ServiceModel.swift
//  infoVk
//
//  Created by Елизавета Шерман on 28.03.2024.
//

import Foundation

struct ResponseBody: Decodable {
    var body: ServiceBody
}

struct ServiceBody: Decodable {
    var services: [ServiceModel]
}

struct ServiceModel: Decodable, Hashable {
    var name: String
    var description: String
    var link: String
    var icon_url: String
}
