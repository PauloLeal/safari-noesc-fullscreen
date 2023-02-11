//
//  ViewController.swift
//  safari-noescape-fullscreen
//
//  Created by Paulo Leal on 11/02/23.
//

import Cocoa
import SafariServices
import WebKit

let extensionBundleIdentifier = "br.com.pleal.safari-noescape-fullscreen.Extension"

class ViewController: NSViewController, WKNavigationDelegate {


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        SFSafariExtensionManager.getStateOfSafariExtension(withIdentifier: extensionBundleIdentifier) { (state, error) in
            guard let state = state, error == nil else {
                // Insert code to inform the user that something went wrong.
                return
            }

            DispatchQueue.main.async {
                if #available(macOS 13, *) {
                    webView.evaluateJavaScript("show(\(state.isEnabled), true)")
                } else {
                    webView.evaluateJavaScript("show(\(state.isEnabled), false)")
                }
            }
        }
    }
}
