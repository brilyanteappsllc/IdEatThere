//
//  GeoLocationPermission.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/10/23.
//

import SwiftUI

struct GeoLocationPermission: View {
    var body: some View {
        
        VStack (spacing: 20) {

                Image("onboardingRestaurant")
                    .resizable()
                    .scaledToFit()
                Text("Ready to discover some food?")
                    .bold()
                    .font(.title)
                Text("Your location is needed to search for nearby restaurants")

        }
        .padding(.horizontal)
        .multilineTextAlignment(.center)
        .foregroundColor(.white)
    }
}

struct GeoLocationPermission_Previews: PreviewProvider {
    static var previews: some View {
        GeoLocationPermission()
    }
}
