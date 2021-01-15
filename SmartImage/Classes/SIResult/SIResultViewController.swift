//
//  SIResultViewController.swift
//  SmartImage
//
//  Created by Mathias Almeida Nonohay on 1/15/21.
//

import UIKit
import Vision

@available(iOS 11.0, *)
@available(iOS 12.0, *)
public class SIResultViewController: UIViewController {
    
    @IBOutlet weak var uiResultImageView: UIImageView!
    @IBOutlet weak var uiResulLabel: UILabel!
    @IBOutlet weak var uiConfidenceLabel: UILabel!
    
    private var results: [VNClassificationObservation]
    private var imageToLoad: UIImage
    
    public init(image: UIImage, results: [VNClassificationObservation]) {
        self.imageToLoad = image
        self.results = results
        super.init(nibName: "SIResultViewController", bundle: Bundle(identifier: "/SIResult"))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupResults()
    }
    
    //MARK: - Methods
    private func setupResults() {
        uiResultImageView.image = imageToLoad
        if let firstResult = results.first {
            uiResulLabel.text = firstResult.identifier
            uiConfidenceLabel.text = "\(Int(firstResult.confidence * 100))% de confiança"
        } else {
            navigationController?.popToRootViewController(animated: true)
        }
    }
}
