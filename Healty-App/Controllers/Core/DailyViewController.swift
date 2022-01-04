//
//  DailyViewController.swift
//  Healty-App
//
//  Created by BaranK Kutlu on 14.12.2021.
//


import UIKit

class DailyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var resultModel: FoodResultResponse?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 4
        case 2:
            return 4
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            let shuffleButton = UIButton(frame: CGRect(x: view.frame.size.width - 120, y: 15, width: 80, height: 30))
            shuffleButton.setTitle("Shuffle", for: .normal)
            shuffleButton.layer.cornerRadius = 4
            shuffleButton.backgroundColor = .systemBlue
            shuffleButton.addTarget(self, action: #selector(buttonTapped1), for: .touchUpInside)
            
            let doneButton = UIButton(frame: CGRect(x: view.frame.size.width - 220, y: 15, width: 80, height: 30))
            doneButton.setTitle("Done", for: .normal)
            doneButton.layer.cornerRadius = 4
            doneButton.backgroundColor = .systemBlue
            doneButton.addTarget(self, action: #selector(doneButton1Clicked), for: .touchUpInside)
            
            
            let label = UILabel(frame: CGRect(x: 10, y: 10, width: 80, height: 40))
            label.attributedText = NSAttributedString(string: "Sabah", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .bold)])
            label.textColor = .systemBlue
            label.textAlignment = .center
            
            let headerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
            headerView.backgroundColor = .secondarySystemFill
            headerView.addSubview(shuffleButton)
            headerView.addSubview(doneButton)
            headerView.addSubview(label)
            return headerView
        } else if section == 1 {
            let shuffleButton = UIButton(frame: CGRect(x: view.frame.size.width - 120, y: 15, width: 80, height: 30))
            shuffleButton.setTitle("Shuffle", for: .normal)
            shuffleButton.layer.cornerRadius = 4
            shuffleButton.backgroundColor = .systemBlue
            shuffleButton.addTarget(self, action: #selector(buttonTapped2), for: .touchUpInside)
            
            let doneButton = UIButton(frame: CGRect(x: view.frame.size.width - 220, y: 15, width: 80, height: 30))
            doneButton.setTitle("Done", for: .normal)
            doneButton.layer.cornerRadius = 4
            doneButton.backgroundColor = .systemBlue
            doneButton.addTarget(self, action: #selector(doneButton2Clicked), for: .touchUpInside)
            
            
            let label = UILabel(frame: CGRect(x: 10, y: 10, width: 80, height: 40))
            label.attributedText = NSAttributedString(string: "Öğlen", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .bold)])
            label.textColor = .systemBlue
            label.textAlignment = .center
            
            let headerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
            headerView.backgroundColor = .secondarySystemFill
            headerView.addSubview(shuffleButton)
            headerView.addSubview(doneButton)
            headerView.addSubview(label)
            return headerView
        } else if section == 2 {
            let shuffleButton = UIButton(frame: CGRect(x: view.frame.size.width - 120, y: 15, width: 80, height: 30))
            shuffleButton.setTitle("Shuffle", for: .normal)
            shuffleButton.layer.cornerRadius = 4
            shuffleButton.backgroundColor = .systemBlue
            shuffleButton.addTarget(self, action: #selector(buttonTapped3), for: .touchUpInside)
            
            let doneButton = UIButton(frame: CGRect(x: view.frame.size.width - 220, y: 15, width: 80, height: 30))
            doneButton.setTitle("Done", for: .normal)
            doneButton.layer.cornerRadius = 4
            doneButton.backgroundColor = .systemBlue
            doneButton.addTarget(self, action: #selector(doneButton3Clicked), for: .touchUpInside)
            
            let label = UILabel(frame: CGRect(x: 10, y: 10, width: 80, height: 40))
            label.attributedText = NSAttributedString(string: "Akşam", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .bold)])
            label.textColor = .systemBlue
            label.textAlignment = .center
            
            let headerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
            headerView.backgroundColor = .secondarySystemFill
            headerView.addSubview(shuffleButton)
            headerView.addSubview(doneButton)
            headerView.addSubview(label)
            return headerView
        }
        
        return UIView()
        
    }
    
    
    @objc func buttonTapped1(sender: UIButton) {
        parseJson1()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @objc func buttonTapped2(sender: UIButton) {
        parseJson2()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @objc func buttonTapped3(sender: UIButton) {
        parseJson3()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @objc func doneButton1Clicked() {
        print("done1")
        
        let strokeCalorie = Float(0.33)
        let labelCalorie = "\(strokeCalorie)"
        let doneString = "First step is done !"
        
        
        let calorieDict: [String: Any] = ["doneCalorie": strokeCalorie,
                                              "labelCalorie": labelCalorie,
                                              "doneString": doneString
        ]
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NewFunctionName"), object: nil, userInfo: calorieDict)
    }
    
    @objc func doneButton2Clicked() {
        print("done2")
        let strokeCalorie = Float(0.66)
        let labelCalorie = "\(strokeCalorie)"
        let doneString = "Last step hang on !"
        
        
        
        let calorieDict: [String: Any] = ["doneCalorie": strokeCalorie,
                                              "labelCalorie": labelCalorie,
                                              "doneString": doneString
        ]
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NewFunctionName"), object: nil, userInfo: calorieDict)
    }
    
    @objc func doneButton3Clicked() {
        print("done3")
        let strokeCalorie = Float(1.0)
        let labelCalorie = "\(strokeCalorie)"
        let doneString = "You are done today !"
        
        
        let calorieDict: [String: Any] = ["doneCalorie": strokeCalorie,
                                              "labelCalorie": labelCalorie,
                                              "doneString": doneString
        ]
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NewFunctionName"), object: nil, userInfo: calorieDict)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as! TableViewCell
        
        
        if resultModel != nil {
            switch indexPath.section {
            case 0:
                switch indexPath.row {
                case 0:
                    cell.configureCellLayOut(with: Food(name: nameKahvaltilik!, gr: Int(grKahvaltilik!), cal: Int(calKahvaltilik!), portion: Int(portionKahvaltilik!), portion_name: portionNameKahvaltilik!))
                    
                case 1:
                    cell.configureCellLayOut(with: Food(name: nameEkmek!, gr: Int(grEkmek!), cal: Int(calEkmek!), portion: Int(portionEkmek!), portion_name: portionNameEkmek!))
                case 2:
                    cell.configureCellLayOut(with: Food(name: nameSut!, gr: Int(grSut!), cal: Int(calSut!), portion: Int(portionSut!), portion_name: portionNameSut!))
                default:
                    break
                }
            case 1:
                switch indexPath.row {
                case 0:
                    cell.configureCellLayOut(with: Food(name: nameEt!, gr: Int(grEt!), cal: Int(calEt!), portion: Int(portionEt!), portion_name: portionNameEt!))
                case 1:
                    cell.configureCellLayOut(with: Food(name: nameBaklagil!, gr: Int(grBaklagil!), cal: Int(calBaklagil!), portion: Int(portionBaklagil!), portion_name: portionNameBaklagil!))
                case 2:
                    cell.configureCellLayOut(with: Food(name: nameSebze!, gr: Int(grSebze!), cal: Int(calSebze!), portion: Int(portionSebze!), portion_name: portionNameSebze!))
                case 3:
                    cell.configureCellLayOut(with: Food(name: nameMeyve!, gr: Int(grMeyve!), cal: Int(calMeyve!), portion: Int(portionMeyve!), portion_name: portionNameMeyve!))
                default:
                    break
                }
            case 2:
                switch indexPath.row {
                case 0:
                    cell.configureCellLayOut(with: Food(name: nameSebzeYemegi!, gr: Int(grSebzeYemegi!), cal: Int(calSebzeYemegi!), portion: Int(portionSebzeYemegi!), portion_name: portionNameSebzeYemegi!))
                case 1:
                    cell.configureCellLayOut(with: Food(name: nameYogurt!, gr: Int(grYogurt!), cal: Int(calYogurt!), portion: Int(portionYogurt!), portion_name: portionNameYogurt!))
                case 2:
                    cell.configureCellLayOut(with: Food(name: nameKuruyemis!, gr: Int(grKuruyemis!), cal: Int(calKuruyemis!), portion: Int(portionKuruyemis!), portion_name: portionNameKuruyemis!))
                case 3:
                    cell.configureCellLayOut(with: Food(name: nameCorba!, gr: Int(grCorba!), cal: Int(calCorba!), portion: Int(portionCorba!), portion_name: portionNameCorba!))
                default:
                    break
                }
                
            default:
                break
            }
            
            
        }
        
        else if UserDefaults.standard.object(forKey: "nameKahvaltilik") != nil {
            let nameKahvaltilikx = UserDefaults.standard.object(forKey: "nameKahvaltilik") as? String
            let portionKahvaltilikx = UserDefaults.standard.object(forKey: "portionKahvaltilik") as? Int
            let portionNameKahvaltilikx = UserDefaults.standard.object(forKey: "portionNameKahvaltilik") as? String
            let grKahvaltilikx = UserDefaults.standard.object(forKey: "grKahvaltilik") as? Int
            let calKahvaltilikx = UserDefaults.standard.object(forKey: "calKahvaltilik") as? Int

            let nameEkmekx = UserDefaults.standard.object(forKey: "nameEkmek") as? String
            let portionEkmekx = UserDefaults.standard.object(forKey: "portionEkmek") as? Int
            let portionNameEkmekx = UserDefaults.standard.object(forKey: "portionNameEkmek") as? String
            let grEkmekx = UserDefaults.standard.object(forKey: "grEkmek") as? Int
            let calEkmekx = UserDefaults.standard.object(forKey: "calEkmek") as? Int

            let nameSutx = UserDefaults.standard.object(forKey: "nameSut") as? String
            let portionSutx = UserDefaults.standard.object(forKey: "portionSut") as? Int
            let portionNameSutx = UserDefaults.standard.object(forKey: "portionNameSut") as? String
            let grSutx = UserDefaults.standard.object(forKey: "grSut") as? Int
            let calSutx = UserDefaults.standard.object(forKey: "calSut") as? Int

            let nameEtx = UserDefaults.standard.object(forKey: "nameEt") as? String
            let portionEtx = UserDefaults.standard.object(forKey: "portionEt") as? Int
            let portionNameEtx = UserDefaults.standard.object(forKey: "portionNameEt") as? String
            let grEtx = UserDefaults.standard.object(forKey: "grEt") as? Int
            let calEtx = UserDefaults.standard.object(forKey: "calEt") as? Int

            let nameBaklagilx = UserDefaults.standard.object(forKey: "nameBaklagil") as? String
            let portionBaklagilx = UserDefaults.standard.object(forKey: "portionBaklagil") as? Int
            let portionNameBaklagilx = UserDefaults.standard.object(forKey: "portionNameBaklagil") as? String
            let grBaklagilx = UserDefaults.standard.object(forKey: "grBaklagil") as? Int
            let calBaklagilx = UserDefaults.standard.object(forKey: "calBaklagil") as? Int

            let nameSebzex = UserDefaults.standard.object(forKey: "nameSebze") as? String
            let portionSebzex = UserDefaults.standard.object(forKey: "portionSebze") as? Int
            let portionNameSebzex = UserDefaults.standard.object(forKey: "portionNameSebze") as? String
            let grSebzex = UserDefaults.standard.object(forKey: "grSebze") as? Int
            let calSebzex = UserDefaults.standard.object(forKey: "calSebze") as? Int

            let nameMeyvex = UserDefaults.standard.object(forKey: "nameMeyve") as? String
            let portionMeyvex = UserDefaults.standard.object(forKey: "portionMeyve") as? Int
            let portionNameMeyvex = UserDefaults.standard.object(forKey: "portionNameMeyve") as? String
            let grMeyvex = UserDefaults.standard.object(forKey: "grMeyve") as? Int
            let calMeyvex = UserDefaults.standard.object(forKey: "calMeyve") as? Int

            let nameSebzeYemegix = UserDefaults.standard.object(forKey: "nameSebzeYemegi") as? String
            let portionSebzeYemegix = UserDefaults.standard.object(forKey: "portionSebzeYemegi") as? Int
            let portionNameSebzeYemegix = UserDefaults.standard.object(forKey: "portionNameSebzeYemegi") as? String
            let grSebzeYemegix = UserDefaults.standard.object(forKey: "grSebzeYemegi") as? Int
            let calSebzeYemegix = UserDefaults.standard.object(forKey: "calSebzeYemegi") as? Int

            let nameKuruyemisx = UserDefaults.standard.object(forKey: "nameKuruyemis") as? String
            let portionKuruyemisx = UserDefaults.standard.object(forKey: "portionKuruyemis") as? Int
            let portionNameKuruyemisx = UserDefaults.standard.object(forKey: "portionNameKuruyemis") as? String
            let grKuruyemisx = UserDefaults.standard.object(forKey: "grKuruyemis") as? Int
            let calKuruyemisx = UserDefaults.standard.object(forKey: "calKuruyemis") as? Int

            let nameCorbax = UserDefaults.standard.object(forKey: "nameCorba") as? String
            let portionCorbax = UserDefaults.standard.object(forKey: "portionCorba") as? Int
            let portionNameCorbax = UserDefaults.standard.object(forKey: "portionNameCorba") as? String
            let grCorbax = UserDefaults.standard.object(forKey: "grCorba") as? Int
            let calCorbax = UserDefaults.standard.object(forKey: "calCorba") as? Int

            let nameYogurtx = UserDefaults.standard.object(forKey: "nameYogurt") as? String
            let portionYogurtx = UserDefaults.standard.object(forKey: "portionYogurt") as? Int
            let portionNameYogurtx = UserDefaults.standard.object(forKey: "portionNameYogurt") as? String
            let grYogurtx = UserDefaults.standard.object(forKey: "grYogurt") as? Int
            let calYogurtx = UserDefaults.standard.object(forKey: "calYogurt") as? Int

            switch indexPath.section {
            case 0:
                switch indexPath.row {
                case 0:
                    cell.configureCellLayOut(with: Food(name: nameKahvaltilikx!, gr: grKahvaltilikx!, cal: calKahvaltilikx!, portion: portionKahvaltilikx!, portion_name: portionNameKahvaltilikx!))

                case 1:
                    cell.configureCellLayOut(with: Food(name: nameEkmekx!, gr: grEkmekx!, cal: calEkmekx!, portion: portionEkmekx!, portion_name: portionNameEkmekx!))
                case 2:
                    cell.configureCellLayOut(with: Food(name: nameSutx!, gr: grSutx!, cal: calSutx!, portion: portionSutx!, portion_name: portionNameSutx!))
                default:
                    break
                }
            case 1:
                switch indexPath.row {
                case 0:
                    cell.configureCellLayOut(with: Food(name: nameEtx!, gr: grEtx!, cal: calEtx!, portion: portionEtx!, portion_name: portionNameEtx!))
                case 1:
                    cell.configureCellLayOut(with: Food(name: nameBaklagilx!, gr: grBaklagilx!, cal: calBaklagilx!, portion: portionBaklagilx!, portion_name: portionNameBaklagilx!))
                case 2:
                    cell.configureCellLayOut(with: Food(name: nameSebzex!, gr: grSebzex!, cal: calSebzex!, portion: portionSebzex!, portion_name: portionNameSebzex!))
                case 3:
                    cell.configureCellLayOut(with: Food(name: nameMeyvex!, gr: grMeyvex!, cal: calMeyvex!, portion: portionMeyvex!, portion_name: portionNameMeyvex!))
                default:
                    break
                }
            case 2:
                switch indexPath.row {
                case 0:
                    cell.configureCellLayOut(with: Food(name: nameSebzeYemegix!, gr: grSebzeYemegix!, cal: calSebzeYemegix!, portion: portionSebzeYemegix!, portion_name: portionNameSebzeYemegix!))
                case 1:
                    cell.configureCellLayOut(with: Food(name: nameYogurtx!, gr: grYogurtx!, cal: calYogurtx!, portion: portionYogurtx!, portion_name: portionNameYogurtx!))
                case 2:
                    cell.configureCellLayOut(with: Food(name: nameKuruyemisx!, gr: grKuruyemisx!, cal: calKuruyemisx!, portion: portionKuruyemisx!, portion_name: portionNameKuruyemisx!))
                case 3:
                    cell.configureCellLayOut(with: Food(name: nameCorbax!, gr: grCorbax!, cal: calCorbax!, portion: portionCorbax!, portion_name: portionNameCorbax!))
                default:
                    break
                }

            default:
                break
            }
        }

        
        
        return cell
    }
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Generate Meal List", for: .normal)
        button.layer.cornerRadius = 8.0
        button.backgroundColor = .blue
        return button
    }()
    
    
    
    private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        return tableView
    }()
    
    var calorie = 0
    
    
    var nameKahvaltilik: String?
    var portionKahvaltilik: Int?
    var portionNameKahvaltilik: String?
    var grKahvaltilik: Int?
    var calKahvaltilik: Int?
    
    var nameEkmek: String?
    var portionEkmek: Int?
    var portionNameEkmek: String?
    var grEkmek: Int?
    var calEkmek: Int?
    
    var nameSut: String?
    var portionSut: Int?
    var portionNameSut: String?
    var grSut: Int?
    var calSut: Int?
    
    var nameEt: String?
    var portionEt: Int?
    var portionNameEt: String?
    var grEt: Int?
    var calEt: Int?
    
    var nameBaklagil: String?
    var portionBaklagil: Int?
    var portionNameBaklagil: String?
    var grBaklagil: Int?
    var calBaklagil: Int?
    
    var nameSebze: String?
    var portionSebze: Int?
    var portionNameSebze: String?
    var grSebze: Int?
    var calSebze: Int?
    
    var nameMeyve: String?
    var portionMeyve: Int?
    var portionNameMeyve: String?
    var grMeyve: Int?
    var calMeyve: Int?
    
    var nameSebzeYemegi: String?
    var portionSebzeYemegi: Int?
    var portionNameSebzeYemegi: String?
    var grSebzeYemegi: Int?
    var calSebzeYemegi: Int?
    
    var nameKuruyemis: String?
    var portionKuruyemis: Int?
    var portionNameKuruyemis: String?
    var grKuruyemis: Int?
    var calKuruyemis: Int?
    
    var nameCorba: String?
    var portionCorba: Int?
    var portionNameCorba: String?
    var grCorba: Int?
    var calCorba: Int?
    
    var nameYogurt: String?
    var portionYogurt: Int?
    var portionNameYogurt: String?
    var grYogurt: Int?
    var calYogurt: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Daily"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(button)
        
        
        
        
        
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = CGRect(x: 10, y: view.safeAreaInsets.top + 10, width: view.frame.size.width - 20, height: view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom - 40)
        button.frame = CGRect(x: 60, y: tableView.frame.height + view.safeAreaInsets.top - 10, width: view.frame.size.width - 120, height: 40)
    }
    
    @objc func buttonClicked() {

        parseJson()
    }
    
    
    
    
    
    //Parse Json
    
    private func parseJson() {
        let token = UserDefaults.standard.value(forKey: "token") as! String
        print("button clicked")
        APICaller.shared.getFoods(token: token) { response in
            switch response {
            case .success(let model):
                print("successss")
                self.resultModel = model
                self.parseJson1()
                self.parseJson2()
                self.parseJson3()
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
        
        
    }
    
    
    
    func parseJson1() {
        var sabah = calorie / 3
              
        var kahvaltilik = sabah / 3
        var tahil = sabah / 3
        var sutUrunleri = sabah / 3
        
        let ogunYemekleri = resultModel?.data.map {
            let title = $0.title
            let Food = $0.foods
            
            switch title {
            case "Kahvaltılık":
                let firstFood = Food.randomElement()
                let sumCal = Double(kahvaltilik) / Double(firstFood!.cal)
                nameKahvaltilik = firstFood!.name
                portionKahvaltilik = Int(Double((firstFood!.portion)) * sumCal)
                portionNameKahvaltilik = firstFood!.portion_name
                grKahvaltilik = Int(Double((firstFood!.gr)) * sumCal)
                calKahvaltilik = Int(Double((firstFood!.cal)) * sumCal)
                
                UserDefaults.standard.setValue(nameKahvaltilik, forKey: "nameKahvaltilik")
                UserDefaults.standard.setValue(portionKahvaltilik, forKey: "portionKahvaltilik")
                UserDefaults.standard.setValue(portionNameKahvaltilik, forKey: "portionNameKahvaltilik")
                UserDefaults.standard.setValue(grKahvaltilik, forKey: "grKahvaltilik")
                UserDefaults.standard.setValue(calKahvaltilik, forKey: "calKahvaltilik")
                
            case "Tahıl ve Ekmek":
                let firstFood = Food.randomElement()
                let sumCal = Double(tahil) / Double(firstFood!.cal)
                nameEkmek = firstFood!.name
                portionEkmek = Int(Double((firstFood!.portion)) * sumCal)
                portionNameEkmek = firstFood!.portion_name
                grEkmek = Int(Double((firstFood!.gr)) * sumCal)
                calEkmek = Int(Double((firstFood!.cal)) * sumCal)
                
                UserDefaults.standard.setValue(nameEkmek, forKey: "nameEkmek")
                UserDefaults.standard.setValue(portionEkmek, forKey: "portionEkmek")
                UserDefaults.standard.setValue(portionNameEkmek, forKey: "portionNameEkmek")
                UserDefaults.standard.setValue(grEkmek, forKey: "grEkmek")
                UserDefaults.standard.setValue(calEkmek, forKey: "calEkmek")
                
            case "Süt Ürünleri":
                let firstFood = Food.randomElement()
                let sumCal = Double(sutUrunleri) / Double(firstFood!.cal)
                nameSut = firstFood!.name
                portionSut = Int(Double((firstFood!.portion)) * sumCal)
                portionNameSut = firstFood!.portion_name
                grSut = Int(Double((firstFood!.gr)) * sumCal)
                calSut = Int(Double((firstFood!.cal)) * sumCal)
                
                UserDefaults.standard.setValue(nameSut, forKey: "nameSut")
                UserDefaults.standard.setValue(portionSut, forKey: "portionSut")
                UserDefaults.standard.setValue(portionNameSut, forKey: "portionNameSut")
                UserDefaults.standard.setValue(grSut, forKey: "grSut")
                UserDefaults.standard.setValue(calSut, forKey: "calSut")
            
            default: break
            }
        }
        
            
        
    }
    
    func parseJson2() {
        var oglen = calorie / 3
        
        var etUrunleri = oglen / 3
        var baklagil = oglen / 3
        var buhardaSebze = oglen / 6
        var meyveOglen = oglen / 6
        
        let ogunYemekleri = resultModel?.data.map {
            let title = $0.title
            let Food = $0.foods
            
            switch title {
                
            case "Et Ürünleri":
                let firstFood = Food.randomElement()
                let sumCal = Double(etUrunleri) / Double(firstFood!.cal)
                nameEt = firstFood!.name
                portionEt = Int(Double((firstFood!.portion)) * sumCal)
                portionNameEt = firstFood!.portion_name
                grEt = Int(Double((firstFood!.gr)) * sumCal)
                calEt = Int(Double((firstFood!.cal)) * sumCal)
                
                UserDefaults.standard.setValue(nameEt, forKey: "nameEt")
                UserDefaults.standard.setValue(portionEt, forKey: "portionEt")
                UserDefaults.standard.setValue(portionNameEt, forKey: "portionNameEt")
                UserDefaults.standard.setValue(grEt, forKey: "grEt")
                UserDefaults.standard.setValue(calEt, forKey: "calEt")
                
            case "Baklagil":
                let firstFood = Food.randomElement()
                let sumCal = Double(baklagil) / Double(firstFood!.cal)
                nameBaklagil = firstFood!.name
                portionBaklagil = Int(Double((firstFood!.portion)) * sumCal)
                portionNameBaklagil = firstFood!.portion_name
                grBaklagil = Int(Double((firstFood!.gr)) * sumCal)
                calBaklagil = Int(Double((firstFood!.cal)) * sumCal)
                
                UserDefaults.standard.setValue(nameBaklagil, forKey: "nameBaklagil")
                UserDefaults.standard.setValue(portionBaklagil, forKey: "portionBaklagil")
                UserDefaults.standard.setValue(portionNameBaklagil, forKey: "portionNameBaklagil")
                UserDefaults.standard.setValue(grBaklagil, forKey: "grBaklagil")
                UserDefaults.standard.setValue(calBaklagil, forKey: "calBaklagil")
                
            case "Buharda Sebze":
                let firstFood = Food.randomElement()
                let sumCal = Double(buhardaSebze) / Double(firstFood!.cal)
                nameSebze = firstFood!.name
                portionSebze = Int(Double((firstFood!.portion)) * sumCal)
                portionNameSebze = firstFood!.portion_name
                grSebze = Int(Double((firstFood!.gr)) * sumCal)
                calSebze = Int(Double((firstFood!.cal)) * sumCal)
                
                UserDefaults.standard.setValue(nameSebze, forKey: "nameSebze")
                UserDefaults.standard.setValue(portionSebze, forKey: "portionSebze")
                UserDefaults.standard.setValue(portionNameSebze, forKey: "portionNameSebze")
                UserDefaults.standard.setValue(grSebze, forKey: "grSebze")
                UserDefaults.standard.setValue(calSebze, forKey: "calSebze")
                
            case "Meyve":
                let firstFood = Food.randomElement()
                let sumCal = Double(meyveOglen) / Double(firstFood!.cal)
                nameMeyve = firstFood!.name
                portionMeyve = Int(Double((firstFood!.portion)) * sumCal)
                portionNameMeyve = firstFood!.portion_name
                grMeyve = Int(Double((firstFood!.gr)) * sumCal)
                calMeyve = Int(Double((firstFood!.cal)) * sumCal)
                
                UserDefaults.standard.setValue(nameMeyve, forKey: "nameMeyve")
                UserDefaults.standard.setValue(portionMeyve, forKey: "portionMeyve")
                UserDefaults.standard.setValue(portionNameMeyve, forKey: "portionNameMeyve")
                UserDefaults.standard.setValue(calMeyve, forKey: "calMeyve")
                UserDefaults.standard.setValue(grMeyve, forKey: "grMeyve")
            
            default: break
            }
        }
        
            
        
    }
        
    func parseJson3() {
        var aksam = calorie / 3
        
        var sebzeYemegi = aksam / 3
        var kuruyemis = aksam / 3
        var yogurtUrunleri = aksam / 6
        var corbalar = aksam / 6
    
        let ogunYemekleri = resultModel?.data.map {
            let title = $0.title
            let Food = $0.foods
            
            switch title {
                
            case "Sebze Yemeği":
                let firstFood = Food.randomElement()
                let sumCal = Double(sebzeYemegi) / Double(firstFood!.cal)
                nameSebzeYemegi = firstFood!.name
                portionSebzeYemegi = Int(Double((firstFood!.portion)) * sumCal)
                portionNameSebzeYemegi = firstFood!.portion_name
                grSebzeYemegi = Int(Double((firstFood!.gr)) * sumCal)
                calSebzeYemegi = Int(Double((firstFood!.cal)) * sumCal)
                
                UserDefaults.standard.setValue(nameSebzeYemegi, forKey: "nameSebzeYemegi")
                UserDefaults.standard.setValue(portionSebzeYemegi, forKey: "portionSebzeYemegi")
                UserDefaults.standard.setValue(portionNameSebzeYemegi, forKey: "portionNameSebzeYemegi")
                UserDefaults.standard.setValue(grSebzeYemegi, forKey: "grSebzeYemegi")
                UserDefaults.standard.setValue(calSebzeYemegi, forKey: "calSebzeYemegi")
                
            case "Kuruyemiş":
                let firstFood = Food.randomElement()
                let sumCal = Double(kuruyemis) / Double(firstFood!.cal)
                nameKuruyemis = firstFood!.name
                portionKuruyemis = Int(Double((firstFood!.portion)) * sumCal)
                portionNameKuruyemis = firstFood!.portion_name
                grKuruyemis = Int(Double((firstFood!.gr)) * sumCal)
                calKuruyemis = Int(Double((firstFood!.cal)) * sumCal)
                
                UserDefaults.standard.setValue(nameKuruyemis, forKey: "nameKuruyemis")
                UserDefaults.standard.setValue(portionKuruyemis, forKey: "portionKuruyemis")
                UserDefaults.standard.setValue(portionNameKuruyemis, forKey: "portionNameKuruyemis")
                UserDefaults.standard.setValue(grKuruyemis, forKey: "grKuruyemis")
                UserDefaults.standard.setValue(calKuruyemis, forKey: "calKuruyemis")
                
            case "Yogurt Ürünleri":
                let firstFood = Food.randomElement()
                let sumCal = Double(yogurtUrunleri) / Double(firstFood!.cal)
                nameYogurt = firstFood!.name
                portionYogurt = Int(Double((firstFood!.portion)) * sumCal)
                portionNameYogurt = firstFood!.portion_name
                grYogurt = Int(Double((firstFood!.gr)) * sumCal)
                calYogurt = Int(Double((firstFood!.cal)) * sumCal)
                
                UserDefaults.standard.setValue(nameYogurt, forKey: "nameYogurt")
                UserDefaults.standard.setValue(portionYogurt, forKey: "portionYogurt")
                UserDefaults.standard.setValue(portionNameYogurt, forKey: "portionNameYogurt")
                UserDefaults.standard.setValue(grYogurt, forKey: "grYogurt")
                UserDefaults.standard.setValue(calYogurt, forKey: "calYogurt")
                
            case "Çorbalar":
                let firstFood = Food.randomElement()
                let sumCal = Double(corbalar) / Double(firstFood!.cal)
                nameCorba = firstFood!.name
                portionCorba = Int(Double((firstFood!.portion)) * sumCal)
                portionNameCorba = firstFood!.portion_name
                grCorba = Int(Double((firstFood!.gr)) * sumCal)
                calCorba = Int(Double((firstFood!.cal)) * sumCal)
                
                UserDefaults.standard.setValue(nameCorba, forKey: "nameCorba")
                UserDefaults.standard.setValue(portionCorba, forKey: "portionCorba")
                UserDefaults.standard.setValue(portionNameCorba, forKey: "portionNameCorba")
                UserDefaults.standard.setValue(grCorba, forKey: "grCorba")
                UserDefaults.standard.setValue(calCorba, forKey: "calCorba")
            
            default: break
            }
        }
        
            
        
    }
    
    
}





