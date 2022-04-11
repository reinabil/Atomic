//
//  ViewController.swift
//  Atomic Team 3
//
//  Created by Nabil Rei on 05/04/22.
//

import UIKit

class OnboardViewController: UIViewController {
    
    @IBOutlet weak var onboardImage: UIImageView!
    @IBOutlet weak var onboardTitle: UILabel!
    @IBOutlet weak var onboardSubtitle: UILabel!
    @IBOutlet weak var onboardButton1: UIButton!
    @IBOutlet weak var onboardButton2: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var getStartedButton: UIButton!
    
    
    var contents = OnboardBrain().contents
    var page = 0;
    var getStartedHidden = true
    private let storageManager = StorageManager()
    private let navigationManager = Navigationmanager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.sizeToFit()
        pageControl.isUserInteractionEnabled = false
        
        print(pageControl.numberOfPages)
        onboardImage.image = contents[0].image
        onboardTitle.text = contents[0].title
        onboardSubtitle.text = contents[0].subtitle
        
        if page < 2 {
            getStartedButton.isHidden = true
        } else {
            getStartedButton.isHidden = false
            onboardButton1.isHidden = true
            onboardButton2.isHidden = true
        }

        updateFlag()
    }
    
    func updateFlag() {
        storageManager.setOnboardingSeen()
    }
    
    @IBAction func onboardButton1Pressed(_ sender: UIButton) {
        
        if page < contents.count-2 {
            getStartedButton.isHidden = true
        } else {
            getStartedButton.isHidden = false
            onboardButton1.isHidden = true
            onboardButton2.isHidden = true
        }
        
        if page < contents.count-1 {
            page += 1
            pageControl.currentPage += 1
            onboardImage.image = contents[page].image
            onboardTitle.text = contents[page].title
            onboardSubtitle.text = contents[page].subtitle
            onboardButton1.setTitle(contents[page].button1, for: .normal)
        } else {
            // GO TO HOME PAGE
        }
        
    }
    
    @IBAction func onboardButton2Pressed(_ sender: UIButton) {
    }
    @IBAction func getStartedPressed(_ sender: UIButton) {
        showMainApp()
    }
    
    
    private func showMainApp(){
        navigationManager.show(screen: .mainApp, inController: self)
    }
}
