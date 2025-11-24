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
                counterLabel.text = "Значение счётчика: \(counterValue)"
            }
    }
        
    private var history = ["История изменений:"]
    
    private lazy var formatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ru_RU")
            formatter.dateFormat = "d MMM yyyy, HH:mm"
            return formatter
        }()


    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var incrementButton: UIButton!
    @IBOutlet private weak var decrementButton: UIButton!
    @IBOutlet private weak var countRefreshButton: UIButton!
    @IBOutlet private weak var historyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.text = history[0]
    }

    @IBAction private func plusButtonDidTap() {
        counterValue += 1
        appendAndUpdateHistory("значение изменено на +1")
    }
    
    @IBAction private func minusButtonDidTap() {
        if counterValue > 0 {
            counterValue -= 1
            appendAndUpdateHistory("значение изменено на -1")
        } else {
            appendAndUpdateHistory("попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction private func refreshButtonDidTap() {
        counterValue = 0
        appendAndUpdateHistory("значение сброшено")
    }
    
    private func currentDateTime() -> String {
            formatter.string(from: Date())
        }
    
    private func appendAndUpdateHistory(_ message: String) {
        history.append("[\(currentDateTime())]: \(message)")
        historyTextView.text = history.joined(separator: "\n")
        historyTextView.scrollRangeToVisible(NSRange(location: historyTextView.text.count - 1, length: 1))
    }
}

