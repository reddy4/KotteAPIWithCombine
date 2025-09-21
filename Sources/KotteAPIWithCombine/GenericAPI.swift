//
//  File.swift
//  KotteAPIWithCombine
//
//  Created by Reddanna Kotte on 21/09/25.
//

import Foundation
import Combine

public class GenericAPI {
    
    public init() { }
    
    let shared = GenericAPI()
    func getData<T: Decodable>(from url: String)->AnyPublisher<[T], Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .map(\.data)
            .decode(type: [T].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
 

