//
//  ViewController.swift
//  AlanCollectionViewTest
//
//  Created by haoyuan tan on 2018/10/4.
//  Copyright © 2018年 haoyuan tan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let images = [#imageLiteral(resourceName: "image1"),#imageLiteral(resourceName: "image2"),#imageLiteral(resourceName: "image3"),#imageLiteral(resourceName: "image4"),#imageLiteral(resourceName: "image5"),#imageLiteral(resourceName: "image6")]
    var selectedIndexPath: IndexPath!
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        if let layout = collectionView.collectionViewLayout as? PinterestLayout{
            layout.delegate = self
        }
        
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UICollectionViewDataSource,PinterestLayoutDelegate,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let image = images[indexPath.item]
        let height = image.size.height*0.1
        
        return height
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCollectionViewCell
        let image = images[indexPath.item]
        cell.imageView.image = image
        return cell
    }
    
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetialViewController") as? DetialViewController
        vc?.theImagePassed =  images[indexPath.item]
        self.selectedIndexPath = indexPath
        self.navigationController?.pushViewController(vc!, animated: true)

    }
    

}


extension ViewController : ZoomingViewController{
    func zoomingBackgroundView (for transition: ZoomTransitioningDelegate) -> UIView?{
        return nil
    }
    func zoomingImageView(for transition: ZoomTransitioningDelegate) ->UIImageView?{
        if let indexPath = selectedIndexPath{
            let cell = collectionView?.cellForItem(at: indexPath) as! PhotoCollectionViewCell
            return cell.imageView
        }
        return nil
        
    }
}


































