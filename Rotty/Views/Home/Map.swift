//
//  Map.swift
//  Rotty
//
//  Created by Rostislav Brož on 10/27/22.
//

import SwiftUI
import MapKit

struct Map: UIViewRepresentable {

    @EnvironmentObject var model: ContentModel

    func makeUIView(context: Context) -> MKMapView {

        let mapView = MKMapView()

        // Show user on the map
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading

        return mapView

    }

    func updateUIView(_ uiView: MKMapView, context: Context) {

        
        
    }

    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {

        
        
    }
}
