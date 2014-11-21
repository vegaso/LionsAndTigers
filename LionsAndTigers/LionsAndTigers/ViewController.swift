//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Kevin Owens on 11/20/14.
//  Copyright (c) 2014 Kevin Owens. All rights reserved.
//

import UIKit





class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    
    var myTigers:[Tiger] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myTiger = Tiger() //creation of instance of struct Tiger.swift
        
       
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage(named:"BengalTiger.jpg")
        
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named:"IndochineseTiger.jpg")
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named:"MalayanTiger.jpg")
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named:"SiberianTiger.jpg")
        
        myTigers.append(myTiger)
        myTigers += [secondTiger, thirdTiger, fourthTiger]
        
         println("My Tiger's name is: \(myTiger.name), it's age is \(myTiger.age), its' breed is \(myTiger.breed), and the image is \(myTiger.image)")
        myImageView.image = myTiger.image
        nameLabel.text = myTiger.name
        ageLabel.text = "\(myTiger.age)"
        breedLabel.text = myTiger.breed
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItem(sender: AnyObject) {
        let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        let tiger = myTigers[randomIndex]
        myImageView.image = tiger.image
        nameLabel.text = tiger.name
        ageLabel.text = "\(tiger.age)"
        breedLabel.text = tiger.breed
       
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations:
            {
                self.myImageView.image = tiger.image
                self.nameLabel.text = tiger.name
                self.ageLabel.text = "\(tiger.age)"
                self.breedLabel.text = tiger.breed
            }, completion: { (finished: Bool) -> () in
        })
        
    }


}

