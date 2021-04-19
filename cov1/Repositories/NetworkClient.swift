//
//  NetworkClient.swift
//  cov1
//
//  Created by Tobias P on 04.04.21.
//

import Foundation
import Combine

/// Instance which handles all network requests in the app
struct NetworkClient {

    /**
     Returns a `AnyPublisher`
     - Parameter url: the url that will be requested
     - Returns: Depeding on the result of the request it returns the data or an error
    */
    func get<T: Decodable>(_ url: String) throws -> AnyPublisher<T, Error> {
        guard let url = URL(string: url) else {
            fatalError("URL is not valid")
        }
        var request = URLRequest(url: url)
        request.addValue("Basic Y2tleV85YzQ1MmE3OTM0ODA0Yjk0ODMyYzQyMjY4NmY6", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "accept")
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw HTTPError.statusCode
                }
                let decodedData = try JSONDecoder().decode(T.self, from: output.data)
                return decodedData
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

/// an error that enables to pass the statusCode
enum HTTPError: LocalizedError {
    case statusCode
}
