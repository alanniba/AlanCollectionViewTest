//
//  DetialViewController.swift
//  AlanCollectionViewTest
//
//  Created by haoyuan tan on 2018/10/4.
//  Copyright © 2018年 haoyuan tan. All rights reserved.
//

import UIKit

class DetialViewController: UIViewController {

    @IBOutlet weak var imageDetial: UIImageView!
    var theImagePassed = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        imageDetial.image = theImagePassed

        imageDetial.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.popView))
        self.imageDetial.addGestureRecognizer(tapGesture)
    }

    @objc func popView(){
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }



}
extension DetialViewController : ZoomingViewController
{
    func zoomingBackgroundView(for transition: ZoomTransitioningDelegate) -> UIView? {
        return nil
    }
    
    func zoomingImageView(for transition: ZoomTransitioningDelegate) -> UIImageView? {
        return imageDetial
    }
}
