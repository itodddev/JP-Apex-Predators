//
//  PredatorController.swift
//  JP Apex Predators
//
//  Created by Todd James on 6/26/22.
//

import Foundation

class PredatorController {
  var apexPredators: [ApexPredator] = []

  init() {
    decodeApexPredatorData()
  }

  func decodeApexPredatorData() {
    if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
      do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase  // allows decoding from json snake_case to camel case
        apexPredators = try decoder.decode([ApexPredator].self, from: data)
      } catch {
        print("Error decoding JSON data: \(error)")
      }
    }
  }
}
