//
//  PredatorController.swift
//  JP Apex Predators
//
//  Created by Todd James on 6/26/22.
//

import Foundation

class PredatorController {
  private var allApexPredators: [ApexPredator] = []
  var apexPredators: [ApexPredator] = []
  let typeFilters = ["All", "Land", "Air", "Sea"]

  init() {
    decodeApexPredatorData()
  }

  func decodeApexPredatorData() {
    if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
      do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase  // allows decoding from json snake_case to camel case
        allApexPredators = try decoder.decode([ApexPredator].self, from: data)  // use the all array
        apexPredators = allApexPredators // apexPredators will be used for filtering below
      } catch {
        print("Error decoding JSON data: \(error)")
      }
    }
  }

  func sortByAlphabetical() {
    apexPredators.sort(by: {  // sort: inplace - sorts actual array order
      $0.name < $1.name
    })
  }

  func sortByMovieAppearance() {
    apexPredators.sort(by: {
      $0.id < $1.id
    })
  }

  func typeIcon(for type: String) -> String {
    switch type {
    case "All": return "square.stack.3d.up.fill"
    case "Land": return "leaf.fill"
    case "Air": return "wind"
    case "Sea": return "drop.fill"
    default: return "questionmark"
    }
  }

  func filterBy(type: String) {
    switch type {
    case "Land", "Air", "Sea": apexPredators = allApexPredators.filter { $0.type == type.lowercased()}  // filter: true == keep, false == remove, not implace creates a temp array and assigns it back to orig array
    default: apexPredators = allApexPredators // "All" would be included in default clause
    }
  }
}
