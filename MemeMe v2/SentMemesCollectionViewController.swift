//
//  SentMemesCollectionViewController.swift
//  MemeMe v2
//
//  Created by Jagdeep Singh on 24/01/21.
//

import UIKit

class SentMemesCollectionViewController: UICollectionViewController {
    
    @IBOutlet var memeCollectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let lineSpace:CGFloat = 0.5
        let itemSpace:CGFloat = 0.2
        let wdimension = (view.frame.size.width - (2.0 * 3.0)) / 3.0
        let hdimension = (view.frame.size.width - (2.0 * 2.8)) / 3.0
        flowLayout.minimumInteritemSpacing = itemSpace
        flowLayout.minimumLineSpacing = lineSpace
        flowLayout.itemSize = CGSize(width: wdimension, height: hdimension)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        memeCollectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let meme = memes[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
        cell.cellImageView.image = meme.memedImage
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let memeVC = storyboard?.instantiateViewController(identifier: "MemeViewController") as! MemeDetailViewController
        memeVC.selectedImage = memes[indexPath.item].memedImage
        navigationController?.pushViewController(memeVC, animated: true)
    }
    
    
    
}
