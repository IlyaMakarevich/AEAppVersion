//
// ViewController.swift
//
// Copyright (c) 2016 Marko Tadić <tadija@me.com> http://tadija.net
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import UIKit
import AEAppVersionManager

class ViewController: UIViewController {
    
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        versionLabel.text = AEAppVersionManager.versionAndBuild
        stateLabel.text = versionStatedDescription
    }
    
    var versionStatedDescription: String {
        switch AEAppVersionManager.sharedInstance.state {
        case .New:
            return "Clean Install"
        case .Equal:
            return "Not Changed"
        case .Update(let previousVersion):
            return "Update from: \(previousVersion)"
        case .Rollback(let previousVersion):
            return "Rollback from: \(previousVersion)"
        }
    }

}
