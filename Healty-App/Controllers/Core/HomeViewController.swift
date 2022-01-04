//
//  HomeViewController.swift
//  Healty-App
//
//  Created by BaranK Kutlu on 14.12.2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    let labelx: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 80))
        label.attributedText = NSAttributedString(string: "Let's begin !", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 24, weight: .heavy)])
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    
    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        label.text = ""
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    
    
    var calorie: Double = 0.0
    var doneCalorie: Double = 0.0
    
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    
    private var startPoint = CGFloat(-Double.pi / 2)
    private var endPoint = CGFloat(3 * Double.pi / 2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.addSubview(label)
        view.addSubview(labelx)
        label.center = view.center
        
        
        
        createCircularPath()
        
        ifVarsa()
        
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateCircle), name: Notification.Name("NewFunctionName"), object: nil)
        
        
        
    }
    
    func ifVarsa() {
        
        guard let gelenLabelCal = UserDefaults.standard.string(forKey: "calorieLabel") else {
            return
        }
        
        guard let gelenCalorie = UserDefaults.standard.object(forKey: "doneCalorie") else {
            return
        }
        
        guard let gelenLabel = UserDefaults.standard.object(forKey: "doneString")  else {
            return
        }
        
        
        labelx.text = gelenLabel as! String
        label.text = gelenLabelCal
        
        DispatchQueue.main.async {
            self.createCaloriePath(strokeEnd: gelenCalorie as! CGFloat)
        }
        
        
    }
    
    
    @objc func didUpdateCircle(_ notification: NSNotification, strokeEnd: CGFloat) {
        
        if let dict = notification.userInfo as NSDictionary? {
            if let calorie = dict["doneCalorie"] as? Float {
                createCaloriePath(strokeEnd: CGFloat(calorie))
                UserDefaults.standard.setValue(calorie, forKey: "doneCalorie")
                print(calorie)
            }
            
            
            if let calorieLabel = dict["labelCalorie"] as? String {
                UserDefaults.standard.setValue(calorieLabel, forKey: "calorieLabel")
                DispatchQueue.main.async {
                    self.label.text = calorieLabel
                }
                
                
            }
            
            if let doneString = dict["doneString"] as? String {
                UserDefaults.standard.setValue(doneString, forKey: "doneString")
                DispatchQueue.main.async {
                    self.labelx.text = doneString
                }
            }
            
        }
        
    }
    
    
    
    override func viewWillLayoutSubviews() {
        labelx.frame = CGRect(x: 20, y: 120, width: view.frame.size.width - 40, height: 60)
    }
    
    func createCaloriePath(strokeEnd: CGFloat) {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: view.frame.size.width / 2.0, y: view.frame.size.height / 2.0), radius: 100, startAngle: startPoint, endAngle: endPoint, clockwise: true)
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 20.0
        progressLayer.strokeEnd = strokeEnd
        progressLayer.strokeColor = UIColor.systemPink.cgColor
        view.layer.addSublayer(progressLayer)
    }
    
    func createCircularPath() {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: view.frame.size.width / 2.0, y: view.frame.size.height / 2.0), radius: 100, startAngle: startPoint, endAngle: endPoint, clockwise: true)
        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 20.0
        circleLayer.strokeEnd = 1.0
        circleLayer.strokeColor = UIColor.white.cgColor
        view.layer.addSublayer(circleLayer)
        
    }
    
    
//    func progressAnimation(fromValue: Double, toValue: Double) {
//        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
//        circularProgressAnimation.duration = 3
//        circularProgressAnimation.fromValue = fromValue
//        circularProgressAnimation.toValue = toValue
//
//        circularProgressAnimation.fillMode = .forwards
//        circularProgressAnimation.isRemovedOnCompletion = false
//        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
//    }
    
    
}


