//
//  ViewController.swift
//  RandomElements
//
//  Created by Anton Akhmedzyanov on 30.07.2023.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var segmentedCNR: UISegmentedControl!
    @IBOutlet var mainTextLabel: UILabel!
    
    private var indexNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextLabel()
        
        segmentedCNR.insertSegment(withTitle: "Third", at: 2, animated: false)
    }


    @IBAction func changeSigment() {
       
        
    }
    
    private func setupTextLabel() {
        mainTextLabel.text = ""
        mainTextLabel.font = mainTextLabel.font.withSize(35)
        mainTextLabel.textAlignment = .center
        mainTextLabel.numberOfLines = 2
        mainTextLabel.textColor = .brown
    }
}

