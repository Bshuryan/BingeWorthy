//
//  RecSys.swift
//  BingeWorthy
//
//  Created by Brian Shuryan on 11/16/19.
//  Copyright © 2019 Brian Shuryan. All rights reserved.
//

import Foundation

/*
 The function 'getShowRecs' takes an input as a String and outputs an array of Strings. If the input string is found as a valid show, an array of the top six recommendations based on the input will be returned in order of most to least similar. An empty array will be returned if the input is invalid.
 */
func getShowRecs(show:String) -> [String] {
    let recs_path = Bundle.main.path(forResource: "tv_recs_full", ofType: "csv")
    
    if recs_path == nil {
        print("path not found")
        return []
    }
    
    
    
    do {
        let contents = try String(contentsOfFile: recs_path!, encoding: .utf8)
        let rows = contents.components(separatedBy: "\n")
        for row in rows {
            let columns = row.components(separatedBy: ";")
            if columns[0].lowercased() == show.lowercased() {
                var show_recs = columns[1]
                show_recs = show_recs.replacingOccurrences(of: "'", with: "")
                show_recs = show_recs.replacingOccurrences(of: "[", with: "")
                show_recs = show_recs.replacingOccurrences(of: "]", with: "")
                show_recs = show_recs.replacingOccurrences(of: "\r", with: "")

                let show_lst = show_recs.components(separatedBy: ",")
                var show_lst_clean:[String] = []
                for show in show_lst{
                    let show_cln = show.trimmingCharacters(in: .whitespacesAndNewlines)
                    show_lst_clean.append(show_cln)
                }
                
                return show_lst_clean
            }
        }
        
        
        
    } catch{
        print(error)
    }
    return []
}
