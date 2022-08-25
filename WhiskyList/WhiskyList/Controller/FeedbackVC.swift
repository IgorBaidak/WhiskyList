//
//  FeedbackVC.swift
//  WhiskyList
//
//  Created by Igor Baidak on 23.08.22.
//

import UIKit

class FeedbackVC: UIViewController {
    
    @IBOutlet weak var feedbackTextView: UITextView!
    @IBOutlet weak var ratingBar: UISegmentedControl!
    @IBOutlet weak var sendFeedbackButton: UIButton!
    
    
    
    var index: Int!
    
    var whiskye: Whisky {
        WhiskyDate.shared.whisky[index]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        feedbackTextView.delegate = self // подписываемся под делегат, т.к у TextView нет                                   Action'ов
    }
    
    @IBAction func sendFeedbackButton(_ sender: UIButton) {
        let feedbackButton = Feedback(text: feedbackTextView.text, raiting: Double(ratingBar.selectedSegmentIndex + 1))
        WhiskyDate.shared.whisky[index].feedback.append(feedbackButton)
        navigationController?.popToRootViewController(animated: true)
    }
}


extension FeedbackVC: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView == feedbackTextView {
            let isCountEnought = textView.text.count > 20
            sendFeedbackButton.isEnabled = isCountEnought
        }
        return true
    }
}
