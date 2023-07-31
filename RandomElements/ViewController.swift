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
    @IBOutlet var mainSlider: UISlider!
    @IBOutlet var mainTextField: UITextField!
    @IBOutlet var dataPicker: UIDatePicker!
    @IBOutlet var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextLabel()
        segmentedCNR.insertSegment(withTitle: "Third", at: 2, animated: false)
        setupSlider()
        setupTextLabel()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
       
    }

    @IBAction func changeSigment() {
        switch segmentedCNR.selectedSegmentIndex {
        case 0:
            mainTextLabel.text = "The first segment is selected"
            mainTextLabel.textColor = .blue
        case 1:
            mainTextLabel.text = "The second segment is selected"
            mainTextLabel.textColor = .green
        default:
            mainTextLabel.text = "The Third segment is selected"
            mainTextLabel.textColor = .red
        }
    }
    
    
    @IBAction func setSlider() {
        mainTextLabel.text = String(format: "%.2f", mainSlider.value)
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(mainSlider.value))
    }
    
    
    @IBAction func pressedButton() {
        guard let inputText = mainTextField.text, !inputText.isEmpty else {
            showAllert(with: "Text is empty", and: "Plese enter your name")
            return
        }
        if let _ = Double(inputText) {
            showAllert(with: "Wrong format!", and: "Enter your name!")
            return
        }
            
        mainTextLabel.text = mainTextField.text
    }
    
    @IBAction func chooseData() {
        let dataFormatter = DateFormatter()
        dataFormatter.dateStyle = .long
        mainTextLabel.text = dataFormatter.string(from: dataPicker.date)
    }
    
    @IBAction func hideDataPicker(_ sender: UISwitch) {
        dataPicker.isHidden = sender.isOn
        textLabel.text = sender.isOn ? "Show Time and Time" : "Hide Time and Time"
    }
    
    //MARK: - Private Methods
    private func setupTextLabel() {
        mainTextLabel.text = "\(mainSlider.value)"
        mainTextLabel.font = mainTextLabel.font.withSize(35)
        mainTextLabel.textAlignment = .center
        mainTextLabel.numberOfLines = 2
        mainTextLabel.textColor = .white
    }
    
    private func setupSlider() {
        mainSlider.value = 0.5
        mainSlider.minimumValue = 0
        mainSlider.maximumValue = 1
        mainSlider.thumbTintColor = .green
        mainSlider.maximumTrackTintColor = .blue
        mainSlider.minimumTrackTintColor = .green
    }
    
    
}

//MARK: - UIAlertController
extension ViewController {
    private func showAllert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.mainTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
