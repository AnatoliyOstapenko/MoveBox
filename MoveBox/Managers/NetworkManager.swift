//
//  UserManager.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 07.07.2022.
//

import Foundation
import Combine

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchUsers() -> AnyPublisher <[User], Never> {
        guard let url = URLString.url else { return Just([]).eraseToAnyPublisher() }
        
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: [User].self, decoder: JSONDecoder())
            .catch { _ in
                Just([])
            }
            .eraseToAnyPublisher()
        return publisher
    }
}
