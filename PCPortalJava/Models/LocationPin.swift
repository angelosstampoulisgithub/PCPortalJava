//
//  LocationPin.swift
//  PCPortalJava
//
//  Created by Angelos Staboulis on 24/5/26.
//

import Foundation
import MapKit

struct LocationPin: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}
