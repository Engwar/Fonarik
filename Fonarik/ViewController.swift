//
//  ViewController.swift
//  Fonarik
//
//  Created by Игорь Шелгинский on 09.09.2018.
//  Copyright © 2018 Igor Shelginskiy. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var lightOn = true

    @IBAction func buttonPress(_ sender: UIButton) {
        lightOn = !lightOn
        updateFlash()
    }
    
    func updateFlash () {
        let flashDevice = AVCaptureDevice.default(for: AVMediaType.video)
        if let flash = flashDevice, flash.hasTorch {
            view.backgroundColor = .black
            do {
                try flash.lockForConfiguration()
                flash.torchMode = lightOn ? .on : .off
                flash.unlockForConfiguration()
            } catch {
              print(error)
            }
        } else {
            view.backgroundColor = lightOn ? .white : .black
        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateFlash()
    }


}

