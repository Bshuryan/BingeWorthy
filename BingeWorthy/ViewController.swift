//
//  ViewController.swift
//  BingeWorthy
//
//  Created by Brian Shuryan on 9/17/19.
//  Copyright © 2019 Brian Shuryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let showNames = [
        "The Haunting of Hill House",
        "The Crown",
        "Stranger Things",
        "Ozark",
        "Gypsy",
        "Jessica Jones",
        "The Innocents",
        "Sense8",
        "Mindhunter",
        "Daredevil",
        "Narcos",
        "House of Cards",
        "Chilling Adventures of Sabrina",
        "BoJack Horseman",
        "The Punisher",
        "Altered Carbon",
        "Anne",
        "3%",
        "Bloodline",
        "The OA",
        "The End of the F***ing World",
        "Godless",
        "Alias Grace",
        "Castlevania",
        "Orange Is the New Black",
        "Rick and Morty",
        "Firefly",
        "Fargo",
        "It's Always Sunny in Philadelphia",
        "Twin Peaks",
        "South Park",
        "Letterkenny",
        "The Simpsons",
        "The Shield",
        "Young Justice",
        "Vikings",
        "Line of Duty",
        "Archer",
        "Taboo",
        "Twin Peaks",
        "Brooklyn Nine-Nine",
        "Modern Family",
        "Futurama",
        "Homeland",
        "Prison Break",
        "Legion",
        "Lucifer",
        "Black Sails",
        "Workaholics",
        "Brockmire",
        "Informer",
        "Tom Clancy's Jack Ryan",
        "Bosch",
        "The Man in the High Castle",
        "Homecoming",
        "Sneaky Pete",
        "Good Omens",
        "The Lord of the Rings",
        "Tin Star",
        "Goliath",
        "Absentia",
        "Lore",
        "Forever",
        "Mad Dogs",
        "Carnival Row",
        "Electric Dreams",
        "Fortitude",
        "White Dragon",
        "Hand of God",
        "Fearless",
        "The Last Post",
        "Jean-Claude Van Johnson",
        "Mirzapur",
        "Alpha House",
        "One Mississippi",
        "Game of Thrones",
        "Silicon Valley",
        "True Detective",
        "The Sopranos",
        "The Wire",
        "Ballers",
        "True Blood",
        "Band of Brothers",
        "The Leftovers",
        "Deadwood",
        "Sex and the City",
        "Boardwalk Empire",
        "Curb Your Enthusiasm",
        "Rome",
        "Entourage",
        "Veep",
        "Six Feet Under",
        "Oz",
        "The Newsroom",
        "The Pacific",
        "Big Love",
        "John Adams",
        "In Treatment",
        "Togetherness",
        "Getting On"]
    
    var searchedShowName = [String]()
    var searching = false
    var myIndex = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    //Prepare the view controller at the end of the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue"
        {
            let vc = segue.destination as! ViewController2
            
            let name = showNames[myIndex]
            let data = getShowData(show: name)
            vc.showNameText = data[0]
            vc.seasonsText = data[4]
            vc.overviewText = data[3]
            vc.genreText = data[2]
            vc.streamerText = data[1]
            vc.showImageText = data[5]
            vc.recomArray = getShowRecs(show: name)
        }
    }
    
}

//Gives the number of rows in the tableview
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if searching
        {
            return(searchedShowName.count)
        }
        else
        {
            return(showNames.count)
        }
    }
//Fills in the rows of with the elements from the list
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        if searching
        {
            cell.textLabel?.text = searchedShowName[indexPath.row]
        }
        else
        {
            cell.textLabel?.text = showNames[indexPath.row]
        }
        return cell
    }
    
 //Once the row is selected load the segue named "segue" to the next view controller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }

}

//takes the info added into the search bar and searches the tableview
extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedShowName = showNames.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
    
}
