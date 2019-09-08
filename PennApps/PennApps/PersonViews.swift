//
//  PersonViews.swift
//  PennApps
//
//  Created by Aditya Kannan on 9/7/19.
//  Copyright © 2019 Helen Dong. All rights reserved.
//

import Foundation
import MapKit

extension MKAnnotationView {
    
    func loadCustomLines(customLines: [String]) {
        let stackView = self.stackView()
        for line in customLines {
            let label = UILabel()
            label.text = line
            stackView.addArrangedSubview(label)
        }
        self.detailCalloutAccessoryView = stackView
    }
    
    
    
    private func stackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }
}

@available(iOS 11.0, *)
class PersonMarkerView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            // 1
            
            guard let person = newValue as? Person else { return }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
           // rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            // 2
            markerTintColor = person.markerTintColor
            // glyphText = String(person.discipline.first!)
            
        }
    }
}
