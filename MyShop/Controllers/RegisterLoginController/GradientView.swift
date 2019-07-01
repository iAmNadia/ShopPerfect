//
//  GradientView.swift
//  MyShop
//
//  Created by NadiaMorozova on 18.06.2019.
//  Copyright © 2019 NadiaMorozova. All rights reserved.
//

import UIKit

@IBDesignable class GradientView: UIView {
    
    @IBInspectable var  startColor: UIColor = .white { didSet {
        self.updateColor()
        }
    }
    @IBInspectable var  endColor: UIColor = .black { didSet {
        self.updateColor()
        }
    }
    @IBInspectable var  startLocation: CGFloat = 0 { didSet {
        self.updateLocations()
        }
    }
    @IBInspectable var  endLocation: CGFloat = 1 { didSet {
        self.updateLocations()
        }
    }
    @IBInspectable var startPoint: CGPoint = .zero { didSet {
        self.updateStartPoint()
        }
    }
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0, y: 1) { didSet {
        self.updateEndPoint()
        }
    }
    override static var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    var gradientLayer: CAGradientLayer {
        return self.layer as! CAGradientLayer
    }
    
    func updateLocations()  {
        self.gradientLayer.locations = [self.startLocation as NSNumber, self.endLocation as NSNumber]
    }
    func updateColor()  {
        self.gradientLayer.colors = [self.startColor.cgColor, self.endColor.cgColor]
    }
    func updateStartPoint()  {
        self.gradientLayer.startPoint = startPoint
    }
    func updateEndPoint()  {
        self.gradientLayer.endPoint = endPoint
    }
    
}


