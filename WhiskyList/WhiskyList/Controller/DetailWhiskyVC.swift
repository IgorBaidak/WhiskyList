//
//  DetailWhiskyVC.swift
//  WhiskyList
//
//  Created by Igor Baidak on 23.08.22.
//

import UIKit

class DetailWhiskyVC: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var imageView: UIImageView! //{ didSet { imageView.image = UIImage(named: whisky ?? "") } }
    
    @IBOutlet weak var whiskyName: UILabel! //{ didSet { whiskyName.text = whisky } }
    
    @IBOutlet weak var whiskyPrice: UILabel! //{ didSet { whiskyPrice.text = (price ?? "0") + " " + "€" } }
    
    @IBOutlet weak var feedback: UILabel!
    
    @IBOutlet weak var countFeedbackButton: UIButton!
    
    var whisky: String?
    var price: String?
    
    var index: Int!
    var whiskye: Whisky {
        WhiskyDate.shared.whisky[index]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(with: view.bounds.size)
        // Do any additional setup after loading the view.
    }
     // функция вызываемая при повороте экрана (для красивого отображения)
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        updateUI(with: size)
    }
    
    func updateUI(with size: CGSize) {
        let isVertical = size.width < size.height
        stackView.axis = isVertical ? .vertical : .horizontal
        
        imageView.image = whiskye.image
        whiskyName.text = whiskye.whisky
        whiskyPrice.text = String(whiskye.price) + " " + "€"
        feedback.text = whiskye.ratingBar
        
        let showReviewButton = "Посмотреть (\(whiskye.feedback.count)) отзывов"
        countFeedbackButton.setTitle(showReviewButton, for: .normal)
        countFeedbackButton.isEnabled = whiskye.feedback.count != 0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
