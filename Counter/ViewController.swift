//
//  ViewController.swift
//  Counter
//
//  Created by Alekhina Viktoria on 09/11/2025.
//

import UIKit

class ViewController: UIViewController {
    private var counterValue = 0 {
        didSet {
                сounterLabel.text = "Значение счётчика: \(counterValue)"
            }
    }
        
    private var historyOfChanges = ["История изменений:"]
    

    @IBOutlet weak var сounterLabel: UILabel!
    @IBOutlet weak var сountPlusButton: UIButton!
    @IBOutlet weak var сountMinusButton: UIButton!
    @IBOutlet weak var сountRefreshButton: UIButton!
    @IBOutlet weak var historyOfChangesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyOfChangesTextView.text = historyOfChanges[0]
    }

    @IBAction func plusButtonDidTap() {
        counterValue += 1
        appendAndUpdateHistory("значение изменено на +1")
    }
    
    @IBAction func minusButtonDidTap() {
        if counterValue > 0 {
            counterValue -= 1
            appendAndUpdateHistory("значение изменено на -1")
        } else {
            appendAndUpdateHistory("попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func refreshButtonDidTap() {
        counterValue = 0
        appendAndUpdateHistory("значение сброшено")
    }
    
    private func currentDateTime() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "d MMM yyyy, HH:mm"
        return formatter.string(from: Date())
    }
    

    private func appendAndUpdateHistory(_ message: String) {
        historyOfChanges.append("[\(currentDateTime())]: \(message)")
        historyOfChangesTextView.text = historyOfChanges.joined(separator: "\n")
    }
}

