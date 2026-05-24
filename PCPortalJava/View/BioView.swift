//
//  BioView.swift
//  PCPortalJava
//
//  Created by Angelos Staboulis on 24/5/26.
//

import Foundation
import SwiftUI

struct BioView: View {
    @StateObject private var vm = BioViewModel()

    private var portalBlue: Color {
        Color(red: 0.05, green: 0.38, blue: 0.68)
    }

    private var portalBlueLight: Color {
        Color(red: 0.22, green: 0.63, blue: 0.88)
    }

    private var backgroundGradient: LinearGradient {
        LinearGradient(
            colors: [portalBlueLight, portalBlue],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(.icon)
                    .resizable()
                    .frame(width:360,height:100)
                HStack {
                    Spacer()
                    Image("gossling")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .padding(.bottom, 8)
                    Spacer()
                }

                Text(vm.bio.title)
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                Text(vm.bio.subtitle)
                    .font(.title3)
                    .foregroundColor(.white.opacity(0.85))

                Divider()
                    .background(Color.white.opacity(0.4))

                Text(vm.bio.text)
                    .font(.body)
                    .foregroundColor(.white.opacity(0.95))
            }
            .padding()
        }
        .background(
            backgroundGradient
                .ignoresSafeArea(.container, edges: .top)
        )
        .navigationTitle("Βιογραφικό")
        .navigationBarTitleDisplayMode(.inline)
    }
}
