//
//  LocationView.swift
//  PCPortalJava
//
//  Created by Angelos Staboulis on 24/5/26.
//

import SwiftUI
import MapKit

struct LocationView: View {
    @StateObject private var vm = LocationViewModel()

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.12045, longitude: 25.40530),
        span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    )

    var body: some View {
        VStack {
            Image(.icon)
                .resizable()
                .frame(width: 360, height: 100)

            Map(coordinateRegion: $region, annotationItems: vm.pins) { pin in
                MapMarker(coordinate: pin.coordinate, tint: .red)
            }
            .frame(height: 350)
            .cornerRadius(16)
            .padding()

            Text("Πολυφήμου 2")
                .font(.largeTitle.bold())
                .foregroundStyle(.white)

            Text("Κομοτηνή, Ελλάδα")
                .font(.title3)
                .foregroundStyle(.white)

            Spacer()
        }
        .background(
            LinearGradient(
                colors: [
                    Color(red: 0.22, green: 0.63, blue: 0.88),
                    Color(red: 0.05, green: 0.38, blue: 0.68)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea(.container, edges: .top)
        )
        .navigationTitle("Τοποθεσία")
        .navigationBarTitleDisplayMode(.inline)
    }
}
