//
//  Collectionview.swift
//  SkeletonViewDemo
//
//  Created by Manmeetsingh Sethi on 31/07/19.
//  Copyright © 2019 Manmeetsingh Sethi. All rights reserved.
//

import UIKit
import SkeletonView

class Collectionview: UIViewController {

    @IBOutlet weak var cvSkeleton:UICollectionView!{
        didSet {
            cvSkeleton.isSkeletonable = true
            cvSkeleton.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            cvSkeleton.dataSource = self
            cvSkeleton.delegate = self
            
            cvSkeleton.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        }
    }
    
    var cellArray = [Int]()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cvSkeleton.reloadData()
        
        
        
        let gradient = SkeletonGradient(baseColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        cvSkeleton.showAnimatedGradientSkeleton(usingGradient: gradient)
        cvSkeleton.showAnimatedSkeleton()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        
        //timer?.invalidate()
        cvSkeleton.stopSkeletonAnimation()
        cvSkeleton.hideSkeleton()
    }
    
    @objc func runTimedCode(){
        print("call cv reload= \(cellArray.count)")
        cellArray.append(1)
        if cellArray.count == 6{
            cvSkeleton.stopSkeletonAnimation()
            cvSkeleton.hideSkeleton()
            self.view.hideSkeleton()
            cvSkeleton.removeFromSuperview()
            
        }
        //cvSkeleton.reloadData()
    }
    
    

}

extension Collectionview: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/3 - 10, height: view.frame.width/3 - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

// MARK: - SkeletonCollectionViewDataSource

extension Collectionview: SkeletonCollectionViewDataSource {
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "CollectionViewCell"
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
            return cell
        
    }
}

/*
extension Collectionview:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        return cell
    }
    
    
}

*/
class CollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var lbl:UILabel!
    
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        isSkeletonable = true
        createLabel()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createLabel() {
        label = UILabel()
        label.isSkeletonable = true
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: frame.height / 2),
            label.widthAnchor.constraint(equalToConstant: frame.width / 2)
            ])
    }
    
    
}
