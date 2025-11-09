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
                CounterLabel.text = "Значение счётчика: \(counterValue)"
            }
    }
        
    private var historyOfChanges = ["История изменений:"]
    

    @IBOutlet weak var CounterLabel: UILabel!
    @IBOutlet weak var CountPlusButton: UIButton!
    @IBOutlet weak var CountMinusButton: UIButton!
    @IBOutlet weak var CountRefreshButton: UIButton!
    @IBOutlet weak var HistoryOfChangesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HistoryOfChangesTextView.text = historyOfChanges[0]
    }

    @IBAction func plusButtonDidTap() {
        counterValue += 1
        historyOfChanges.append("[\(currentDateTime())]: значение изменено на +1")
        updateHistoryView()        
    }
    
    @IBAction func minusButtonDidTap() {
        if counterValue > 0 {
            counterValue -= 1
            historyOfChanges.append("[\(currentDateTime())]: значение изменено на -1")
            updateHistoryView()
        } else {
            historyOfChanges.append("[\(currentDateTime())]: попытка уменьшить значение счётчика ниже 0")
            updateHistoryView()
        }
    }
    
    @IBAction func refreshButtonDidTap() {
        counterValue = 0
        historyOfChanges.append("[\(currentDateTime())]: значение сброшено")
        updateHistoryView()
    }
    
    private func currentDateTime() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "d MMM yyyy, HH:mm"
        return formatter.string(from: Date())
    }
    
    private func updateHistoryView() {
        HistoryOfChangesTextView.text = historyOfChanges.joined(separator: "\n")
    }
}

