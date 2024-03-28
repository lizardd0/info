//
//  ServiceManager.swift
//  infoVk
//
//  Created by Елизавета Шерман on 28.03.2024.
//

import Foundation

enum ServiceError: Error {
    case failedToFetchData
}

final class ServiceManager {
    func getServices() async throws -> ResponseBody {
        guard let url = URL(string: "https://publicstorage.hb.bizmrg.com/sirius/result.json") else {
            fatalError("Wrong URL")
        }
        
        let request = URLRequest(url: url)
        
        guard let (data, _) = try? await URLSession.shared.data(for: request) else {
            print("No data or response received")
            throw ServiceError.failedToFetchData
        }
        
        let decodedData =  try JSONDecoder().decode(ResponseBody.self, from: data)
        
        
        return decodedData
    }
}
