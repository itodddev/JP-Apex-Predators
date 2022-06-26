//
//  ApexPredator.swift
//  JP Apex Predators
//
//  Created by Todd James on 6/26/22.
//

import Foundation
import SwiftUI

struct ApexPredator: Codable, Identifiable {  // Codable for JSON, Identifiable for ForEach
  let id: Int
  let name: String
  let type: String
  let movies: [String]
  let movieScenes: [MovieScene]
  let link: String

  func typeOverlay () -> Color {
    switch type {
    case "land": return .brown
    case "air": return .teal
    case "sea": return .blue
    default: return .brown
    }
  }
}

struct MovieScene: Codable {
  let id: Int
  let movie: String
  let sceneDescription: String
}
