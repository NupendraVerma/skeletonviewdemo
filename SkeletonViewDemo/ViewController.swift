//
//  ViewController.swift
//  SkeletonViewDemo
//
//  Created by Manmeetsingh Sethi on 31/07/19.
//  Copyright © 2019 Manmeetsingh Sethi. All rights reserved.
//

import UIKit
import SkeletonView

class ViewController: UIViewController,SkeletonTableViewDelegate {

    @IBOutlet weak var tblDemo:UITableView!{
        didSet {
            tblDemo.rowHeight = UITableView.automaticDimension
            tblDemo.estimatedRowHeight = 120.0
        }
    }
    
    override func viewDidLayoutSubviews() {
        //view.layoutSkeletonIfNeeded()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //view.showAnimatedSkeleton()
    }

    
    var timer: Timer?
    var cellArray = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tblDemo.isSkeletonable = true
        let gradient = SkeletonGradient(baseColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        //tblDemo.showGradientSkeleton(usingGradient: gradient)
        tblDemo.showAnimatedGradientSkeleton()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        
        //timer?.invalidate()
    }
    
    @objc func runTimedCode(){
        print("call tbl reload= \(cellArray.count)")
        cellArray.append(1)
        if cellArray.count == 6{
            //tblDemo.stopSkeletonAnimation()
            tblDemo.hideSkeleton()
        }
        tblDemo.reloadData()
    }
}

extension ViewController: SkeletonTableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20//cellArray.count
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "demoCell"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "demoCell", for: indexPath) as! Cell
//        cell.label1.text = "cell => \(indexPath.row)"
        let cell = tableView.dequeueReusableCell(withIdentifier: "demoCell")
        
        return cell!
    }
}
/*
extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "demoCell")
        
        return cell!
    }
    
    
}*/
