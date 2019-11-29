//
//  ShowData.swift
//  BingeWorthy
//
//  Created by Brian Shuryan on 11/26/19.
//  Copyright © 2019 Brian Shuryan. All rights reserved.
//

import Foundation


/*
The method 'getShowData' takes an input String and outputs an array of Strings. If the input string is found in the list of available TV shows, an array will be returned in the following format:
 
 [Show Name, Platform Available On, Genre(s), Show description, Number of seasons, Image Link]
 
 */
func getShowData(show:String) -> [String] {
    let recs_path = Bundle.main.path(forResource: "tv_data_all", ofType: "csv")
    
    if recs_path == nil {
        print("path not found")
        return []
    }
    
    
    
    do {
        let contents = try String(contentsOfFile: recs_path!, encoding: .utf8)
        let rows = contents.components(separatedBy: "\n")
        for row in rows {
            //print(row)
            let columns = row.components(separatedBy: ";")
            if columns[0].lowercased() == show.lowercased() {
                var show_info = columns[1]
                show_info = show_info.replacingOccurrences(of: "'", with: "")
                show_info = show_info.replacingOccurrences(of: "[", with: "")
                show_info = show_info.replacingOccurrences(of: "]", with: "")
                show_info = show_info.replacingOccurrences(of: "\r", with: "")

                let show_list = show_info.components(separatedBy: ",")
                var show_list_clean:[String] = []
                for show in show_list{
                    var show_clean = show.trimmingCharacters(in: .whitespacesAndNewlines)
                    show_clean = show_clean.replacingOccurrences(of: "^", with: "'")
                    show_clean = show_clean.replacingOccurrences(of: "`", with: ",")
                    show_list_clean.append(show_clean)
                }
                
                return show_list_clean
            }
        }
        
        
        
    } catch{
        print(error)
    }
    return []
}
