//
//  TesteThaisView.swift
//  LearningCloudKit2
//
//  Created by Miriam Mendes on 05/09/24.
//

import SwiftUI
import CoreLocation

struct TesteThaisView: View {
    let tent: Tents
    var body: some View {
        Text("\(tent.name)")
    }
}

#Preview {
    TesteThaisView(tent: Tents(name: "", image: "", linkMap: "", coordinates: CLLocation(latitude: 90, longitude: 33333), seaBath: true, shower: true, toilet: false, averagePrice: "9.90", capacity: ""))
}
