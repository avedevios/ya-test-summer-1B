//
//  main.swift
//  ya-test-summer-1B
//
//  Created by ake11a on 08.09.2022.
//

import Foundation

var str = "/../"

//str = readLine()!

func deleteSlash(str: String) -> String {
    var ans = ""
    var countSlash = 0
    var firstSimbol = true
    
    for sim in str {
        if firstSimbol {
            if sim != "/" {
                ans.append("/")
            }
            firstSimbol = false
        }
        
        if sim == "/" {
            if countSlash < 1 {
                ans.append("/")
                countSlash += 1
            }
        } else {
            ans.append(sim)
            countSlash = 0
        }
    }
    
    return ans
}

if str.count > 0 {
    
    if str.first != "/" {
        str = "/" + str
    }

    str += "/"
    var flag = true
    while flag {
        if str.contains("/./") {
            str = str.replacingOccurrences(of: "/./", with: "/")
        } else if str.contains("//") {
            str = str.replacingOccurrences(of: "//", with: "/")
        } else if str.contains("/../") {
            for i in 0...str.count - 1 {
                if String(str[i] + str[i+1] + str[i+2] + str[i+3]) == "/../" {
                    break
                }
            }
            str = str[i + 3>...]
        } else {
            flag = false
        }
    }
    
    if str.count > 1 && str.last! == "/" {
        print(str.dropLast())
    } else {
        print (str)
    }
} else {
    print ("/")
}


