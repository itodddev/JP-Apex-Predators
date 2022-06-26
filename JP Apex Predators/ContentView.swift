//
//  ContentView.swift
//  JP Apex Predators
//
//  Created by Todd James on 6/26/22.
//

import SwiftUI

struct ContentView: View {
  let apController = PredatorController() // create instance of a Predator Controller and runs init to decode JSON data

  var body: some View {
    NavigationView {
      List {
        ForEach(apController.apexPredators) { predator in
          NavigationLink(destination: Text("Dino details go here")) {
            PredatorRow(predator: predator)
          }
        }
      }
      .navigationTitle("Apex Predators")
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
