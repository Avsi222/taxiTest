//
//  CitiesCollectionViewController.swift
//  TaxiTest
//
//  Created by Арсений Дорогин on 16/05/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CitiesCollectionViewController: UICollectionViewController {

    var citiesArray = [cities]()
    var loader:UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader = UIActivityIndicatorView(frame: CGRect(x: view.frame.width/2, y: view.frame.height/2, width: 20, height: 20))
        loader.startAnimating()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        loaddata()

        // Do any additional setup after loading the view.
    }

    
    //MARK: - Load cities
    func loaddata(){
        apiService.loadCities { (result, error) in
            if error != nil{
                return
            }
            print(result)
            self.citiesArray = result!
            DispatchQueue.main.async {
                self.loader.startAnimating()
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loaddata()
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return citiesArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CitiesCollectionViewCell
        let index = indexPath.row
        cell.cityNameLabel.text = citiesArray[index].city_name
    
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    var selectedCity:cities!
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCity = citiesArray[indexPath.row]
        performSegue(withIdentifier: "showMap", sender: nil)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is MapViewController{
            let vc = segue.destination as! MapViewController
            vc.city = selectedCity
        }
    }
}
