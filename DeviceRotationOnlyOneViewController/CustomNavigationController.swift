//
//  CustomNavigationController.swift
//  DeviceRotationOnlyOneViewController

import UIKit

class CustomNavigationController: UINavigationController {
    
    override var shouldAutorotate: Bool {
        return (self.topViewController?.shouldAutorotate)!
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        print("CustomNavigationController::supportedInterfaceOrientations::supportedInterfaceOrientations")
        return (self.topViewController?.supportedInterfaceOrientations)!
    }
}
