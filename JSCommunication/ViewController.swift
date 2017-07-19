//
//  ViewController.swift
//  JSCommunication
//
//  Created by 范皓迪 on 19/07/2017.
//  Copyright © 2017 HenryFanDi. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    private var webView: WKWebView?
    
    @IBOutlet private weak var webViewContainer: UIView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Private
    
    private func setupViewController() {
        let controller = WKUserContentController()
        controller.add(self, name: "callbackHandler")
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = controller
        
        webView = WKWebView.init(frame: view.bounds, configuration: configuration)
        
        let request = NSURLRequest.init(url: NSURL.fileURL(withPath: Bundle.main.path(forResource: "javascript_test", ofType: "html")!)) as URLRequest
        webView?.load(request)
        
        UIView.setupContentViewConstraints(with: webViewContainer, contentView: webView!)
    }
    
    private func setupContentViewConstraints(with targetView: UIView, contentView: UIView) {
        targetView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        var visualFormat = ""
        let metrics = [
            "padding": 0
        ]
        let views = [
            "contentView": contentView
        ]
        visualFormat = "H:|-padding-[contentView]-padding-|"
        targetView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: visualFormat,
                                                                 options: NSLayoutFormatOptions.directionLeadingToTrailing,
                                                                 metrics: metrics,
                                                                 views: views))
        visualFormat = "V:|-padding-[contentView]-padding-|"
        targetView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: visualFormat,
                                                                 options: NSLayoutFormatOptions.directionLeadingToTrailing,
                                                                 metrics: metrics,
                                                                 views: views))
    }
    
}

extension ViewController: WKScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.body)
    }
    
}

extension UIView {
    
    static func setupContentViewConstraints(with targetView: UIView, contentView: UIView) {
        targetView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        var visualFormat = ""
        let metrics = [
            "padding": 0
        ]
        let views = [
            "contentView": contentView
        ]
        visualFormat = "H:|-padding-[contentView]-padding-|"
        targetView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: visualFormat,
                                                                 options: NSLayoutFormatOptions.directionLeadingToTrailing,
                                                                 metrics: metrics,
                                                                 views: views))
        visualFormat = "V:|-padding-[contentView]-padding-|"
        targetView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: visualFormat,
                                                                 options: NSLayoutFormatOptions.directionLeadingToTrailing,
                                                                 metrics: metrics,
                                                                 views: views))
    }
    
}
