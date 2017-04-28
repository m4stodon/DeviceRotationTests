//
//  ViewController.swift
//  DeviceRotationOnlyOneViewController


import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
    var wkWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let requestLink = URL.init(string: "https://s3-us-west-2.amazonaws.com/resources.honcker.com/sample/10203_in0480.html")
        let request     = URLRequest.init(url: requestLink!)
        
        let webConfiguration = WKWebViewConfiguration()
        let screenFrame      = CGRect(x: 0,
                                      y: 0,
                                      width:  2 * UIScreen.main.bounds.height > UIScreen.main.bounds.width ? UIScreen.main.bounds.height : UIScreen.main.bounds.width,
                                      height: UIScreen.main.bounds.height > UIScreen.main.bounds.width ? UIScreen.main.bounds.width  : UIScreen.main.bounds.height)
        
        wkWebView = WKWebView(frame: screenFrame, configuration: webConfiguration)
        wkWebView.uiDelegate = self
        view.addSubview(wkWebView)
        wkWebView.load(request)
        
        // change orientation
        UIDevice.current.setValue(Int(UIInterfaceOrientation.landscapeLeft.rawValue), forKey: "orientation")
        UIViewController.attemptRotationToDeviceOrientation()
    }
    
    override func viewWillDisappear(_ animated : Bool) {
        super.viewWillDisappear(animated)
        
        
        // return orientation to original state
        UIDevice.current.setValue(Int(UIInterfaceOrientation.portrait.rawValue), forKey: "orientation")
        maskOrientation = UIInterfaceOrientationMask.portrait
        orientation = UIInterfaceOrientation.portrait
    }
    
    
    // ---
    
    var maskOrientation = UIInterfaceOrientationMask.landscapeLeft
    var orientation     = UIInterfaceOrientation.landscapeLeft
    
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return maskOrientation
    }
    
    // ---
}


