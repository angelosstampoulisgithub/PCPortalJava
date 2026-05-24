//
//  LocationViewModel.swift
//  PCPortalJava
//
//  Created by Angelos Staboulis on 24/5/26.
//

import Foundation
import MapKit


@MainActor
class LocationViewModel: ObservableObject {
    @Published var pins: [LocationPin]
    
    init() {
        let coordinate = CLLocationCoordinate2D(latitude: 41.12045, longitude: 25.40530)
        
        self.pins = [
            LocationPin(coordinate: coordinate)
        ]
    }
}
